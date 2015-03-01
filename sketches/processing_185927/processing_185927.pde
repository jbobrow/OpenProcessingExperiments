

void setup() {
  size (800, 500, P3D);
  
  
}

void draw(){
  int Red;
  int Blue;
  int Green;


  lights();
  noStroke();
    translate(mouseX, mouseY, 2);
   Red= int(random(255));
  Blue= int(random (255));
  Green=int(random (255));
  fill (Red,Green,Blue);
   if (abs(pmouseX-mouseX)>15) {
    sphere (random(30));
   }
}


