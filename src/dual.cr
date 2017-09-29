require "./dual/*"

module Dual
  class Number
    property real : Float64
    property dual : Float64

    def initialize(real : Float64, dual : Float64)
      @real = real
      @dual = dual
    end

    def *(x : Dual::Number)
      Dual::Number.new(real * x.real, real * x.dual + dual * x.real)
    end

    def -(x : Dual::Number)
      Dual::Number.new(real * x.real, real * x.dual + dual * x.real)
    end

    def +(x : Dual::Number)
      Dual::Number.new(real + x.real, dual + x.dual)
    end

    def **(power : Float64)
      Dual::Number.new(real ** power, real * power * (real ** (power - 1)))
    end
  end
end

result = Dual::Number.new(3.0, 1.0) * Dual::Number.new(3.0, 1.0)
p result
