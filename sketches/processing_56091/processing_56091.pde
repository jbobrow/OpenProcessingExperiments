
void setup() {
size (1000,250);
smooth();
}

float x = 0;
float y = 100;
float speed = 4;


void draw() {
  background(0);
  move();
  display();
}

void move() {
  x = x + speed;
  if (x > 1900) {
    x = 0;
  }
}

void display() {
  
 
  
  noFill ();
  ellipse(x - 50,200,300,300);
  stroke (255,0,0);
 
  noFill ();
  ellipse(x - 100,200,300,300);
  stroke (0,255,0);

  noFill ();
  ellipse(x - 150,200,300,300);
  stroke (0,0,255);
  
 noFill ();
  ellipse(x - 200,200,300,300);
  stroke (255,0,0);
  
   noFill ();
  ellipse(x - 250,200,300,300);
  stroke (0,255,0);
  
   noFill ();
  ellipse(x - 300,200,300,300);
  stroke (0,0,255);
  
   noFill ();
  ellipse(x - 350,200,300,300);
  stroke (255,0,0);
  
   noFill ();
  ellipse(x - 400,200,300,300);
  stroke (0,255,0);
  
   noFill ();
  ellipse(x - 450,200,300,300);
  stroke (0,0,255);
  
   noFill ();
  ellipse(x - 500,200,300,300);
  stroke (255,0,0);
  
   noFill ();
  ellipse(x - 550,200,300,300);
  stroke (0,255,0);
  
   noFill ();
  ellipse(x - 600,200,300,300);
  stroke (0,0,255);
  
}


