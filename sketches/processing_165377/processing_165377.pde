

float alpha = 0;

void setup() {  //setup function called initially, only once
 // render (2D);
 size(600, 600, JAVA2D);
 colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
 }

void draw() {  //draw function loops 
  background (255,255,255);
  alpha = alpha + 4;
  
  translate (300,300);
  rotate (radians(alpha));
  
  strokeWeight (4);
  fill (255,0,0);
  ellipse (0,0, 50,80);
}
