
boolean button = false;

int x = 0;
int y = 0;
int distance = 25;

int a = 460;
int b = 20;
int h = 20;
int w = 20;

float r;
float g;
float c;
float d;
    
void setup() {
  size (500, 500);
 
 
}
  
void draw() {
  r = random(100);
  g = random(100);
  c = random(100);
  d = random(255);
  
  background(0);
  strokeWeight(1);
  stroke(r,g,c);
  smooth();
 
 if (button) {
  for (int i=0; i<21; i++)
  {
    line(i*distance, 0, mouseX, mouseY);
  }
  for (int j=x; j<21; j++)
  {
    line(mouseX,mouseY, (j*distance),500);
  }
 }
 stroke(0);
 fill(0, 255, 255);
 rect(a,b,w,h);
}

void mousePressed() {
  if (mouseX > a && mouseX < a+w && mouseY > b && mouseY < b+h && mousePressed ) {
   button = !button;
  } else {
  noStroke();
  fill(r,g,c,a);
  ellipse(mouseX,mouseY,100,100);
  }
}


