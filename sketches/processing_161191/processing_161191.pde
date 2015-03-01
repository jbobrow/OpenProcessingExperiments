
PVector v,r;

void setup() { 
  size(250, 250);
  background(255);  
  r = new PVector(1, 0,0);
}

void draw() {  
background(255);  
v = new PVector(map(mouseX, 0, width, -100, 100), map(mouseY, 0, width, -100, 100),0);
float angle = PVector.angleBetween(v,r);
float angle2 = atan2(-v.y,v.x);
fill(0, 102, 153);
text(angle,10,10);
text(degrees(angle),10,20);
text(angle2,10,40);
text(degrees(angle2),10,50);
text((int)(degrees(angle2) / 2),10,70);
if (abs((int)(degrees(angle2) / 2)) <= 1) stroke(255,0,0);
else  stroke(0,255,0);
translate(125,125);
line(0,0,v.x, v.y);
}
