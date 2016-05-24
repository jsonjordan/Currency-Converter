require 'pry'

class Currency

  GBP_USD = 0.69
  YEN_USD = 109.29
  YEN_GBP = 158.25

  def initialize amount, denomination = :usd
    @amount = amount
    @denomination = denomination
  end

  def is_num? abcdefg   #change when you think of better name than abcdefg
    abcdefg == abcdefg.to_i.to_s.to_i
  end

  def get_rid_of_sign value
    value.split("").drop(1).join.to_i
  end

  def parse
    if is_num? @amount
      Currency.new(@amount, @denomination)
    elsif @amount.split("").first == "$"
      Currency.new((get_rid_of_sign @amount), :usd)
    else
      Currency.new((get_rid_of_sign @amount), :gbp)
    end
  end

  def amount
    @amount
  end

  def denomination
    @denomination
  end

  def match other_currency
    denomination == other_currency.denomination
  end

  def no_match
    puts "The currencys do not match!"
  end

  def times factor
    Currency.new((amount * factor), denomination)
  end

  def plus other_currency
    if match other_currency
      Currency.new((amount + other_currency.amount), denomination)
    elsif (other_currency.denomination == :gbp) && (denomination == :usd)
      Currency.new((amount + (other_currency.to(:usd).amount)), denomination)
    elsif (other_currency.denomination == :usd) && (denomination == :gbp)
      Currency.new((amount + (other_currency.to(:gbp).amount)), denomination)
    end
  end

  def minus other_currency
    if match other_currency
      Currency.new((amount - other_currency.amount), denomination)
    elsif (other_currency.denomination == :gbp) && (denomination == :usd)
      Currency.new((amount - (other_currency.to(:usd).amount)), denomination)
    elsif (other_currency.denomination == :usd) && (denomination == :gbp)
      Currency.new((amount - (other_currency.to(:gbp).amount)), denomination)
    end
  end

  def + other_currency
    if match other_currency
      Currency.new((amount + other_currency.amount), denomination)
    elsif (other_currency.denomination == :gbp) && (denomination == :usd)
      Currency.new((amount + (other_currency.to(:usd).amount)), denomination)
    elsif (other_currency.denomination == :usd) && (denomination == :gbp)
      Currency.new((amount + (other_currency.to(:gbp).amount)), denomination)
    end
  end

  def - other_currency
    if match other_currency
      Currency.new((amount - other_currency.amount), denomination)
    elsif (other_currency.denomination == :gbp) && (denomination == :usd)
      Currency.new((amount - (other_currency.to(:usd).amount)), denomination)
    elsif (other_currency.denomination == :usd) && (denomination == :gbp)
      Currency.new((amount - (other_currency.to(:gbp).amount)), denomination)
    end
  end

  def == other_currency
    if match other_currency
      amount == other_currency.amount
    elsif (other_currency.denomination == :gbp) && (denomination == :usd)
      amount == (other_currency.to(:usd).amount)
    elsif (other_currency.denomination == :usd) && (denomination == :gbp)
      amount == (other_currency.to(:gbp).amount)
    end
  end

  def to convert_to
    if convert_to == denomination
      Currency.new(amount, denomination)
    elsif convert_to == :usd
      Currency.new((amount/GBP_USD).round(2), :usd)
    elsif convert_to == :gbp      #made this an elsif to add ability to add in more currency types later on
      Currency.new((amount*GBP_USD).round(2), :gbp)
    end
  end
end



a = Currency.new(5, :usd)
b = Currency.new(10, :usd)
c = Currency.new(5, :gbp)
d = Currency.new("$5")

binding.pry
