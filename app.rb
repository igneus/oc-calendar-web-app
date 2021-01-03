require 'sinatra'
require 'czech_old_catholic_calendar'

get '/' do
  year = COCC::Temporale.for_day(Date.today).year

  redirect "/#{year}"
end

get '/:year' do |year|
  I18n.locale = :cs

  sanctorale = COCC::Data::GENERAL.load_with_parents
  calendar = COCC::Calendar.new(year.to_i, sanctorale)

  erb :index, locals: {calendar: calendar}
end
