
float xoff = 0.0;
float yoff = 0.0;

void setup(){
  size(600,600,P3D);
  stroke(0);
  frameRate(24);
}
void draw(){
  translate(300,90);
  rotate(PI/4);
  //lights();
  rect(0,0,300,300);
  background(random(10));
  for(int i=0; i< 50; i++){
    for(int u=0; u< 50; u++){
      xoff = xoff + .01;
      float n2 = noise(yoff) * 255;
      yoff = yoff + 10;
      float n = noise(xoff+yoff) * 255;
      fill(n);
      pushMatrix();
      translate(i*6,u*6,0);
      box(6,6,(n/2));
      popMatrix();
    }
  }
} 


