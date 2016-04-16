json.set! :emergencies do
  json.array! @emergency  do |emergency|
    logger.debug
    json.extract! emergency, :code, :fire_severity, :medical_severity, :police_severity
  end
end