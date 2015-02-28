
float[] x = new float[5];
float anchor = 250;
float[] y = new float[5];
float[] angle = new float[5];
float[] freq = new float[5];
 
color myColor = color(255,0,255);

void setup() {
  size(400, 400);
 
  x[0] = width/2 - 30;
  x[1] = width/2 - 33;
  x[2] = width/2;
  x[3] = width/2 + 33;
  x[4] = width/2 + 30;
 
  for (int i = 0; i < freq.length; i++) {
    freq[i] = random(PI/2.4, 3.4*PI/2);
  }
 
}
 
void draw() {
  background(0);
 
  setPoints();
 
  fill(myColor);
  curveTightness(map(anchor, 250, 100, 0, 0.5));
  beginShape();
  for (int i = 0; i < 2; i++) {
    curveVertex(width/2 - 10, height);
    for (int j = 0; j < x.length; j++) {
      curveVertex(x[j], y[j]);
    }
    curveVertex(width/2 + 10, height);
  }
  endShape();
  stroke(0, 100);
  noStroke();
 
  for (int i = 0; i < 5; i++) {
    x[i] = x[i] + sin(angle[i]);
    y[i] = y[i] + sin(angle[i]);
    angle[i] += freq[i];
  }
 
  grow();
 
}
 
void setPoints() {
  if (anchor < 250) {
    anchor += 0.5;
  }
  y[0] = anchor + 50;
  y[1] = anchor + 30;
  y[2] = anchor;
  y[3] = anchor + 30;
  y[4] = anchor + 50;
}
 
boolean onShape() {
  if (get(mouseX, mouseY) == myColor) {
    return true;
  }
  else {
    return false;
  }
}
 
void grow() {
  if (onShape() && abs(mouseY - pmouseY) > 20 && anchor > 100) {
    anchor -= 3;
  }
   if (anchor < 101) {
    myColor = color(random(255),random(255),255);
  }

}
 


 
 





