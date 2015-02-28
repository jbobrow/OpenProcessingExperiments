


void setup(){
  size(400, 400);
  colorMode(HSB, 360, 255, 255);
 
  smooth();
  noStroke();
}

void draw(){
  pushMatrix();
    fill(0, 10);
    rect(0, 0, width, height);
  popMatrix();
  
  float scale = sin(radians(frameCount%360)) *100;

  fill(scale, 255, 255);
  translate(width/2, 0);
  ellipse(scale, mouseY, abs(scale), abs(scale));
}

