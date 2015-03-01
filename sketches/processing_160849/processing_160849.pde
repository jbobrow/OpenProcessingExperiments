
int counter;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(150);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() 
{                 //draw function loops 
fill(100,80,90);
stroke(50, 20, 45, 80);
ellipse(400, 100, 135, 135);
rect(150, 150, 150, 150);
triangle(30, 75, 58, 20, 86, 75);
}
