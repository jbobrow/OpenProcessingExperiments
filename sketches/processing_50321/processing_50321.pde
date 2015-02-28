
//Custom shape: ARROW
//Draw an archery target with concentric circles
//Draw a rotational pattern of arrows, all pointed at the bullseye
//Makes use of translation, rotation, and scale to iterate different sizes/orientations of arrows


void setup(){
size(600, 600);
background(255);
noLoop();
}

void Arrow(float offset) {    //function draws an arrow, at distance "offset" from center
  strokeWeight(1);
  beginShape();
  vertex(175 + offset, -5);
  vertex(165 + offset, -5);
  vertex(172 + offset, -15);
  vertex(147 + offset, -15);
  vertex(140 + offset, -5);
  vertex(25 + offset, -5);
  vertex(35 + offset, -15);
  vertex(0 + offset, 0);
  vertex(35 + offset, 15);
  vertex(25 + offset, 5);
  vertex(140 + offset, 5);
  vertex(147 + offset, 15);
  vertex(172 + offset, 15);
  vertex(165 + offset, 5);
  vertex(175 + offset, 5);
  endShape(CLOSE);
}
  
void draw() {
  float spin = 0;
  float offset = 0;
  float scal = 4;
  float r = 30;
  int shade = 200;
  
  noStroke();      //concentric circles form an archery target background
  for (r = 500; r > 0; r -= 50) {
    fill(shade, shade, shade, 50);
    ellipse(width/2, height/2, 2*r, 2*r);
    shade -= 20;
  }
  
  stroke(0);
  
  fill(50, 200, 50, 20);
  translate(width/2, height/2);

  scale(scal, scal);  //large arrows on outside; looping weighted the image too heavily at angle=0, so only runs once
  for (spin = 0; spin <= 360; spin += 360 / scal) {
    rotate(radians(spin));
    Arrow(0);
    rotate(radians(-spin));
  }
  scale(1/scal, 1/scal);
  
  for(spin = 0; spin <= 360; spin += 10) {
    for(offset = 100; offset >= 0; offset -= 25) {
      rotate(radians(spin));
      Arrow(offset);
      rotate(radians(-spin));
    }
  }

}

