class GourmetsController < ApplicationController
  before_action :authenticate_user!, only: [:top, :index, :new, :create]
  
  def top
  end

  def index
    @gourmets = Gourmet.all
      if params[:search] == nil
      @gourmets = params[:tag_id].present? ? Tag.find(params[:tag_id]).gourmets : Gourmet.all
      elsif params[:search] == ''
      @gourmets = params[:tag_id].present? ? Tag.find(params[:tag_id]).gourmets : Gourmet.all
      else
      @gourmets = Gourmet.where("storename LIKE ? OR menu LIKE ? OR place LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
      end
    @gourmets = @gourmets.page(params[:page]).per(3)

  end
  

  def new
    @gourmet = Gourmet.new
  end
    
  def create
    gourmet = Gourmet.new(gourmet_params)
    gourmet.user_id = current_user.id
    if gourmet.save!
        redirect_to :action => "index"
    else
          redirect_to :action => "new"
    end
  end

  def show
    @gourmet = Gourmet.find_by(id: params[:id])
    @comments = @gourmet.comments
    @comment = Comment.new
  end

  def edit
    @gourmet = Gourmet.find(params[:id])
  end

  def update
    gourmet = Gourmet.find(params[:id])
      if gourmet.update(gourmet_params)
        redirect_to :action => "show", :id => gourmet.id
      else
      redirect_to :action => "new"
      end
  end
    
  def destroy
    gourmet = Gourmet.find(params[:id])
    gourmet.destroy
    redirect_to action: :index
  end

  def Hokkaido
    @Hokkaido = Gourmet.where(prefecture:"北海道")
  end
      
  def Tokyo
    @Tokyo = Gourmet.where(prefecture:"東京")
  end
      
  def Osaka
    @Osaka = Gourmet.where(prefecture:"大阪")
  end

  def Fukuoka
    @Fukuoka = Gourmet.where(prefecture:"福岡")
  end

  def Ginghiskhan
    @Ginghiskhan = Gourmet.where(food:"ジンギスカン")
  end

  def Kaisendon
    @Kaisendon = Gourmet.where(food:"海鮮丼")
  end

  def Sappororamen
    @Sappororamen = Gourmet.where(food:"札幌ラーメン")
  end

  def Hokkaidoelse
    @Hokkaidoelse = Gourmet.where(food:"その他")
  end

  def Edomaezushi
    @Edomaezushi = Gourmet.where(food:"江戸前寿司")
  end

  def Monzyayaki
    @Monzyayaki = Gourmet.where(food:"もんじゃ焼き")
  end

  def Chankonabe
    @Chankonabe = Gourmet.where(food:"ちゃんこ鍋")
  end

  def Tokyoelse
    @Tokyoelse = Gourmet.where(food:"その他")
  end

  def Takoyaki
    @Takoyaki = Gourmet.where(food:"たこ焼き")
  end

  def Okonomiyaki
    @Okonomiyaki = Gourmet.where(food:"お好み焼き")
  end

  def Kushikatu
    @Kushikatu = Gourmet.where(food:"串カツ")
  end

  def Osakaelse
    @Osakaelse = Gourmet.where(food:"その他")
  end

  def Motunabe
    @Motunabe = Gourmet.where(food:"もつ鍋")
    @Motunabe = @Motunabe.page(params[:page]).per(6)
  end

  def Hakataramen
    @Hakataramen = Gourmet.where(food:"博多ラーメン")
  end

  def Mizutaki
    @Mizutaki = Gourmet.where(food:"水炊き")
  end

  def Fukuokaelse
    @Fukuokaelse = Gourmet.where(food:"その他")
  end

  private
    def gourmet_params
      params.require(:gourmet).permit(:prefecture, :food, :shop_name, :about_shop, :price, :address, :image, :tag_ids, :overall, :level, :lat, :lng)
    end
end