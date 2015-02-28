
String input = "Hallo Welt";

String alphabet = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZzÃ�Ã¤Ã�Ã¼Ã�Ã¶Ã�";

PFont font;
int fontSize;


void setup ()
{
  size (600, 200);
  smooth();


  // println (PFont.list());

  fontSize = 30;
  font = createFont ("Rockwell", fontSize);


  textFont (font, fontSize);

  frameRate (30);
}

void draw ()
{
  background (#57385c);
  float x = width/2 - textWidth (input) / 2;
  float y = height/2 - fontSize*2;

  fill (255);
  noStroke();

  int count = 0;
  while (count < input.length ())
  {
    char letter = input.charAt (count);

    text (letter, x, y);
    x += textWidth (letter);
    count++;
  }

  // Points ----------------------------------------

  fill (#ffedbc);
  count = 0;
  x = width/2 - textWidth (input) / 2;
  y = height/2-fontSize;

  while (count < input.length ())
  {
    char letter = input.charAt (count);
    String letterAsString = str (letter);

    ellipse (x+textWidth(letter)/2, y + alphabet.indexOf (letterAsString), 6, 6);
    x += textWidth (letter);
    count++;
  }

  // Curve----------------------------------------

  noFill ();
  stroke(255);
  strokeWeight (2);
  count = 0;
  x = width/2 - textWidth (input) / 2;
  y = height/2+fontSize;

  char letter = input.charAt (count);
  String letterAsString = str (letter);

  beginShape();
  curveVertex (x+textWidth(letter)/2, y + alphabet.indexOf (letterAsString));
  while (count < input.length ())
  {
    letter = input.charAt (count);
    letterAsString = str (letter);

    curveVertex (x+textWidth(letter)/2, y + alphabet.indexOf (letterAsString));
    x += textWidth (letter);
    count++;
  }
  curveVertex (x+textWidth(letter)/2, y + alphabet.indexOf (letterAsString));
  endShape();
}


void keyPressed ()
{
}

