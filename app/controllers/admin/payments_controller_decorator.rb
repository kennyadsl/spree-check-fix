Admin::PaymentsController.class_eval do
  alias old_fire fire
  
  def fire
    load_object
    if event = params[:e] 
      if @payment.payment_method.type == "PaymentMethod::Check" and event == "pay" and @payment.state == "pending"
        @payment.pay
        @payment.order.update!
        redirect_to collection_path
      else
        return old_fire
      end
    end
  end

end

