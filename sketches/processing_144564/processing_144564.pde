
color c = color(0);
float x = 0;
float y = 100;
float speed = 1;

void setup() {
  size(600,600);
}

void draw() {
  background(255);

 
  
  
  move();
  display();
}

void move() {
  x = x + speed;
  if (x > width) {
    x = 0;
  }
}

void display() {
  stroke (0);
 line(300,x,x,300);
  line(300,x,300,300);
  line(300,300,x,300);
  
  line(250,x,x,250);
  line(250,x,250,250);
  line(250,250,x,250);
  
  line(150,x,150,150);
  line(150,x,x,150);
  line(150,150,x,150);
  
  line(200,x,x,200);
  line(200,x,200,200);
  line(200,200,x,200);
  
  line(50,x,x,50);
  line(50,x,50,50);
  line(50,50,x,50);
  
  line(450,x,x,450);
  line(450,x,450,450);
  line(450,450,x,450);
  
  line(100,x,x,100);
  line(100,x,100,100);
  line(100,100,x,100);
  
  line (350,x,x,350);
  line (350,x,350,350);
  line (350,350,x,350);
  
   line(400,x,x,400);
  line(400,x,400,400);
  line(400,400,x,400);
  
  line (500,x,x,500);
  line (500,x,500,500);
  line (500,500,x,500);
  
  line (550,x,x,550);
  line (550,x,550,550);
  line (550,550,x,550);
  
  
  
  
}


