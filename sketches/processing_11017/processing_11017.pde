
//import processing.video.*;
//MovieMaker mm;

PFont font;
float tSize;
String[] t;
int currentLine = -1;
int timing = 4; // number of seconds for each line
int lightness = 70; // decrease for clearer text

void setup()
{
  size(800,200,P2D);
  background(255);
  smooth();
  frameRate(30);
  font = createFont("Times New Roman",width/4);
  //mm = new MovieMaker(this, width, height, "drawing.mov", 30, MovieMaker.ANIMATION, MovieMaker.HIGH);
  t = loadStrings("titles.txt");
  nextLine();
  textFont(font);
  textAlign(CENTER);
  textSize(tSize);
  fill(0);
  text(t[0],width/2,(height+textAscent())/2);
}

void draw() {
  loadPixels();
  int d=0;
  for(int a=0;a<400;a++) {
    int p=int(random(width*height));
    d+=brightness(pixels[p]);
    pixels[p]=color(0);
  }
  updatePixels();
  filter(THRESHOLD,0.79);
  filter(BLUR);
  if(d/400<lightness)
    filter(DILATE);
  else filter(OPAQUE);
  if(frameCount%(timing*30)==0)
  {
    nextLine();
  }
  //mm.addFrame();
  type();
}

float findtSize(int ln)
{
  float w = width;
  float h = height;
  w *= 0.9;
  h *= 0.9;
  float val = 1;
  if (!t[ln].equals(""))
  {
    textFont(font);
    textSize(1);
    for (int x = 2; (textWidth(t[ln])<w)&&(textAscent()+textDescent()<h); x++)
    {
      textSize(x);
      val = x;
    }
  }
  return val;
}

void nextLine()
{
  currentLine++;
  if (currentLine>=t.length)
  {
    currentLine--;
    //mm.finish();
    //exit();
  }
  tSize = findtSize(currentLine);
  filter(BLUR,2);
  filter(INVERT);
}

void type()
{
  textFont(font);
  textAlign(CENTER);
  textSize(tSize);
  fill(255);
  text(t[currentLine],width/2,(height+textAscent())/2);
}

