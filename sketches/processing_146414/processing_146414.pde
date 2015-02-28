
String input = "Hallo Welt";

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
  float y = height/2 - fontSize / 2;

  int count = 0;
  while (count < input.length ())
  {
    char letter = input.charAt (count);
    text (letter, x, y);
    x += textWidth (letter);
    count++;
  }
}


void keyPressed ()
{
}

