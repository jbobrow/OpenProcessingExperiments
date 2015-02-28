
void setup() {
size(500,500);
background(255);
frameRate(60);
smooth();
}
void draw() {
  colorMode(RGB);
  if (keyPressed && (key == 'x')) {
    background(255);}
    
  if (key=='m'){
  if (mousePressed && (mouseButton == LEFT)) {
    stroke(0);
    strokeWeight(5);
    line(pmouseX,pmouseY,mouseX,mouseY); }
    
  if (mousePressed && (mouseButton == RIGHT)) {
    stroke(random(255));
    strokeWeight(5);
    line(pmouseX,pmouseY,mouseX,mouseY); }
  }
  if (key=='y'){
    if (mousePressed && (mouseButton == LEFT)) {
      stroke(242,255,0);
      strokeWeight(5);
      fill(242,255,0);
      line(pmouseX,pmouseY,mouseX,mouseY);
    }
    if (mousePressed && (mouseButton == RIGHT)) {
      stroke(223,230,94);
      strokeWeight(5);
      fill(223,230,94);
      line(pmouseX,pmouseY,mouseX,mouseY); }
    }
  if (key=='r'){
    if (mousePressed && (mouseButton == LEFT)) {
      stroke(212,94,49);
      strokeWeight(5);
      fill(212,94,49);
      line(pmouseX,pmouseY,mouseX,mouseY);
    }
    if (mousePressed && (mouseButton == RIGHT)) {
      stroke(133,45,11);
      strokeWeight(5);
      fill(133,45,11);
      line(pmouseX,pmouseY,mouseX,mouseY); }
    }
  if (key=='b'){
    if (mousePressed && (mouseButton == LEFT)) {
      stroke(85,172,207);
      strokeWeight(5);
      fill(85,172,207);
      line(pmouseX,pmouseY,mouseX,mouseY);
    }
    if (mousePressed && (mouseButton == RIGHT)) {
      stroke(44,93,112);
      strokeWeight(5);
      fill(44,93,112);
      line(pmouseX,pmouseY,mouseX,mouseY); }
    }
    if (key=='p'){
    if (mousePressed && (mouseButton == LEFT)) {
      stroke(163,100,232);
      strokeWeight(5);
      fill(163,100,232);
      line(pmouseX,pmouseY,mouseX,mouseY);
    }
    if (mousePressed && (mouseButton == RIGHT)) {
      stroke(101,86,117);
      strokeWeight(5);
      fill(101,86,117);
      line(pmouseX,pmouseY,mouseX,mouseY); }
    }
  if (key=='g'){
    if (mousePressed && (mouseButton == LEFT)) {
      stroke(180,241,115);
      strokeWeight(5);
      fill(180,241,115);
      line(pmouseX,pmouseY,mouseX,mouseY);
    }
    if (mousePressed && (mouseButton == RIGHT)) {
      stroke(95,133,54);
      strokeWeight(5);
      fill(95,133,54);
      line(pmouseX,pmouseY,mouseX,mouseY); }
  }
  if (key=='a'){
    if (mousePressed && (mouseButton == LEFT)) {
      stroke(random(255),random(255),random(255));
      strokeWeight(random(15));
      fill(random(255),random(255),random(255));
      line(pmouseX,pmouseY,mouseX,mouseY); }
      
    if (mousePressed && (mouseButton == RIGHT)) {
      rect(pmouseX,pmouseY,mouseX+15,mouseY+15);
      stroke(random(255),random(255),random(255));
      fill(random(255),random(255),random(255));
      strokeWeight(random(15));
    }
  }
}


