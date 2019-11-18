require 'rails_helper'

RSpec.describe StaticsController, type: :controller do

  context "hello_world" do
    it "should respond in English by default" do
      get :hello_world
      expect(response.body).to eq("Hello World")
    end

    it "should respond in es" do
      get :hello_world, params: {language: "es"}
      expect(response.body).to eq("Hola Mundo")
    end
  end

  context "grade" do
    it "should respond with an A" do
      get :grade, params: {score: 90}
      result = JSON.parse(response.body)
      expect(result["grade"]).to eq("A")
    end

    it "should respond with a C" do
      get :grade, params: {score: 75}
      result = JSON.parse(response.body)
      expect(result["grade"]).to eq("C")
    end

    it "should return 422 (unprocessable entity) for less than 0" do
      get :grade, params: {score: -1}
      expect(response.status).to eq(422)
    end

    it "should return 422 (unprocessable entity) for greater than 100" do
      get :grade, params: {score: 101}
      expect(response.status).to eq(422)
    end
  end

  context "pluralizer" do
    it "should pluralize 2 of a thing" do
      get :pluralizer, params: {number: 2, noun: 'cat'}
      expect(response.body).to eq("2 cats")
    end

    it "should not pluralize 1 of a thing" do
      get :pluralizer, params: {number: 1, noun: 'dog'}
      expect(response.body).to eq("1 dog")
    end

    it "should handle 1 irregular noun thing (goose/geese)" do
      get :pluralizer, params: {number: 1, noun: 'goose'}
      expect(response.body).to eq("1 goose")
    end

    it "should handle 2 irregular noun things (goose/geese)" do
      get :pluralizer, params: {number: 2, noun: 'goose'}
      expect(response.body).to eq("2 geese")
    end
  end

end
