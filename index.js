const { WebClient, ErrorCode } = require('@slack/web-api');

// Read a token from the environment variables
const token = process.env.SLACK_BOT_TOKEN;

// Initialize
const web = new WebClient(token);

if (!process.argv || process.argv.length < 2) {
  console.log('Missing argument containing slack message');
  process.exit(1);
}

const param = process.argv[2];

if (!param) {
  console.log(`Invalid slack message: '${param}'`);
  process.exit(1);
}

console.log('Input:', param);
const payload = JSON.parse(param);
console.log('Output:', JSON.stringify(payload));

web.chat.postMessage(payload)
  .then((result) => {
    // The result contains an identifier for the message, `ts`.
    console.log(`Successfully send message ${result.ts}`);
  })
  .catch((err) => {
    if (err.code === ErrorCode.PlatformError) {
      console.log(err.data);
    } else {
      console.log(err);
    }
    process.exit(1);
  })
