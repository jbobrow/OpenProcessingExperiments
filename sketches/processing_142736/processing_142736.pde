
void setup() {
 background(0);
 size(500,500); 
 noStroke();
}

void draw() {

  float size = random(10,20);
  
  float x1 = mouseX;
  float y1 = mouseY - size;
  float x2 = mouseX -size;
  float y2 = mouseY +size;
  float x3 = mouseX +size;
  float y3 = mouseY +size;
 
 float blue = map(mouseY,0,500,255,0);
 float green = map(mouseY,0,500,255,0);
 fill(255,blue,green,25);
 translate(width/2,height/2);
 rotate(millis()/10);
 triangle(x1,y1,x2,y2,x3,y3);
}
