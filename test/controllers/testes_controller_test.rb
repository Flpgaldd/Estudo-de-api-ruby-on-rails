require "test_helper"

class TestesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @testis = testes(:one)
  end

  test "should get index" do
    get testes_url, as: :json
    assert_response :success
  end

  test "should create testis" do
    assert_difference("Teste.count") do
      post testes_url, params: { testis: { content: @testis.content, title: @testis.title } }, as: :json
    end

    assert_response :created
  end

  test "should show testis" do
    get testis_url(@testis), as: :json
    assert_response :success
  end

  test "should update testis" do
    patch testis_url(@testis), params: { testis: { content: @testis.content, title: @testis.title } }, as: :json
    assert_response :success
  end

  test "should destroy testis" do
    assert_difference("Teste.count", -1) do
      delete testis_url(@testis), as: :json
    end

    assert_response :no_content
  end
end
