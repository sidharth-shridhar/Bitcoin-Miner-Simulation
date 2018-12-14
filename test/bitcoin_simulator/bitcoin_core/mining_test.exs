defmodule BitcoinSimulator.BitcoinCore.MiningTest do
  use ExUnit.Case, async: true
  use Timex

  alias BitcoinSimulator.BitcoinCore.{Blockchain, Mining}
  alias BitcoinSimulator.Const







 

  test "get block template" do
    prev_hash = <<227, 176, 196, 66, 152, 252, 28, 20, 154, 251, 244, 200, 153, 111, 185, 36,
      39, 174, 65, 228, 100, 155, 147, 76, 164, 149, 153, 27, 120, 82, 184, 85>>
    block = %Blockchain.Block{
      header: %Blockchain.BlockHeader{
        previous_block_hash: prev_hash,
        merkle_root_hash: Blockchain.merkle_root([]),
        n_bits: Const.decode(:target_difficulty_bits),
      },
      transactions: []
    }

    assert Mining.get_block_template(prev_hash, []) == block
  end

  test "add unconfirmed tx" do
    mempool = %Mining.MemPool{}
    hash = <<227, 176, 196, 66, 152, 252, 28, 20, 154, 251, 244, 200, 153, 111, 185, 36,
      39, 174, 65, 228, 100, 155, 147, 76, 164, 149, 153, 27, 120, 82, 184, 85>>
    mempool = Mining.add_unconfirmed_tx(mempool, %Blockchain.Transaction{}, hash)
    assert Map.has_key?(mempool.unconfirmed_txs, hash)
  end

  test "match leading zeros?" do
    fail = <<227, 176, 196, 66, 152, 252, 28, 20, 154, 251, 244, 200, 153, 111, 185, 36,
      39, 174, 65, 228, 100, 155, 147, 76, 164, 149, 153, 27, 120, 82, 184, 85>>
    success = <<0, 0, 15, 66, 152, 252, 28, 20, 154, 251, 244, 200, 153, 111, 185, 36, 39,
      174, 65, 228, 100, 155, 147, 76, 164, 149, 153, 27, 120, 82, 184, 85>>
    assert Mining.match_leading_zeros?(fail, 20) == false
    assert Mining.match_leading_zeros?(success, 20) == true
  end

end
