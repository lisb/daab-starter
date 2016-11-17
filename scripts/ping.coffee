# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   hubot ping - Reply with pong
#   hubot echo <text> - Reply back with <text>
#   hubot time - Reply with current time
#   hubot die - End hubot process

module.exports = (robot) ->
  robot.respond /PING$/i, (res) ->
    res.send "PONG"

  robot.respond /ADAPTER$/i, (res) ->
    res.send robot.adapterName

  robot.respond /ECHO (.*)$/i, (res) ->
    res.send res.match[1]

  robot.respond /TIME$/i, (res) ->
    res.send "Server time is: #{new Date()}"

  robot.respond /DIE$/i, (res) ->
    res.send "Goodbye, cruel world."
    process.exit 0
