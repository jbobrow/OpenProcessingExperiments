
float r = 75;
float theta = 0;

void setup()
{
  size(400, 400);
  background(255);
  smooth();
  //offset 0,0 to be in the center of the screen
 

}

void draw()
{
    translate(width/2, height/2);
    float x = r* cos(theta);
    float y = r * sin (theta);
    stroke(0);
    //fill(0);
    ellipse(x, y,16,16);
    theta += 0.1;
}

void mouseDragged()
{
// code that happens when the mouse moves
// with the button down
}

void mousePressed()
{
// code that happens when the mouse button
// is pressed
}

void mouseReleased()
{
// code that happens when the mouse button
// is released
}

