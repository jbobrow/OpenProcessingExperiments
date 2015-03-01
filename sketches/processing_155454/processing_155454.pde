
color c = color(0);
float x = 0;
float y = 100;
float speed = 1;

void setup() {
  size(600,600);

}

void draw() {
  
  
line (0,600,50,x);
line (0,600,100,x);
line (0,600,150,x);
line (0,600,200,x);
line (0,600,250,x);
line (0,600,300,x);
line (0,600,350,x);
line (0,600,400,x);
line (0,600,450,x);
line (0,600,500,x);
line (0,600,550,x);


line (600,0,x,50);
line (600,0,x,100);
line (600,0,x,150);
line (600,0,x,200);
line (600,0,x,250);
line (600,0,x,300);
line (600,0,x,350);
line (600,0,x,400);
line (600,0,x,450);
line (600,0,x,500);
line (600,0,x,550);
stroke (225);
 
line (0,0,x,50);
line (0,0,50,x);
line (0,0,100,x);
line (0,0,x,100);
line (0,0,150,x);
line (0,0,x,150);
line (0,0,200,x);
line (0,0,x,200);
line (0,0,x,250);
line (0,0,250,x);
line (0,0,300,x);
line (0,0,x,300);
line (0,0,350,x);
line (0,0,x,350);
line (0,0,400,x);
line (0,0,x,400);
line (0,0,x,450);
line (0,0,450,x);
line (0,0,500,x);
line (0,0,x,500);
line (0,0,550,x);
line (0,0,x,550);

line (600,600,x,50);
line (600,600,50,x);
line (600,600,100,x);
line (600,600,x,100);
line (600,600,150,x);
line (600,600,x,150);
line (600,600,200,x);
line (600,600,x,200);
line (600,600,x,250);
line (600,600,250,x);
line (600,600,300,x);
line (600,600,x,300);
line (600,600,350,x);
line (600,600,x,350);
line (600,600,400,x);
line (600,600,x,400);
line (600,600,x,450);
line (600,600,450,x);
line (600,600,500,x);
line (600,600,x,500);
line (600,600,550,x);
line (600,600,x,550);


stroke (225);

  
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
  
 stroke(12,102,213);
  
  
}


