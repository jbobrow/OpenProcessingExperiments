
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(random),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}


int parameter = 50;
int x = 0;
int y = 0;
void setup()
{
  size(500, 500);
  colorMode (RGB);
  frameRate (25);
  background(50, 30, 56);
}
 
 
void draw()
{
  stroke(255);
  for (int x = 0; x < width; x += parameter) {
  for (int y = 0; y < height; y += parameter){
  if (mousePressed == true){
  stroke (0); }
  line(x + 50, y + 50, x, y+ 50);
  line(x, y, x, y+ 50);
  if(mousePressed == true) { //add some interaction
    ellipse
  (mouseX, mouseY, 20, 20);
  fill(random(0,255),random(0,255),random(0,255));
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
    
  }
}
 
}


