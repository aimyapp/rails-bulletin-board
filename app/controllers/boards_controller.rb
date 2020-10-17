class BoardsController < ApplicationController
    # 各アクションが実行される前にset_target_boardが実行される
    before_action :set_target_board, only: %i[show edit update destroy]

    def index
       # pageメソッドを呼ぶことで引数に指定したページに表示するデータを取得
       # デフォルトは1ページ25件 kaminari_config.rb => config.default_per_page = 25
       @boards = Board.page(params[:page])
    end
  
    def new
      @board = Board.new
        # デバッグ開始 dokcer attach webコンテナ(docker-compose psのweb)
        # デバッグ終了 exit → Ctrl + C + Q
        # binding.pry 
    end
  
    def create
      board = Board.create(board_params)
      redirect_to board
    end
  
    def show
    end

    def edit
    end

    def update
        @board.update(board_params)

        redirect_to board
    end

    def destroy
      @board.delete

      redirect_to boards_path
    end

    private
  
    def board_params
      params.require(:board).permit(:name, :title, :body)
    end

    def set_target_board
      @board = Board.find(params[:id])
    end
  end