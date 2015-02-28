
float x = 0.0; 
void setup()
{
size(250,250);
smooth();
background (0);
 
}
void draw() {
fill(0);
strokeWeight(0.7);
//moves the origin to the centre of the image
translate(125,125);
//ellipse will be drawn from the centre point
ellipseMode(CENTER);
stroke (255-x,255,255);
//draw two ellipse, one verticle and one horizontal, they start at 220 and then go less by 5 every time.
ellipse(0, 0, 220, 220-x);
ellipse(0, 0, 220-x, 220);
noStroke();
// add 5 to y
  x += 3;
// if position is more than 500
if (x > 220){
// set it to -50
  x = -30.0;
}
}


