
int a;
int r;
int g;
int b;

void setup() {
  size(1000, 500);
  noLoop();
}

float x = 0;

void draw() {
  background(r,g,b);
  x = x + .1;
  if (x > width) {
    x = 0;
  }
  
   a=int(random(0,255));
   
// Flügel
  stroke(0);
  fill(a);
  ellipse(mouseX-50,mouseY-30,80,80);
  ellipse(mouseX+50,mouseY-30,80,80);
// Körper
  stroke(0);
  fill(mouseX,mouseY,0);
  ellipse(mouseX,mouseY,100,100);
// Kopf
  stroke(0);
  fill(255);
  ellipse(mouseX,mouseY-30,60,60);
// Augen
  fill(0);
  ellipse(mouseX-19,mouseY-30,15,15);
  ellipse(mouseX+19,mouseY-30,15,15);
//Nase
    fill(mouseX, 0, mouseY);
    ellipse(mouseX,mouseY-20,10,5);
//Arme  
  stroke (0);
  line(mouseX-10,mouseY,pmouseX-10,pmouseY+10);
  line(mouseX+10,mouseY,pmouseX+10,pmouseY+10);
//Arme mitte 
  stroke (0);
  line(mouseX-10,mouseY+25,pmouseX-10,pmouseY+35);
  line(mouseX+10,mouseY+25,pmouseX+10,pmouseY+35);
// Beine
  stroke(0);
  line(mouseX-10,mouseY+50,pmouseX-10,pmouseY+60);
  line(mouseX+10,mouseY+50,pmouseX+10,pmouseY+60);
}

void mousePressed() {
  loop();
    r=int(random(0,255));
    g=int(random(0,255));
    b=int(random(0,255));
}

void mouseReleased() {
  noLoop();
}

