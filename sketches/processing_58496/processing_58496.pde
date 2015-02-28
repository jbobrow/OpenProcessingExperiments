
color c = color(64,224,208);
float x = 200;
float y = 200;
float speed = 1;
int value =200;

void setup() {
  size(500,500);
}

void draw() {
  background(255);
  move();
  display();
  fill(value);
  rect (x,y,10,20);

}


void move() {
  y = y + speed;
  if (y > width) {
    y = 0;
  }
}

void display() {
  fill(c);
  rect(x,y,50,10);
  rect (x,y,10,20);
  
}

void mousePressed() {
  if(value == 0) {
    value = 200;
  } else {
    value = 0;
  } 
}
void mouseDragged ()
{
  value= value+5;
  if(value > 255) {
    value= 0; 
  }
}

