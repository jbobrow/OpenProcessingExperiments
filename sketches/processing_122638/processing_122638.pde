
float counter = 0;
 
void setup()
{
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  
}
 
void draw()
{
 
 background(175, 0, 82);
 
  pushMatrix();
  float b = map(hour(), 0, 24, 0, 100);
  
 
  fill(238, 90, b);
  ellipse(200, 200, 395, 395);
  counter += 0.01; 
  popMatrix();
  
  pushMatrix();
  
  translate(width/2, height/2);
  
  float sec = map(second(), 0, 60, 0, 360);
  
 
  
  rotate(radians(sec)); 
  translate(0, -150); 
  fill(255);
  ellipse(0, 0, 20, 20);
  popMatrix();
  
  pushMatrix();
  fill(120, 242, 174);
  rect(5, 190, 20, 20);
  rect(375, 190, 20, 20);
  rect(195, 5, 20, 20);
  rect(195, 375, 20, 20);
  popMatrix();
  
  translate(width/2, height/2);
float min = map(minute(),0,60,0,360);
 pushMatrix();
   rotate(radians(min));
   fill (44, 242, 227);
   noStroke();
   rect (0, -195, 10, 30);
 popMatrix();
}

