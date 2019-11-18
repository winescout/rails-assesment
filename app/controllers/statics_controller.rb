class StaticsController < ApplicationController
  def hello_world
    if params[:language] == "es"
      render html: "Hola Mundo"
    else
      render html: "Hello World"
    end
  end

  def grade
    score = params[:score].to_i
    if score < 0 || score > 100
      render(json: {error: "invalid score"}, status: 422) and return
    elsif score >= 90
      grade = "A"
    else
      grade = "C"
    end
    render json: {grade: grade}
  end

  def pluralizer
    irregulars = {"goose" => "geese"}

    if params[:number].to_i == 1
      render html: "1 #{params[:noun]}"
    elsif irregulars.keys.include?(params[:noun])
      render html: "#{params[:number]} #{irregulars[params[:noun]]}"
    else
      render html: "#{params[:number]} #{params[:noun]}s"
    end
  end
end
