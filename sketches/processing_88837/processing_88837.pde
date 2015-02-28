
//inputs for function "drawSpinner" r,g,b,and frame rate

float fr, a, b, c, d, e, f, g;
int i, j;
void setup()
{
  size(500, 500);
}



void draw() 
{

  drawSpinner(50, 200, 60, 6);
}




void drawSpinner(float r1, float g1, float b1, int fspeed) {

  // background (255, 100, 40);

  background (a, f, d);

  if ((mouseX > width/2 +10 || mouseX < width/2 -10) && (mouseY > height/2 +10 || mouseY < height/2 -10)) {

    background (c*500/width, a*500/width, e*500/width);
    frameRate (fspeed);
    a = random (500);
    b = random (500);
    c = random (500);
    d = random (500);
    e = random (500);
    f = random (500);
    g = random (500);
    fill (r1, g1, g*255/width);
    triangle (a, b, e, g, b, d);
    fill (r1, e*255/width, b1);
    quad (g, b, e, f, a, b, f, e);
    fill (g*255/width, g1, e*255/width);
    ellipse(b, f, d, a);
  }
}
