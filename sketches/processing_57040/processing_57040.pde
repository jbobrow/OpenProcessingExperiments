
void setup(){
  size(1000, 1000);
  background(23, 80, 123);
  frameRate(7000);
}

void draw(){
 /// background(255); // stops line from re-drawing itself
 smooth();// smooths out lines
  strokeWeight(0);//line thickness
  stroke(255); // line color
  line(random(800),random(800),mouseX,mouseY);//(x1,y1)(x2,y2)
}

