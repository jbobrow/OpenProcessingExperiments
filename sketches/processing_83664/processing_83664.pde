
void setup()
{
size(500, 500);
background(43, 3, 157);

}

void draw()
{
 fill(43, 3, 157,100);
  rect(0,0,width,height);
  strokeWeight (5);
point (random(width),random(height)); 
smooth ();
fill (255,255,255);
stroke (255, 255, 255);
strokeWeight (1); 
  ellipse (width/2, height/2, 100, 100);
triangle (210, 225, 250, 100, 290, 225);
triangle (285, 275, 285, 220, 400, 220);
triangle (100, 220, 215, 220, 215, 275);
triangle (200, 270, 255, 298, 170, 400);
triangle (245, 300, 295, 270, 320, 400);
}
