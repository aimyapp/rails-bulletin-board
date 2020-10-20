class BoardsController < ApplicationController
    # 各アクションが実行される前にset_target_boardが実行される
    before_action :set_target_board, only: %i[show edit update destroy]

    def index
       # pageメソッドを呼ぶことで引数に指定したページに表示するデータを取得
       # デフォルトは1ページ25件 kaminari_config.rb => config.default_per_page = 25
       @boards = Board.page(params[:page])
    end
  
    def new
      @board = Board.new(flash[:board])
        # デバッグ開始 dokcer attach webコンテナ(docker-compose psのweb)
        # デバッグ終了 exit → Ctrl + C + Q
        # binding.pry 
    end
  
    def create
      board = Board.new(board_params)
      if board.save
        # 新規作成時に一度だけ作成完了のメッセージを表示
        flash[:notice] = "「#{board.title}」の掲示板を作成しました"
        redirect_to board
      else
         redirect_to new_board_path, flash: {
           board: board,
           error_messages: board.errors.full_messages
         }
      end
    end
  
    def show
      @comment = Comment.new(board_id: @board.id)
    end

    def edit
    end

    def update
        @board.update(board_params)

        redirect_to board
    end

    def destroy
      @board.destroy
      # 掲示板削除時に一度だけ削除完了のメッセージを表示(redirectの引数に渡している)
      redirect_to boards_path, flash: { notice: "「#{@board.title}」の掲示板が削除されました"}
    end

    private
  
    def board_params
      params.require(:board).permit(:name, :title, :body)
    end

    def set_target_board
      @board = Board.find(params[:id])
    end
  end