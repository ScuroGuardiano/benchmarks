# Parsing JSON, sorting, adding new data and serializing

In file `data.json` there are 1000 records of people data. Data shape is like this:
```ts
{
    id: int,
    first_name: string,
    last_name: string,
    email: string,
    ip_address: string,
    age: int
}
```

The code's job is to:
* read all records and parse them into objects
* sort them by age, ascending
* add field `full_name` which will be `<first_name> <last_name>`
* add field `can_drink` of type `boolean`. If age is `18` or more it should be true, otherwise false.
* serialize data into JSON and save it to file in `results` directory in your language directory.

Because dataset is small, repeat that 1000 times.

# Results

Okey this was really trivial example, for the moment I have:
| technology/language | real | user | sys |
|---------------------|------|------|-----|
| node#1 | 3.611s | 4.192s | 0.711s |
| node#2 | 3.743s | 4.357s | 0.667s |
| node#3 | 3.640s | 4.215s | 0.722s |
| dart#1 | 5.421s | 5.301s | 0.673s |
| dart#2 | 5.675s | 5.371s | 0.654s |
| dart#3 | 5.778s | 5.298s | 0.745s |
| cpp-nlohmann#1 | 3.985s | 3.640s | 0.325s |
| cpp-nlohmann#2 | 4.036s | 3.681s | 0.323s |
| cpp-nlohmann#3 | 4.022s | 3.701s | 0.285s |

Yea node was the fastest but it was little unfair and c++ used less resources. Because test was repeated 1000x with 1000x read and write to file node had an advantage with it's asynchronous I/O. This test was a little bit too trivial but heck, node impresses me tbh. I must come out with something more complex to test those languages.
