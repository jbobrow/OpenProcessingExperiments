
color c = color(200,50,200);
float x = 0;
float y = 100;
float speed = 1;

void setup() {
  size(200,200);
  
}

void draw() {
background(0,50,120);
move();
  display();
}

void move() {
  x = x + speed;
  
  if (x >= width) {
    x = 0;
  }
  
  else if (x <= 0) {
    x = width;
  }
    
   if(mousePressed) x=x-speed*4; 
  
  
  
  }


void display() {
  fill(c);
  rect(x,y,60,20);
}



