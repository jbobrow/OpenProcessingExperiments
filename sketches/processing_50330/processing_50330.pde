
//homework 4
//copyright russell andrews rwandrew 2012

float dens;

int trans;

void setup(){
  size(400,400);
  smooth();
  noStroke();
  background(255);
  dens = 20;
  trans = color(255);
}

void draw(){
  //background (255);
  frameRate(dens);
  fill(trans);
  float x = random(mouseX-width/16, mouseX+width/16);
  float y = random(mouseY-width/16, mouseY+width/16);
  float z = random(1, 10);
  ellipse(x, y, z, z);
  if (dens > 100) {
    dens = 100;
  }
  if (dens < 2) {
    dens = 2;
  }
}

void mouseClicked(){
  trans = color(random(255), random(255), random(255));
  
}

void keyPressed(){
  if (keyCode == UP){
    dens = dens + 7;
  }
  if (keyCode == DOWN){
    dens = dens - 7;
  }
  if (key == ' '){
    background(255);
  }
}


