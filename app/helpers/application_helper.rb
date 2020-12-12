module ApplicationHelper
  def instrument_author(instrument)
    instrument.user == current_user
  end
end
