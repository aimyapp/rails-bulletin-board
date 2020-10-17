class BoardsController < ApplicationController
    def index
        @boards = Board.all
    end
  
    def new
      @board = Board.new
        # デバッグ開始 dokcer attach webコンテナ(docker-compose psのweb)
        # デバッグ終了 exit → Ctrl + C + Q
        # binding.pry 
    end
  
    def create
      Board.create(board_params)
      redirect_to boards_path
    end
  
    def show
        @board = Board.find(params[:id])
    end

    def edit
        @board = Board.find(params[:id])
    end

    def update
        board = Board.find(params[:id])
        board.update(board_params)

        redirect_to board
    end

    private
  
    def board_params
      params.require(:board).permit(:name, :title, :body)
    end
  end