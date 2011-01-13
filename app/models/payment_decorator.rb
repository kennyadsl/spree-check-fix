Payment.class_eval do

  alias old_actions actions
  
  def actions
    return old_actions if payment_source
    ["pay"]
  end
  
  def pay
    started_processing
    complete
  end
  
end
