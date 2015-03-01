
float x = 0.0;
float y = 0.0;
float xo,yo=0.0;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  frameRate(60);
}

void draw() {  //draw function loops 
  background(255);
  
  
  pushMatrix();
  
  translate(150+xo,0+yo);

  if(yo > 20)
  {
      xo -= 0.1;
      rotate(x);
  x += 0.04;
  if(x >= HALF_PI)
      x = HALF_PI;
   }

  yo += 0.7;
  
  if(yo > 40)
  {
  yo = 40;
  xo -= 0.8;
  }
  
  if(xo < -150)
  {
  xo = 0;
  yo = 0;
  x = 0;
  }

  fill(96,0,96);
  beginShape();
  vertex(0,0);
  vertex(50,0);
  vertex(25,50);
  vertex(0,0);
  endShape();
  popMatrix();
}
