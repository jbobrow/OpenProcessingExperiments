
// point spirals that develop over time by Catherine Caudwell

color from = color(0);
color to = color(205, 0, 10);


void setup() {
  size(800, 800);
  background(255);
  smooth();

}

void draw() {

  background(255);

  for (float i = 1; i < 150; i ++) {
    strokeWeight(15);
stroke(lerpColor(from,to,(float)i/150.0),frameCount/i+30);
    drawSpiral(width/2, height/2, i, i, i*frameCount*0.0001);
 strokeWeight(30);
    stroke(lerpColor(from,to,(float)i/150.0),frameCount/i+15);
    drawSpiral(width/2, height/2, i, i, i*frameCount*0.0001);
       strokeWeight(30);
       stroke(lerpColor(from,to,i/150.0),frameCount/i+15);
    drawSpiral(width/2, height/2, i, i, -i*frameCount*0.0001);
strokeWeight(15);
    stroke(lerpColor(from,to,(float)i/150.0),frameCount/i+30);
    drawSpiral(width/2, height/2, i, i, -i*frameCount*0.0001);
  }
}

void drawSpiral(float t, float k, float x, float y, float r) {
  pushMatrix();
  translate(t, k);
  rotate(r);
  point(x, y);
  popMatrix();
}



