
int counter;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
rect(150, 120, 250, 250);
stroke(250,0,0);
fill(150);
ellipse(210, 200, 70, 70);
ellipse(350, 200, 70, 70);}
