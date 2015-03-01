

 import processing.dxf.*;
 boolean record;
 
 int nummer;
 


void setup() {

 sphereDetail(12);
  size(800,800,P3D);
  
  
}

void draw() {
   background(255,255,255);
   if (record) {
    beginRaw(DXF, "output" + nummer + ".dxf");
  nummer+=1;  
 }
   lights();
  noStroke();
    fill(random(100),random(60),0);
    noStroke();
//frameRate(1);

//align(CENTER,CENTER);
translate(height/2,width/2);
rotateY(map(mouseX, 0, height, 0, PI));
  rotateZ(map(0, mouseY, width, 0, HALF_PI*2));
   for (int y = -2; y < 2; y++) {
  for (int x = -2; x < 2; x++) {
      for (int z = -2; z < 2; z++) {
pushMatrix();
 translate(random(120*x), (random(120*y)), (random(-120*z)));
box(random(70),random(100),random(80));
//sphere(40);

popMatrix();



      }
    }
   }


if (record) {
    endRaw();
    record = false;
  }
  
}

void keyPressed() {
  // Use a key press so that it doesn't make a million files
  if (key == 'r') {
    record = true;
  }

}



