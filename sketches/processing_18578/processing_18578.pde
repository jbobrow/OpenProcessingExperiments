
float x, y;
float size = 40;

void setup() 
{
  size(250,250);
  noStroke();
  frameRate(30);
  smooth();
}

void draw() 
{
  background(30);
  x = x + 0.8;    //moves circles across screen
  
  if (x > width + size) {
    x = -size;     //loops
  } 
  
  translate(x, height/2-size/2); //moves it across screen horizontally
  fill(255);
  noStroke ();
fill (255, 10);
for (int x = 0; x < width; x+=2) { //
  ellipse (random(x), height / 5, random(150),random(150));
}
}

