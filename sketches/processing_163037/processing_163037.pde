
void setup() {
  size(700,255*2);
}

void draw () {
  background(5);
noCursor();
  drawMonster(mouseX,mouseY);
 
  
}

void drawMonster (float x, float y) {
if (mousePressed) {
  strokeWeight(10);
  stroke(0,150,0);
  line (x,y,x+random(300),y+random(300));
  line (x,y,-x+random(300),-y+random(300));
  line (x,y,x+random(300),-y+random(300));
  line (x,y,-x+random(300),y+random(300));
  }
  noStroke();
  fill(0,150,0);
  ellipse (x,y,100,100);
  fill(255);
  ellipse (x,y,65,65);
  fill(255,0,0);
  ellipse (x,y,30,30);
  fill(0);
  ellipse (x,y,20,20);
  fill(255);
  ellipse(x,y-7,10,10);
  }
  
