
int counter;
int x,y;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(100);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  x=width/2;
  y=height/2;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),200,155,150);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
    x=mouseX;
    y=mouseY;
  }
  else {
    ellipse(x, y, 180*sin(counter), 180*sin(counter));
  }
}
