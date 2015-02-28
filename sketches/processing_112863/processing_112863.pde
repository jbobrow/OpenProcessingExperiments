

PImage bg;
PImage bear; 
int h;

int num = 50;
int[] x = new int[num];
int[] y = new int[num];

void setup() {
  size(537,549);
  background(255);
  bg=loadImage("forest11.gif");
  noStroke();
  rectMode(CENTER);
  bear=loadImage("BEARBEAR.png");
  h=150;
  bear.resize(bear.width/bear.height*h,h);//resize the image
  
}

void draw() {
  //Add tint function into the background image
  image(bg,0,0);
  tint(180,126);
  image(bg,10,0);//Apply transparency without changing color(first layer)
  tint(180,126);
  image(bg,45,0);//Apply transparency without changing color(second layer)
  tint(180,126);
  
  // Shift the values to the right
  for (int i = num - 1; i > 0; i--) {
    x[i] = x[i-1];
    y[i] = y[i-1];
  }
// Add the new values to the beginning of the array
  x[0] = mouseX;
  y[0] = mouseY;
// Draw the circles
  for (int i = 0; i < num; i++) {
    ellipse(x[i], y[i], i / 4.0, i / 4.0);
    fill(246,255,3,126);
  }
  //Add a moving image 
  image(bear,mouseX,mouseY);
  
  
}
  
  
  
  
  
  

  


