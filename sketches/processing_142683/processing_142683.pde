
void setup (){
  size(displayWidth, displayHeight);
  background(random(0, 50), random(0, 50),random(0, 50));
  frameRate(40);
}

void draw(){
  if (mousePressed == true){
    noStroke();
    smooth();
    fill(random(0, 255), random(0, 255),random(0, 255), random(50, 255));
    rect(mouseX, mouseY, random(-50,150), random(-50, 50));
    mouseX *= mouseY;
}
}

void keyPressed(){
  if (key == TAB){
    noStroke();
    smooth();
    fill(random(0, 255), random(0, 255),random(0, 255), random(50, 255));
    ellipse(mouseX, mouseY, random(5,150), random(5, 50));
    mouseX *= mouseY;
}
  if (key == 'l'){
    smooth();
    strokeWeight(random(1, 10));
    stroke(random(0, 255), random(0, 255),random(0, 255), random(50, 255));
    line (mouseX, mouseY, random(-width/2,width/2), random(-height/2,height/2));
    mouseY *= mouseX;
}
  if (key == 'q'){
    noStroke();
    smooth();
    fill(random(0, 255), random(0, 255),random(0, 255), random(50, 255));
    quad(mouseX, mouseY, random(-width/5,width/5), random(-height/5, height/5), mouseX += random(-width/5,width/5), mouseY += random(-height/5, height/5), random(-width/5,width/4), random(-height/5, height/5));
    mouseX *= mouseY;
  }
  if (key == 'c'){
    background(random(0,55), random(0,55),random(0,55));
}
}
