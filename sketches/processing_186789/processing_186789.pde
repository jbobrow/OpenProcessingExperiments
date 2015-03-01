
//EllipseVelocidadFrames MousePressed

int p = 50;
void setup(){
  size(600,800);
  colorMode(HSB);
  frameRate(20);
  fill(25,32,255);


}

void draw(){
  background(random(p),255,100);
  if (mousePressed) {
for(int i=50; i<height; i+=10){
     float t = random (i);
     fill(random(t),255,255);
    ellipse(i,i,t,t);
}
  }
    
    
    else {
      frameRate(10);
for(int i=50; i<height; i+=100){
     float t = random (i);
     fill(random(t),255,255);
    ellipse(i,i,t,t);
}
    }
}

