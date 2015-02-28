
float gx, gy, gz;
int time;

  
void setup() {
  size(640, 480, P3D);
  frameRate(20);
  gx = 1.4;
  gy = 1.89;
  gz = 0.96;
  time = 190847940;
smooth();
 
  rectMode(CENTER);  

}

void draw(){
  background(0);
  translate(width/2, height/2);
  rotateX(radians(gx) * millis()/1000.0);
  rotateY(radians(gy*5) * millis()/1000.0);
  rotateZ(radians(gz*5) * millis()/1000.0);
  
 // pointLight(63, 127, 255, mouseX, mouseY, mouseX); 
 // rect(0, 0, 200, 200);
 //noStroke();
// pointLight(255,255, 255,mouseX-400, mouseY, 400);
 fill(random(1,255), random(1, 255), random(1, 255), 120);
// fill(255,30);
 sphereDetail(mouseX/40);
 sphere(128);
 
}



