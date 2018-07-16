class LinksController < ApplicationController
  # GET /links/:short_url
  def show
    link = Link.find(ShortUrlToId.call(params[:id]))
    render plain: link.original_url
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end

  # POST /links
  def create
    link = Link.new(link_params)

    if link.save
      render plain: IdToShortUrl.call(link.id), status: :created
    else
      head :unprocessable_entity
    end
  end

  private

  def link_params
    params.permit(:original_url)
  end
end
