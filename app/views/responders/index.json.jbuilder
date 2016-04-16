json.set! :responders do
  json.array! @responder  do |responder|
    logger.debug
    json.extract! responder, :type, :name, :capacity
  end
end