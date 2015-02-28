

int value = 0;
int size = 60;      
float xpos, ypos;   

float speed = 20; 
 

float xdirection = 1;  
float ydirection = 1;

void setup() {
size(800,800);
background(255);
 
  frameRate(30);
  smooth();
 
  xpos = width/2;
  ypos = height/2;
speed = 20; 

  
   xdirection = random(0.1, 0.99);
  ydirection = random(0.1, 0.99);

  

  
}

void draw() 
{
if (keyPressed == true) {
    background(0);
  } 

  
  xpos = xpos + ( speed * xdirection );
  ypos = ypos + ( speed * ydirection );
  
  if (xpos > width-size || xpos < 0) {
    xdirection *= -1;
  }
  if (ypos > height-size || ypos < 0) {
    ydirection *= -1;
  }

  ellipse(xpos+size/2, ypos+size/2, value, value);
  if (xpos > height/2){
 fill (random (255), random (255), random (255));
  }
}

void mouseMoved() {
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
}
void mousePressed (){
if (speed ==0){
speed = 6;
}
else {
speed = 0; 
}
}

