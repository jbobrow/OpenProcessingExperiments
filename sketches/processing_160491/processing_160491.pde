
void setup() {
  size(700, 500);
  background(0);
  smooth();
  frameRate(30);
}

void draw() {
  float r = random(2,50);
  if (mousePressed) {
    stroke(50, 100, 60);
    strokeWeight(random(5, 10));
    strokeCap(BEVEL);
    rect(40, 25, 70, 270);
    rect(600, 25, 70, 270);
    rect(600, 25, 70, 270);
    line(mouseX, mouseY, pmouseX, pmouseY); 
    noStroke();
    fill(100, 180, 50);
    fill(300, 280, 150);
    ellipse(mouseX, mouseY, r, r); 
    fill(0, random(0, 155));
    ellipse(pmouseX, pmouseY, r, r);
  }  
}


void keyPressed() {
  if (key=='s') {
    saveImage();
  }
  if (key=='z') {
    background(155);
  }
  if (key=='b') {
    filter(BLUR);
  }
}

void saveImage() {
  String fileName = timeStamp()+".tiff";
  PImage imageSave = get(0, 0, width, height);
  imageSave.save(fileName);
}

String timeStamp() {
  String timestamp = year()+"_"+month()+"_"+day()+"_"+minute()+"_"+second()+"_"+millis();
  return timestamp;
}

