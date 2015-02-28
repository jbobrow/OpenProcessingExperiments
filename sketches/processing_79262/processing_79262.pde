
// It's a bit confusing you have to declare these variables out here
// The thing is: if you do it inside the {} of setup, Processing will
// forget them by the end of that function. So then they're gone when
// you run draw(). In order to prevent this, we name them here so they
// are permanent and reachable everywhere.
String[] lines, words;
int[] data;

void setup() {
  size(800, 600);
  frameRate(120);

  // lines is now an array of Strings, equal in length to
  // the number of lines in test.txt.
  // Every String in lines corresponds to the same,
  // well, line in test.txt
  // Fun fact: loadStrings() can also run text files from the internet!
  lines = loadStrings("http://www.cl.cam.ac.uk/~mgk25/ucs/examples/UTF-8-test.txt");

  // concat() takes two arrays and make a new array of them together.
  // array3 = concat(array1, array2);
  // See: http://processing.org/reference/concat_.html
  // Note that there's nothing stopping you from assigning the new
  // array to the old one, which is what we're doing here.
  // We effectively stick a new array to the end of the old one.
  // The new array is made from the words of a line split by comma
  words = lines[0].split(",");
  for (int i= 1; i < lines.length; i++) {
    words = concat(words, lines[i].split(","));
  }

  // Right, so now we have an array, "words", which contains all of the words.
  // Now to turn it into datapoints the computer understands! Since all of
  // numbers in the text are whole numbers, we can use integers: int[] data

  // http://processing.org/reference/append_.html
  // Look at this line of code:
  // array2 = append(array1, variable)
  // what it says is "append takes array1. and makes a new array which copies it,
  // but with variable added to the end of it, which is assigned to array2


  // Now use a loop to go by every String in the word array, and convert it into
  // a number in data. Let's skip all the zeroes.
  data = new int[0];
  for (int i = 0; i < words.length; i++) {
    int datapoint = int(words[i]);

    if (datapoint != 0) {
      data = append(data, datapoint);
    }
  }

  background(0);
  smooth();
}

void draw() {
  // don't worry about what this does for now :P
  fill(((frameCount*3) 0)+56, ((frameCount*7) 0)+56, ((frameCount*11) 0)+56);
  int idx = frameCount
