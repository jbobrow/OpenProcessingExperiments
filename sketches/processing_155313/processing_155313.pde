
int counter;
int topRight;
int topLeft;
int botRight;
int botLeft;


void setup() {  //setup function called initially, only once
  size(1000, 1000);
  background(255);  //set background white
  //colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  rectMode(CENTER);
}

void draw() {  //draw function loops 
  counter++;
  //noStroke();
  fill(100,0,100);
  //rect(100,100,50,50);
  if (mousePressed==true) {
  rect(500,500,1000,1000);
  fill(100,100,100);
  rect(mouseX,mouseY,100,100);
  
  line(0,0,mouseX-50,mouseY-50);
  line(1000,1000,mouseX+50,mouseY+50);
  line(1000,0,mouseX+50,mouseY-50);
  line(0,1000,mouseX-50,mouseY+50);
  }
}
