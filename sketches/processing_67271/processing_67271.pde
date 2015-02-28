
int x;
int y;

int a;
int b;

float distance;


void setup() {
  size (400, 400);
  background (100, 100, 100);
  x = 0;
  y = 0;

  a = 0;
  b = 0;
}

void draw() {
  strokeWeight(10); 
  stroke (0, 230, 80);
  if (mousePressed) {
    distance = dist (pmouseX, pmouseY, mouseX, mouseY);
    line(pmouseX, pmouseY, mouseX, mouseY);
    println (distance); 

    smooth();
    noStroke();
    a=mouseX;
    b=mouseY; 
    noStroke (); 
    fill(HSB, 100, 100, 100); 
    ellipse(x, y, 50, 50);


    x=mouseX;
    y=mouseY;
  }
}


