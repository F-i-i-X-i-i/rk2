class CalcController < ApplicationController
  before_action :assertion, only: [:view]

  def input
  end

  def assertion
    arr = params[:arr]
    if arr.empty?
      flash[:alert] = 'Введите числа!'
      redirect_to action: :input
    end
    arr = arr.split(' ')
    str = '1234567890-'
    arr.each do |i|
      unless i in str then
        flash[:alert] = 'Введен некорректный символ #{i}'
        puts 1
        redirect_to action: :input
      end
    end

  end

  def view
    sum = 0
    arr = params[:arr].split(' ')
    sum_15 = 0
    curr_ind = 0
    desired_ind = -1
    is_desired_ind_found = false


    arr.each do |i|
      if i.to_i % 15 == 0
        sum_15 += i.to_i
      end
      if i.to_i < 0 && !is_desired_ind_found
        desired_ind = curr_ind
        is_desired_ind_found = !is_desired_ind_found
      end
      curr_ind += 1
    end

    if is_desired_ind_found
      arr[desired_ind] = sum_15
    end
    @result = arr
  end
end
