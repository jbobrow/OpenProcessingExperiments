
void setup(){
  size(600,600);
  background(255);
  noStroke();
  ellipseMode(RADIUS);
}

void splatShape(){
  ellipse(0,0,10,10);
  rect(-10,-10,10,10);
}
void drawFlower(){
  pushMatrix();
  fill(255,228, 0, random(100,200));
   ellipse(0,0,5,5);
  translate(random(-10,10), random(-10, 10));
  fill(255,115,random(0,184), random(1, 200));
  ellipse(5, 5, 5, 5);
  scale(random(0.25,0.25));
  splatShape();

  popMatrix();
}


void drawSky(){
  pushMatrix();
  fill(175, 224, 255, 100);
  ellipse(0, 0, 25, 25);
  popMatrix();
}
void drawCloud(){
  pushMatrix();
  fill(255, random(0, 100));
  ellipse(0, 0, 18, 18);
  popMatrix();
}

void drawGrass(){
  pushMatrix();
  fill(71, random(200, 255), random(40, 80));
  translate(random(-20, 20), 10);
  curve(0, 0, -10, 5, 0, -10, 15, -10);
  scale(random(0.25, 0.25));
  popMatrix();
}

void draw() {
 
  if (mousePressed && (mouseButton == LEFT)) {
    if (mouseY >=200){
      translate(mouseX, mouseY);
      drawFlower();
      drawFlower();
    } 
    else if(mouseY <=200){
      translate(mouseX, mouseY);
      drawSky();
    }
  }
      else if(mousePressed && (mouseButton == RIGHT)) {
        if(mouseY >=200){
          translate(mouseX, mouseY);
          drawGrass();
        }
        else if(mouseY <=200){
          translate(mouseX, mouseY);
          drawCloud();
        }
      }
  
}
