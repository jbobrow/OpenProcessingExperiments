
// Cliton Pong 11-9-2013

int x, y;
float r,g,b,a;

void setup() {
  //same height and width as the display
  size(displayWidth,displayHeight);
  frameRate(5);
  background(0);
  smooth(100);
}

void draw() {
  noStroke();
  fill(0,80);
  rect(0,0,width,height);
 
 //size of ellipses
  x = floor(random(width));
  y = floor(random(height));
  
  //stroke colour
  stroke(r,g,b,a);
  
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  
  //coordinates of ellipses
  ellipse(x,y,x,y);
  print(x);
  print(',');
  println(y);
  
  //colour of the ellipse will be changed when the mouse moved 
  ellipse(mouseX, height/2, mouseY/2+10, mouseY/2+10);
  fill (r,g,b,a);
  int inverseX = width-mouseX;
  int inverseY = height-mouseY;
  ellipse(inverseX, height/2, (inverseY/2)+10, (inverseY/2)+10);
}
