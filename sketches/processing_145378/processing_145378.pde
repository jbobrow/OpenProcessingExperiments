
float x, y;
float v = random (2,8);
float vy = random (2,8);

void setup (){
  size (500,500);
  background (255);
  x = random (width);
  y = random (height);
}

void draw() { 
background (255);
fonscara();
detallscara();

x = x+v;
y = y+vy;
Limits();
}

void fonscara (){
 pushMatrix();
fill (0);
ellipse (x,y,260,260);
ellipse (x-120,y-120,130,130);
ellipse (x+120,y-120,130,130);
popMatrix ();
}
void detallscara (){
  pushMatrix();
fill(255,0,0);
ellipse (x,y,160,80);
fill (255,0,0);
noStroke ();
ellipse (x,y+40,220,170);
ellipse (x-40,y-10,100,200);
ellipse (x+40,y-10,100,200);
fill (0);
ellipse (x,y+70,160,80);
ellipse (x-25,y-10,50,75);
ellipse (x+25,y-10,50,75);
noStroke();
fill(255,0,0);
ellipse(x-10,y-10,5,10);
ellipse (x+10,y-10,5,10);
ellipse (x,y+50,150,60);
fill(0);
ellipse (x,y+40,80,40);
fill(255);
ellipse (x,y+30,30,10);
popMatrix();
}

void Limits(){
if (x+150/2 > width || x-150/2 < 0) {
v = -v;
}
if (y+345/2 > height || y-155/2 < 0) {
vy = -vy;
}
}
 
void mousePressed(){
v = random(-5,5);
vy = random(-5,5);
x = mouseX;
y = mouseY;
}



