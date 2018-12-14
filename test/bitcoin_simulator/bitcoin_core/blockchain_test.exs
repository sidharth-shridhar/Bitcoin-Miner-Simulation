defmodule BitcoinSimulator.BitcoinCore.BlockchainTest do
  use ExUnit.Case, async: true

  alias BitcoinSimulator.BitcoinCore.Blockchain
  alias BitcoinSimulator.Const

  test "get new blockchain" do
    hash_digest = Const.decode(:hash_digest)
    {:ok, datetime, 0} = DateTime.from_iso8601("2018-11-20T00:00:00Z")
    genesis_block = %Blockchain.Block{
      header: %Blockchain.BlockHeader{
        previous_block_hash: <<0::size(hash_digest)>>,
        merkle_root_hash: <<93, 246, 224, 226, 118, 19, 89, 211, 10, 130, 117, 5, 142, 41, 159, 204, 3,
          129, 83, 69, 69, 245, 92, 244, 62, 65, 152, 63, 93, 76, 148, 86>>,
        time: datetime,
        n_bits: 0,
        nonce: 0
      },
      transactions: []
    }

    blockchain = %{
      blocks: Map.new(),
      transactions: Map.new(),
      block_count: 0,
      genesis_block: nil,
      tip: nil
    }

    blockchain = %{blockchain |
      blocks: Map.put(blockchain.blocks, Blockchain.block_header_hash(genesis_block.header), genesis_block),
      transactions: Map.new(),
      block_count: 1,
      genesis_block: genesis_block,
      tip: genesis_block
    }

    target = Blockchain.get_new_blockchain()
    assert Map.size(target.blocks) == Map.size(blockchain.blocks)
    assert target.block_count == 1
    assert target.genesis_block == target.tip
    assert target.genesis_block == genesis_block
  end

  


  test "transaction hash" do
    tx_in = %Blockchain.Txin{
      previous_output: %{
        hash: :crypto.hash(Const.decode(:hash_func), "test_in"),
        index: 0
      }
    }

    tx_out = %Blockchain.Txout{
      value: 10.0,
      address: :crypto.hash(Const.decode(:hash_func), "test_out"),
    }

    public_key = :crypto.hash(Const.decode(:hash_func), "test_key")

    {:ok, time} = DateTime.from_unix(1_464_096_368)
    transaction = %Blockchain.Transaction{
      in_count: 1,
      tx_in: [tx_in],
      out_count: 1,
      tx_out: [tx_out],
      time: time,
      public_keys: [public_key]
    }

    assert Blockchain.transaction_hash(transaction) == <<32, 241, 165, 87, 37, 152, 91, 4, 231, 22, 207, 55, 15, 167, 229, 221, 177,
      145, 240, 54, 42, 226, 15, 147, 34, 114, 125, 192, 94, 187, 251, 143>>
  end

 

 

 

end
