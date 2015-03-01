

int y=0;
void setup() {
  size(500, 150);
  background(255);
  smooth();
}

void draw() {
  translate(0, 100);
 // text("WASSER",0,0);
  if (mousePressed) {
    pushMatrix();
    fill(255);
    rect(0, -100, 500, 150);
 
     
     

  
  for(int u=0; u<width; u+=20) {
    pushMatrix();
textSize(-mouseY);
    fill(0, 20, random(255),90);
    text("WASSER",u,random(mouseY));
    popMatrix();
    pushMatrix();
    textSize(15);
    fill(random(255),50,0,90);
    text("wasser",u,random(55));
    popMatrix();
    pushMatrix();
    textSize(10);
    
     fill(150, random(200),0,90);
    text("wasser",u,random(45));
    popMatrix();
    
  }
popMatrix();
} else {

  for (int i=0; i<width; i+=20) {
    pushMatrix();
    fill(150, random(255), 0, 10);
    textSize(75);
    text("FEUER",i,0);
    popMatrix();

    pushMatrix();
    fill(random(255), 0, 0, 30);
    textSize(50);
    text("FEUER",i,25);
    popMatrix();


    pushMatrix();

    fill(0, 0, random(255), 30);
   textSize(30);
    text("FEUER",i,45);
    popMatrix();
  }
}
}

