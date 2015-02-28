

float x = 250;
float y = 250;
float speed1 = 100;

void setup() {
  size(500,500);
}

void draw() {
  {move1();
  display1();
   frameRate(10);}
   
  {display2();
  frameRate(30);}
  
  {display3();}
   
}

void move1() {{
  x = x + speed1;
  if (x > width) {
    x = 0;
  }}
  { y = y + speed1;
  if (y > width) {
    y = 0;
  }}}

void display1() 
{rect (350, random(500), random(250), random(250));
    fill (random(255), random (255), random(255));
    noStroke();}
    
void display2() 
{rect (0, 0, random(500), random(500));
        noStroke();
    fill(random(255), random (255), random(255));}
    
void display3() 
{rect (0, 0, random(460), random(200));
        noStroke();
    fill(random(255), random (255), random(255));}
    




