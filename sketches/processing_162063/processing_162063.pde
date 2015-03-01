
int counter;

void setup() {  //setup function called initially, only once
  size(550, 550);
  background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
fill(0, 255, 0);
ellipse(70, 70 , 70 ,70);
fill(255,0 ,0);
rect(90, 90, 90, 90);
fill(0, 0, 255);
triangle(30, 75, 58, 20, 86, 75);
fill(0,255,255)
rect(200,150,150,150);
fill(255, 255, 0);
ellipse(10, 110 , 60 ,60);
fill(255,0,255);
triangle(300, 75, 58, 20, 86, 75);
}
