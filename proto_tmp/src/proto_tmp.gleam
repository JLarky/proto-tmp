import gleam/io
import gleam/list
import gleam/string
import random_words
import simplifile

pub fn main() -> Nil {
  let words = random_words.word_list
  let path = case words |> list.sample(2) {
    [a, b] -> "/tmp/" <> a <> "-" <> b
    _ -> panic as "Failed to find random words"
  }
  case simplifile.create_directory(path) {
    Ok(Nil) -> io.println(path)
    Error(error) ->
      io.println("Failed to create folder: " <> string.inspect(error))
  }
}
