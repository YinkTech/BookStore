## BookStore
This is a Bookstore app that allows users to add there book in the different categories and also uncategorized. as the user may desire. Each users cannot see each other registered books.

##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [3.0.1](https://github.com/ruby/ruby/tree/ruby_3_1)
- Rails [7.0.1](https://github.com/rails/rails/tree/v7.0.1)

## 1. Check out the repository
```shell+
git clone [git@github.com:YinkTech/BookStore.git](https://github.com/YinkTech/BookStore/tree/development)
cd BookStore
```

## 2. Check your Ruby version

```shell
ruby -v
```

The ouput should start with `ruby 3.0.1`

## 3. Install dependencies

Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):

```shell
bundle && yarn
```

## 4. Initialize the database

```shell
rails db:create db:migrate db:seed
```
## 5. Start the server

Start the server by running:

```ruby
rails s
```
Navigate to the new route http://127.0.0.1:3000/

## Built With

- Ruby
- Ruby on Rails

## Author
👤 **Author**

- GitHub: [@YinkTech](https://github.com/yinktech)
- Twitter: [@YinkTech](https://twitter.com/yink_tech)
- LinkedIn: [Ayeni Olayinka](https://www.linkedin.com/in/yinktech/)
## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/YinkTech/BookStore/issues).

## Show your support

Give a ⭐️ if you like this project!


*  Gregoire Vella (Design from [Behance](https://www.behance.net/gregoirevella), [Design](https://www.behance.net/gallery/19759151/Snapscan-iOs-design-and-branding))
## 📝 License

This project is [MIT](https://creativecommons.org/licenses/by-nc/4.0/) licensed.