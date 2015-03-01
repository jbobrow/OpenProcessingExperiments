
color white, orange, yellow;
void setup() {
  size(600, 600);
  colorMode(HSB, 360, 100, 100, 100); 
  noStroke();
  smooth();
  orange = color(17, 93, 98);
  white = color(17, 0, 100);
  yellow=color(59, 94, 100);
}
void draw() {
  noStroke();
  float y = mouseY / float(height);
  background(white);
  fill(17+mouseX/10, 93+mouseX/500, 98);
  rect(350, 300, 250, 100+mouseY/6);
  fill(yellow);
  rect(500, 100, 120, 30);
  fill(212-mouseX/10, 94-mouseX/8, 100);
  triangle(0, 100, 0, 270, 200, 270);
  for (float i=50; i<250; i+=25) {
    fill(212,0,mouseX/10);
    rect(i,400,15,200);
  }
  stroke(290,53+mouseX/10,97);
  noFill();
  strokeWeight(3);
  beginShape();
  vertex(140,-10);
  vertex(130,20);
  vertex(160,0);
  vertex(170,50);
  vertex(190,10);
  vertex(220,160);
  endShape();
  
}



