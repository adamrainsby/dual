require "./dual/*"

struct Int32
  def +(number : Dual::Number)
    Dual::Number.new(self.to_f, 0.0) + number
  end

  def *(number : Dual::Number)
    Dual::Number.new(self.to_f, 0.0) * number
  end
end

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
      Dual::Number.new(real - x.real, dual - x.dual)
    end

    def +(x : Dual::Number)
      Dual::Number.new(real + x.real, dual + x.dual)
    end

    def **(power : Float64)
      Dual::Number.new(real ** power, power * (real ** (power - 1)))
    end
  end
end
