// Description:
//   Utility commands surrounding Hubot uptime.
//
// Commands:
//   ping - Reply with pong
//   echo <text> - Reply back with <text>
//   time - Reply with current time
'use strict';

module.exports = (robot) => {
  robot.respond(/PING$/i, (res) => {
    res.send('PONG');
  });

  robot.respond(/ADAPTER$/i, (res) => {
    res.send(robot.adapterName);
  });

  robot.respond(/ECHO (.*)$/i, (res) => {
    res.send(res.match[1]);
  });

  robot.respond(/TIME$/i, (res) => {
    res.send(`Server time is: ${new Date()}`);
  });
};
