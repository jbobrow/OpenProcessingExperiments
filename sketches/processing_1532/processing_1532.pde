
float c = -12;

void setup() {
  size(400, 400);
  smooth();
}

void draw() {
//background
  if (c > -10) {
  int j = 600;
  noStroke();
   for (int k = 0; k < height ; k ++) {
     stroke(0, j - k , j - k, 2);
     line(0, height - k, width, height - k);
   }
  } else 
  if (c < 20) {
    int j = 150;
    noStroke();
     for (int k = 0; k < height ; k ++) {
      stroke(0, j - 2*k , 2*j - k);
      line(0, height - k, width, height - k);
     } 
  }
  
  strokeWeight(5);
  stroke(250, 174, 174, 150);
  translate(width/2, height/2);
  fill(240, mouseX - 200, 70);
  
  //back petal
  ellipse(0, -20, 100, 140);
  
  //inner left petal
  pushMatrix();  
  rotate(radians(-c));
  ellipse(-15, -10, 80, 165);
  popMatrix();
  
  //inner right petal
  pushMatrix();
  rotate(radians(c));
  ellipse(15, -10, 80, 165);
  popMatrix();
  
  //right petal
  pushMatrix();
  rotate(radians(2*c));  
  fill(240, mouseX - 200, 70);
  stroke(250, 174, 174, 150);
  ellipse(35, -15, 80, 160);
  popMatrix();
  
  //left petal
  pushMatrix();
  rotate(radians(-2*c));
  ellipse(-35, -15, 80, 160);
  popMatrix();
  
  //stem
  fill(30, 62, 40);
  strokeWeight(1);
  rect(-4, 75, 8, height/2 + 100);
  translate(0, 75);
  
  //left petal pattern
  pushMatrix();
  rotate(radians(-2*c));
  fill(mouseX, mouseX/2, mouseX/2, 100);
  noStroke();
  ellipse(5, -60, 60, 100);
  popMatrix();
  
  //right petal pattern
  pushMatrix();
  rotate(radians(2*c));
  ellipse(-5, -60, 60, 100);
  popMatrix();
  
  fill(240, mouseX - 200, 70);
  
if (mousePressed) {
  c += 0.5;
  if (c == 20) {
    c = -12;
  }
}

//front petal
strokeWeight(5);
stroke(250, 174, 174, 150);
ellipse(0, -70, 100, 150);
fill(mouseX, mouseX/2, mouseX/2, 100);
noStroke();

//front petal pattern
ellipse(0, -25, 40, 60);
ellipse(0, -45, 60, 90);
ellipse(0, -55, 80, 120);

//leaves
fill(30, 62, 40);
beginShape();
vertex(0, height);
bezierVertex(-75, height - 300, 150, height - 200, 90, height - 400);
bezierVertex(90, height - 400, -100, height - 300, 50, height);
endShape();

strokeWeight(6);
stroke(100, 155, 100, 50);
beginShape();
vertex(-150, height);
bezierVertex(-150, height - 300, 50, height - 200, 85, height - 390);
endShape();

noStroke();
fill(30, 62, 40, 150);
beginShape();
vertex(150, height);
bezierVertex(-150, height - 100, 150, height - 350, -150, height - 400);
bezierVertex(-175, height - 400, 0, height - 100, 650, height);
endShape();

//back leaf
fill(30, 62, 40, 100);
beginShape();
vertex(0, height);
bezierVertex(200, height - 100, -150, height - 250, 175, height - 325);
bezierVertex(100, height - 300, 0, height - 100, -100, height - 100);
endShape();

strokeWeight(6);
stroke(100, 155, 100, 50);
beginShape();
vertex(150, height);
bezierVertex(0, height - 100, 75, height - 250, -145, height - 390);
endShape();
}


