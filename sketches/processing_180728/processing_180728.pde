
int counter;
int color_[]= new int[4];
 

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255,255,255);  //set background white
 // colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  
  //4 colors
  color_[0]= color(random(255),random(255),random(255));
  color_[1]= color(random(255),random(255),random(255));
  color_[2]= color(random(255),random(255),random(255));
  color_[3]=color(random(255),random(255),random(255));

}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(color_[(int)random(3)]);
  
 
    ellipse(random(250),random(250),(int)(randomGaussian()*50), (int)(randomGaussian()*50));
  
}
