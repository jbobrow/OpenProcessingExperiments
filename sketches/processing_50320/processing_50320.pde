
 int x = 0;
  int y = 0;
  int b = 0;

void setup() {
  size(800,800);
  frameRate(12);
  smooth();
    background(0);

 
}
void draw() {

  x = mouseX;
  y = mouseY;
  
  if (mousePressed && mouseButton == LEFT && mouseX>=400) {
beginShape();
vertex(x,y);
vertex((x + random(0,80)),(y+random(0,80)));
vertex((x + random(0,100)),(y+random(80,100)));
vertex((x + random(0,120)),(y+random(100,120)));
vertex((x + random(0,140)),(y+random(120,140)));
vertex((x + random(0,160)),(y+random(140,160)));
vertex((x + random(0,180)),(y+random(160,180)));
endShape();
fill(random(0,255),random(0,255),random(0,255),random(50,100));
stroke(random(0,255),random(0,255),random(0,255),random(50,100));
  
}
 if (mousePressed && mouseButton == RIGHT && mouseX<400) {
   beginShape();
vertex(x,y);
vertex((x - random(0,80)),(y-random(0,80)));
vertex((x - random(0,100)),(y-random(80,100)));
vertex((x - random(0,120)),(y-random(100,120)));
vertex((x - random(0,140)),(y-random(120,140)));
vertex((x - random(0,160)),(y-random(140,160)));
vertex((x - random(0,180)),(y-random(160,180)));
endShape();
fill(random(0,255),random(0,255),random(0,255),random(50,100));
stroke(random(0,255),random(0,255),random(0,255),random(50,100));
  
}
 if (mousePressed && mouseButton == LEFT && mouseX<400) {
beginShape();
vertex(x,y);
vertex((x - random(0,80)),(y+random(0,80)));
vertex((x - random(0,100)),(y+random(80,100)));
vertex((x - random(0,120)),(y+random(100,120)));
vertex((x - random(0,140)),(y+random(120,140)));
vertex((x - random(0,160)),(y+random(140,160)));
vertex((x - random(0,180)),(y+random(160,180)));
endShape();
fill(random(0,255),random(0,255),random(0,255),random(50,100));
stroke(random(0,255),random(0,255),random(0,255),random(50,100));
  
}
 if (mousePressed && mouseButton == RIGHT && mouseX>=400) {
   beginShape();
vertex(x,y);
vertex((x + random(0,80)),(y-random(0,80)));
vertex((x + random(0,100)),(y-random(80,100)));
vertex((x + random(0,120)),(y-random(100,120)));
vertex((x + random(0,140)),(y-random(120,140)));
vertex((x + random(0,160)),(y-random(140,160)));
vertex((x + random(0,180)),(y-random(160,180)));
endShape();
fill(random(0,255),random(0,255),random(0,255),random(50,100));
stroke(random(0,255),random(0,255),random(0,255),random(50,100));
  
}
}



