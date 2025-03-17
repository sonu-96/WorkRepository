function add(event) {
  console.log('Event:', event);

  let { a = 1, b = 2 } = event?.body ? JSON.parse(event.body) : {};

  return {
    statusCode: 200,
    body: JSON.stringify({ result: a + b }),
  };
}

module.exports.add = add;
