
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
 background(200,100,0);
 fill(245);
 ellipse(125,200,100,100); //body of creature 
 ellipse(125,130,100,100);  
 ellipse(125,70,100,100);
 rect(150,mouseY,120,30); //arms of creature
 rect(mouseX,150,120,30);
 rect(100,0,50,50);   //technically a square
}
