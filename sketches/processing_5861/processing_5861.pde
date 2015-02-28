
//farben
float r; //red
float g; //green
float b; //blue
float a; //alpha chanal

//diameter
float diam;
float x;
float y;

int value = 255;

void setup() {
  size(400,400);
  background(0);
  smooth();
  frameRate(25);
}

void draw() {
  fill(value);
  //noStroke();

  //stroke(r,g,b,a);
  //strokeWeight(18);
  
line(mouseX,mouseY,mouseX,mouseY); //Mausposition

r = random(111,255);
g = random(111,255);
b = random(111,255);
a = random(111,255);
diam = random(20);
x = random(width);
y = random(height);

//ellipse confett
noStroke();
fill(r,g,b,a);
ellipse(x,y,diam,diam);
}

void mousePressed() {
  if (mouseButton == LEFT){
    background(255);
  } else if (mouseButton == RIGHT)
  {
    background(r,g,b,a);
  }
  
}

