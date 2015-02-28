
void setup() {
  size(400, 400);
}

void draw() {
  background(91,214,198);


fill(255,159,80);
stroke(255);
  line(0, height/2, width, height/2 );
  line(width/2,0,width/2, height);
  float x = 0;
  float y = 0;
  if (mouseX > width/2) {
    x = width/2;
  }
  if (mouseY > height/2) {
    y = height/2;
  }
  
  rect(x, y, width/2, height/2);
 //saveFrame("quick.png"); 
}



