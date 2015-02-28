
void setup()
{
  size(200,200);
  background(125);
  fill(255);
  noLoop();
  PFont fontA = loadFont("courier");
  textFont(fontA, 14);  
}

void draw(){  
  text("Hello Web!",20,20);
  println("Hello ErrorLog!");
  DrawHexagon(100,100,50)

}

void DrawHexagon(int centreX, int centreY, int side) {
  println(centreX, centreY, side);
}
