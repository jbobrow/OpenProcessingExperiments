
import processing.dxf.*;


void setup( )
{
  size(300, 300);
  background(0);   // This sets the background colour to black
  smooth();

  fill(252, 245, 3); // This makes/fills the star with yellow
  stroke (255);  // This makes the star have a white boarder
  star(5 // changing this value will change the amount of points the star will have (must have a vaule of 3 or above, although when set to 3 it creates a triangle). 
       , 150, 150, 200, 200, -PI / 2.0, 0.50); // -90 degrees

}

void star(int n, float cx, float cy, float r, float proportion)
{
  star(n, cx, cy, 2.0 * r, 2.0 * r, 0.0, proportion);
}
void star(int n, float cx, float cy, float w, float h,
  float startAngle, float proportion)
{
  if (n > 2)
  {
    float angle = TWO_PI/ (2 *n);  // twice as many sides
    float dw; // draw width
    float dh; // draw height
    
    w = w / 2.0;
    h = h / 2.0;
    
    beginShape();
    for (int i = 0; i < 2 * n; i++)
    {
      dw = w;
      dh = h;
      if (i % 2 == 1) // for odd vertices, use short radius
      {
        dw = w * proportion;
        dh = h * proportion;
      }
      vertex(cx + dw * cos(startAngle + angle * i),
        cy + dh * sin(startAngle + angle * i));
    }
    endShape(CLOSE);
  }
}


