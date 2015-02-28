
void setup (){
  size(displayWidth, displayHeight);
  background(random(0, 10), random(0, 10),random(0, 10));
  frameRate(30);
}

void draw(){
  if (mousePressed == true){
    noStroke();
    smooth();
    fill(random(0, 255), random(0, 255),random(0, 255), random(50, 255));
    rect(mouseX, mouseY, random(5,50), random(5, 50));
    mouseX += mouseY;
}
}

void keyPressed(){
  if (key == TAB){
    noStroke();
    smooth();
    fill(random(0, 255), random(0, 255),random(0, 255), random(50, 255));
    ellipse(mouseX, mouseY, random(5,50), random(5, 50));
    mouseX += mouseY;
}
  if (key == 'l'){
    smooth();
    strokeWeight(random(1, 10));
    stroke(random(0, 255), random(0, 255),random(0, 255), random(50, 255));
    line (mouseX, mouseY, random(0,width), random(0, height));
    mouseY += mouseX;
}
  if (key == 'q'){
    noStroke();
    smooth();
    fill(random(0, 255), random(0, 255),random(0, 255), random(50, 255));
    quad(mouseX, mouseY, random(5,width/15), random(5, height/15), mouseX += random(5,width/15), mouseY += random(5, height/10), random(5,width/10), random(5, height/5));
    mouseX += mouseY;
  }
  if (key == 'c'){
    background(random(0,55), random(0,55),random(0,55));
}
}
