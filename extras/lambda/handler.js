exports.handler = async function(event, context, callback) {
  console.log("Received event:", JSON.stringify(event, null, 2));
  callback(null, {
      statusCode: 200,
      body: JSON.stringify({
      message: "Hello World"
      })
  });
}