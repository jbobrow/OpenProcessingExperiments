
float radius;

void setup(){
  size(500, 500);
  radius=75;
}

void draw(){
 background(255);
 ellipse(width/2, height/2, radius, radius);
 
 if( dist(mouseX, mouseY, width/2, height/2)<(radius/2)) {
   background(0);
 }
 
   if (keyPressed) {
  if (key == 's') {
    saveFrame();
  }
}
}


