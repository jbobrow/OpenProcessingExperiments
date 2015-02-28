

void setup () {
  
  size(640,480,P3D);
  background(255);
 
}

void draw() {

float rx = random(0,640);
float ry = random(0,480);
noStroke();
lights();
translate(rx, ry, 0);
fill(random(0,255),random(0,255),random(0,255));
sphere(28);

}

  
  
void mouseClicked(){
setup();
}

