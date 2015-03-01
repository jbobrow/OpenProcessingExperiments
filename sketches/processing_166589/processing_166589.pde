
PImage weiner;
int value = 0;
PShape s;

void setup() {
  size(750,750);
  background(255);
}

void draw() {
  
  if (mousePressed) {
    //background(255);
  }
  
  if (key == 'q' || key =='Q') {
    //background(255);
    font(); 
      
  }
  
    if (key == 'w' || key =='W') {
      ox();   
  }
  
  if (key == 'e' || key =='E') {
    pic();
    
  }
  
}


void font() {
 background(0);
 PFont testicles;
 testicles = loadFont("SansSerif-20.vlw");
 textFont(testicles, 20);
 fill(255);
 text("make me disappear", mouseX, mouseY);
 
 fill(0);
 rect(500,0,300,300);
}



void pic() {
  weiner = loadImage("17738_surrealist_surreal.jpeg");
  image(weiner, 0, 0);
  fill(value*mouseX);
  noStroke();
  rect(0, 400, 400, 100);
  fill(value*mouseX);
  noStroke();
  rect(400, 400, 400, 100);
  fill(value*mouseX);
  noStroke();
  rect(800, 400, 400, 100);
  fill(value*mouseX);
  noStroke();
  rect(1200, 400, 400, 100);
  
  fill(value*mouseX);
  noStroke();
  rect(0, 300, 400, 100);
  fill(value*mouseX);
  noStroke();
  rect(400, 300, 400, 100);
  fill(value*mouseX);
  noStroke();
  rect(800, 300, 400, 100);
  fill(value*mouseX);
  noStroke();
  rect(1200, 300, 400, 100);
  
  fill(value*mouseX);
  noStroke();
  rect(0, 700, 400, 100);
  fill(value*mouseX);
  noStroke();
  rect(400, 700, 400, 100);
  fill(value*mouseX);
  noStroke();
  rect(800, 700, 400, 100);
  fill(value*mouseX);
  noStroke();
  rect(1200, 700, 400, 100);
  
  fill(value*mouseX);
  noStroke();
  rect(0, 800, 400, 100);
  fill(value*mouseX);
  noStroke();
  rect(400, 800, 400, 100);
  fill(value*mouseX);
  noStroke();
  rect(800, 800, 400, 100);
  fill(value*mouseX);
  noStroke();
  rect(1200, 800, 400, 100);
  

}
void mouseClicked() {
  if (value == 0) {
    value = 255;
  } else {
    value = 0;
  }
}



void ox() {
  s = loadShape("Heckert_GNU_white.svg");
  background(0);
  shape(s, mouseX, mouseY, 500, 500);
}


