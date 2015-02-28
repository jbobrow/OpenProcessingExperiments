
void setup() {
  size(600, 400);
  noStroke();
  background(175, 224, 255, 100);
}

void drawA() {
  pushMatrix();
  fill(255, 94, 0);
  quad(100, 100, 120, 100, 80, 250, 60, 250);
  quad(100, 100, 120, 100, 180, 250, 160, 250);
  rect(95, 170, 50, 20);
  popMatrix();
}

void drawplus() {
  pushMatrix();
  fill(255, 228, 0);
  rect(250, 170, 100, 20);
  rect(290, 130, 20, 100);
  popMatrix();
}

void drawT() {
  pushMatrix();
  fill(34, 116, 28);
  rect(420,100, 130, 20);
  rect(475, 100, 20, 150);
  popMatrix();  
}

void drawFlower(){
  pushMatrix();
  fill(255,228, 0, random(100,200));
   ellipse(0,0,5,5);
  translate(random(-10,10), random(-10, 10));
  fill(255,115,random(0,184), random(1, 200));
  ellipse(5, 5, 5, 5);
  scale(random(0.25,0.25)); 
  popMatrix();
}
void drawSplus() {
  pushMatrix();
  fill(95, 0, 255, random(0,255));
  rect(120, 40, 100, 20);
  rect(160, 0, 20, 100);
  popMatrix();
}
void drawGrass(){
  pushMatrix();
  fill(71, random(200, 255), random(40, 80));
  translate(random(-20, 20), 10);
  curve(0, 0, -10, 5, 0, -10, 15, -10);
  scale(random(1.4, 1.4));
  popMatrix();
}
 

void draw() {
    drawA();
    drawplus();
    drawT();
    
  if (mousePressed && (mouseButton == LEFT)) {
    if (mouseX <=230){
      translate(mouseX, mouseY);
      drawFlower();
      drawFlower();
    }
    else if(mouseX >=230 && mouseX <= 370){
      translate(mouseX, mouseY);
      scale(random(0.25, 0.25));
      drawSplus();
    }
    else if(mouseX >=370){
      translate(mouseX, mouseY);
      drawGrass();
    }
  }
      else if(mousePressed && (mouseButton == RIGHT)) {
        background(193, 220, random(230, 255));
      }
}
