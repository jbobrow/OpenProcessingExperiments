
int counter;
int x = 10,y = 10;
void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  

}

void draw() {  //draw function loops 
  //counter++;
  //noStroke();
  //fill(random(255),100,255,50);
  
  fill(255);
    for (int i=0; i<20; i++)
  {
  for (int j=0; j<20; j++)
  {
  rect(i*20, j*20, 20, 20);
  }
  }
  
  x += 10;
  //y += 10;
  //ellipse(x, y, 20, 20);
  fill(0);  
  text("蟻", x, y);

}
