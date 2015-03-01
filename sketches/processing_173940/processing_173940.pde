

int y=0;
void setup() {
  size(500, 150);
  background(255);
  smooth();
}

void draw() {
  translate(0, 100);
  ellipseMode(CENTER);
  if (mousePressed) {
    pushMatrix();
    fill(255);
    rect(0, -100, 500, 150);
 
     
     

  
  for(int u=0; u<width; u+=20) {

    fill(0, 20, random(255),90);
    ellipse(u,random(mouseY),10,10);
    
  }
popMatrix();
} else {

  for (int i=0; i<width; i+=20) {
    pushMatrix();
    fill(150, random(255), 0, 10);
    noStroke();
    ellipse(i, 0, 150, 150);
    popMatrix();

    pushMatrix();
    fill(random(255), 0, 0, 30);
    noStroke();
    ellipse(i, 20, 100, 100);
    popMatrix();


    pushMatrix();

    fill(0, 0, random(255), 30);
    noStroke();
    ellipse(i, 50, 70, 70);
    popMatrix();
  }
}
}

