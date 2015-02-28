
void setup() {
  background (255);
  size(600, 600);
  noCursor();
  Float r = random(255);
}

void draw() {
   background (random(255));
noStroke();
fill (random(255), random(255),random(255),random(255));
ellipse (300,300,500,500);
ellipse (pmouseX, pmouseY, random(50),random(50));
rect(pmouseX, pmouseY, 60, 60);
ellipse(pmouseX+(60), pmouseY,random(50),random(50))
;
}

