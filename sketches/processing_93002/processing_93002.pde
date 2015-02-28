
void setup() {
  size(640,480,P3D);
}

void draw() {
  background(0);
  translate(width/2,height/2);
  rotate(frameCount*0.01);
  fill(255,50);
  stroke(0,200);
  strokeWeight(0.8);
  beginShape(TRIANGLE_STRIP);
  for(int i=0; i <= mouseX; i++) {
    vertex(sin(i*((float)height/(mouseY+1)))*100,cos(i*((float)height/(mouseY+1)))*100,(float)i-(mouseX*0.5));
    vertex(tan(sin(i*((float)height/(mouseY+1))))*100,tan(cos(i*((float)height/(mouseY+1))))*100,(float)i-(mouseX*0.5));
  }
  endShape(CLOSE);
}


