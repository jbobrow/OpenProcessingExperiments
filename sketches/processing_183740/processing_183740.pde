
int Y_AXIS = 1;
int X_AXIS = 1;
int RAD = 1;
color a1, a2, b1, b2, c1, c2, d1, d2;
PImage black;
PFont NexaBold;
String s = "CANDLECANDLECANDLECANDLECANDLECANDLECANDLECANDLECANDLECANDLECANDLECANDLECANDLECANDLECANDLECANDLECANDLECANDLECANDLEC";
void setup()
{
  size(600, 600);

  NexaBold = loadFont("NexaBold-48.vlw");

  a1 = color(60); // PODIUM
  a2 = color(0);

  
  
  

  c1 = color(255); // CANDLE
  c2 = color(255, 255, 150);

  d1 = color(255, 0, 0); // FLAME
  d2 = color(255, 255, 0);

  black = loadImage("black.png");
}

void draw()
{
  background(100);

  float dis = dist(width/2, height/2, 300, 300);
  float inter4 = map(dis, 0, 300, 0, 155);
  
  b1 = color(255, 255, 100); // BACKGROUND
  b2 = color(255, 100 + inter4, 100);
  
  pushMatrix();
  //translate(width/2, height/2);
  setGradient(0, 0, width, height, b1, b2, RAD);
  popMatrix();


  noStroke();
  fill(0);
  textFont(NexaBold);
  textSize(11);
  text("PODIUMPODIUMPODIUMPODIUMPODIUM",207,600);
  //setGradient(210, 591, 200, 20, a1, a2, X_AXIS); //GROUND

  
  fill(255, 255, 150);
  textSize(17);
  text(s,276, 335, 60, 264);
  //setGradient(280, 340, 60, 250, c1, c2, X_AXIS); //CANDLE
  //rect(280, 340, 60, 250);

  stroke(255, 120, 120); 
  fill(255, 120, 0);
  bezier(295, 268, 251, 399, 397, 339, 299, 265);
  
  float disM = dist(width/2, height/2, mouseX, mouseY);
  float inter5 = map(disM, 0, 450, 0, 1);
  pushMatrix();
  translate(height/2,width/2);
  imageMode(CENTER);
  
  scale(0.3+inter5);
  image(black,0,0);
  popMatrix();
}


void setGradient(int x, int y, float w, float h, color c1, color c2, int axis)
{
  noFill();

  if (axis == X_AXIS) // Side to side
  {
    for (int i = x; i <= x+w; i++) 
    {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  } else if (axis == Y_AXIS)  // Top to bottom gradient
  { 
    for (int i = y; i <= y+h; i++) 
    {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }
  if (axis == RAD)  // gRADiant
  { 
    for (int i = y; i <= w*2.5; i++)
    {
      float inter2 = map(i, 0, 600, 0, 1);
      color c = lerpColor(c1, c2, inter2);
      stroke(c);
      ellipse(width/2, height/2, i, i);
    }
  }
}



