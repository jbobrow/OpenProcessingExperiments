
//With a little help from Anthony, and from processing.org
//http://processing.org/reference/mouseDragged_.html
//http://processing.org/reference/else.html
//http://processing.org/reference/pmouseX.html
//http://processing.org/reference/pmouseY.html

PFont fontA;
float x;
float y;
float xSpeed;
float ySpeed;

float gravity = 1;
float friction = 0.875;
float diam = 100;

float mouseCx;
float mouseCy;

void setup() {
  size(800, 600);
  smooth();
  
  fontA = loadFont("font.vlw");
  textFont(fontA);
  
  x=width/2;
  y=height/2 + (diam/2);
}

void draw() {
    
  background(255);

//  text(xSpeed, 20, 50);
//  text(ySpeed, 20, 100);

  fill(0);

  ellipse(x, y, diam, diam);
  ySpeed += gravity;
  y += ySpeed;
  x += xSpeed;
  
  if (y >= height - (diam/2)) {
    ySpeed *= -friction;
    y = height-diam/2;
  }
  
    if (x >= width - (diam/2)) {
    xSpeed *= -friction;
    x = width - diam/2;
  }
  
    if (x <= diam/2) {
    xSpeed *= -friction;
    x = diam/2;
  }
  
  if (y == height - diam/2){
    xSpeed *= friction;
  }
}

void mouseReleased()
{
  gravity = 1;
  //Fixing Jedi Powers
  if (mouseX > x - diam && mouseX < x + diam && mouseY > y - diam && mouseY < y + diam) {
  ySpeed += gravity + ((mouseY - (pmouseY))/2 );
  xSpeed = (mouseX - pmouseX)/2;
  y += ySpeed;
  }
  
print(mouseY-pmouseY);

}


void mouseDragged() 
{
 
  if (mouseX > x - (diam/2) && mouseX < x + (diam/2) && mouseY > y - (diam/2) && mouseY < y + (diam/2)) {
    else if(mouseX < 0 || mouseX > width || mouseY > height || mouseY <0){
    x=mouseX;
    y=mouseY;
    xSpeed=0;
    ySpeed = 0;
    gravity = 0;
    }
  }
}


