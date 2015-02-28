
float x = 250;
float y = 250;
float speed = 1;

void setup() {
  size(500,500);
}

void draw() {
  background(255);
  move();
  display();
}

void move() {{
  x = x + speed;
  if (x > width) {
    x = 0;
  }}
  { y = y + speed;
  if (y > width) {
    y = 0;
  }}}

void display() 
{rect (x, y, random(250), random(250));
    fill (random(255), random (255), random(255));
    noStroke();}
void setup(){
size(500,500);}

void draw(){ 
{rect (0, 0, random(250), random(250));
    fill (random(255), random (255), random(255));
    noStroke();}

    
{rect (0, 500, random(250), random(-250));
    fill (random(255), random (255), random(255));
    noStroke();}
    
{rect (500, 0, random(-250), random(250));
    fill (random(255), random (255), random(255));
    noStroke();}
    
{rect (500, 500, random(-250), random(-250));
    fill (random(255), random (255), random(255));
    noStroke();}
    
    
    
}


