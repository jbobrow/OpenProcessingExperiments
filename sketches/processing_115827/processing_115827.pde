
Car c1;
Car c2; 
Car c3;

int width = 800;
int height = 600;
int num = 10;

void setup() {
  size(width, height);
  c1 = new Car(color(127),100, 30); 
  c2 = new Car(color(127),300, 30);
  c3 = new Car(color(127),500, 30);
}

void draw() {
  background(255);
  c1.display();
  c1.move();
  c2.display();
  c2.move();
  c3.display();
  c3.move();
  
  if (c1.xpos > width || c1.xpos < 0 ||
  c2.xpos > width || c2.xpos < 0 ||
  c3.xpos > width || c3.xpos < 0){
    c1.moveX = c1.moveX*-1;
    c2.moveX = c2.moveX*-1;
    c3.moveX = c3.moveX*-1;
  }
}

class Car { 
  color c;
  float xpos = 0;
  float ypos;
  float xwidth;
  float moveX = random(5,15);
  
  Car(color tempC, float y, float w) { 
    c = tempC;
    ypos = y;
    xwidth = w;
  }
  
  void display(){
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,xwidth,10);
  }  
  
  void move(){
     xpos = xpos+=moveX;
     if(xpos > width || xpos <= 0){
    c = color(random(20,255), random(20,255), random(20,255));
  }
  }
}


