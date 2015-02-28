
color c = color(0);
float x = 0;
float y = 100;
float speed = 1;
float count = 0;
float x2 = 0;
float y2 = 0;
void setup() {
  size(480, 480);
}


void draw() {
  move();
  display();
}

void move() {
  x = random(0,480);
  y = random(0,480);
  }


void display() {

  while (count<10) {  
   x2 = random(0,100) ; 
   y2 = random(0,100);
    fill(random(0,255),random(0,255),random(0,255));
    rectMode(CENTER);
    rect(x, y,x2 ,y2);
    ellipse(x+x2*2,y+y2*2,x2/3,y2/3);
    ellipse(x+x2*2,y-y2*2,x2/3,y2/3);
    ellipse(x-x2*2,y+y2*2,x2/3,y2/3);
    ellipse(x-x2*2,y-y2*2,x2/3,y2/3);
    count++;
  }
  count = 0;
}


