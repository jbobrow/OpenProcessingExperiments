
PFont font;
float x, y;
float size = 40;

void setup() 
{
  size(250,250);
  noStroke();
  font = loadFont("GillSans-Bold-100.vlw"); //font used
  frameRate(30);
  smooth();
}

void draw() 
{
  background(30);
  textFont(font,280);
  text("5",120,260); //stationary 5 in background
  x = x + 0.8;    //moves type across screen
  
  if (x > width + size) {
    x = -size;     //loops
  } 
  
  translate(x, height/2-size/2); //moves it across screen horizontally
  noStroke ();
fill (255, 10); //very translucent 
for (int x = 0; x < width; x+=2) {
  textFont(font,56);
  text("L",random(x), height/70);
  text("5",random(x), height/10);
  text("C",random(x), height/4);
  
  text("1",random(x), height/3.5);
  text("W",random(x), height/3);

}
}

