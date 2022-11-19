const fs = require("fs/promises");
const { join } = require("path");

let count = 0;

async function task() {
    const data = await fs.readFile(join(__dirname, '..', 'data.json'));
    const parsed = JSON.parse(data.toString('utf8'));
    const sorted = parsed.sort((a, b) => a.age - b.age);
    sorted.forEach(el => {
        el.full_name = `${el.first_name} ${el.last_name}`;
        el.can_drink = el.age > 18;
    });
    const serialized = JSON.stringify(parsed);
    await fs.writeFile(join(__dirname, 'results', `result-${count++}.json`), serialized);
}

function benchmark() {
    for (let i = 0; i < 1000; i++) {
        task();
    }
}

benchmark();