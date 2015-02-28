
float centerX;
float centerY;
void setup() {
  size(600, 600);
  background(random(220, 256));
  frameRate(random(10, 12));
  centerX = width/2;
  centerY = height/2;
}

float off = 0.0;
void draw() {
  float bg = random(0, 20); 
  noStroke();
  fill(bg, bg, bg, 20);
  rect(0, 0, width, height);
  float redValue = random(180, 220);
  float greenValue = random(0, 30);
  float blueValue = random(0, 50);

  
  if (random(1) < 0.5) {
    off += 0.05;
  } 
  else {
    off -= 0.05;
  }
  
  centerX = (mouseX > width/2) ? mouseX : mouseX + noise(off);
  centerY = (mouseX > width/2) ? mouseY : mouseY + noise(off);
  float constant = noise(off) * random(10, 15) * random(0.5, 0.9);
  float angle = 0;
  pushMatrix();
  if (mouseX > width/2) {
    rotate(radians(random(10)));
  }
  for (int i = 40; i >= 0; i--) {
    float w;
    float h;
    if (mouseX > width/2) {
      //pushMatrix();
      
      w = i * noise(off) * random(10, 15) * random(0.5, 0.9);
      h = i * noise(off) * random(10, 15) * random(0.5, 0.9);
//      popMatrix();
    } 
    else {
      w = i * constant;
      h = i * constant;
    }
    strokeWeight(1);
    stroke(redValue+i, greenValue+i, blueValue+i, 40);
    fill(redValue+i, greenValue+i, blueValue+i, 4);
    ellipse(centerX, centerY, w, h);
  }
  popMatrix();

  frameRate(random(10, 30));
}

