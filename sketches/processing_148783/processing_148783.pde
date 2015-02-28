
//This sketch display a custom fractal made of intricated hexagons

float r=512;  //length of the first iteration hexagon's radius
int cpt=0;  //used to display in the console the number of calls to the recursive function that draws the fractal

void setup()
{
  size(600, 600);
  background(255);
  noFill();
  noLoop();
}

void draw()
{
  translate(width/2, height/2);  //move the origin of next drawing to the center of the window
  rotate(PI/2);
  fractal(r);  //call to the recursive function
  //println(cpt);
  //save("fractal.png");  //uncomment it if you want to save the picture to your computer
}

void fractal(float radius)
{
  radius=radius/2;  //at each iteration the hexagons are 2 times smaller

  if (radius>=8)  //the function is called until the hexagons radius is equal to 8 pixel
  {
    cpt++;  //increment the "call counter"

    pushMatrix();  //draws the right hexagon
    Hexagon(0, 0, radius, 0, 1);
    translate(radius/2, 0);
    fractal(radius);
    popMatrix();

    pushMatrix();  //draws the top left hexagon
    Hexagon(0, 0, radius, 0, 1);
    translate(-radius/4, -radius*cos(radians(30))/2);
    fractal(radius);
    popMatrix();

    pushMatrix();  //draws the bottom left hexagon
    Hexagon(0, 0, radius, 0, 1);
    translate(-radius/4, radius*cos(radians(30))/2);
    fractal(radius);
    popMatrix();
  }
}

void Hexagon(int posX, int posY, float radius, int strokecolor, int strokeweight)  //function that draws an hexagon
{
  float x, y;

  strokeWeight(strokeweight);
  stroke(strokecolor);

  beginShape();

  for (int i=0;i<6;i++)
  {
    x=cos(radians(60*i))*radius+posX;
    y=sin(radians(60*i))*radius+posY;
    vertex(x, y);
  }

  endShape(CLOSE);
}
