
float r = 200;
float theta = 0;

void setup()
{
  size(800, 800);
  background(#202020);
  smooth();
  //offset 0,0 to be in the center of the screen
 

}

void draw()
{
    translate(width/2, height/2);
    float x = r* cos(theta);
    float y = r * sin (theta);
    //stroke(0);
    fill(#B471ED, 55);
    ellipse(x, y,16,16);
    theta += 0.1;
}

