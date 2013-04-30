# encoding: utf-8

class UploadController < ApplicationController
  def create
    params.permit :imgFile
    image = PostImage.new(file: params[:imgFile])
    if image.save
      render json: {'error' => 0, 'url' => image.file.url}
    else
      render json: {'error' => 1, 'message' => "系统错误"}
    end
  end
end