
void setup() {
  size(650, 400);
  background(0);
  noStroke();
  fill(102);
}

int a = 0;

void draw() {
  background (179,220,222);

  fill(185, 163, 126);
  noStroke();
  rect(0, 150, 650, 250);
  fill(116, 109, 97);
  rect(0, 350, 650, 50);



  fill(28, 90, 40, 200);
  stroke(35, 59, 39);
  ellipse(525, 60, 90, 130);
  ellipse(555, 80, 65, 90);
  fill(103, 81, 35);
  noStroke();
  rect(555, 80, 7, 120);
  fill(255, 0, 0);
  noStroke();
  rect(80, 50, 40, 250);
  rect(495, 50, 40, 250);
  rect(80, 50, 415, 35);
  fill(54, 50, 50);
  rect(120, 85, 375, 20);
  rect(115, 100, 5, 5);
  rect(495, 100, 5, 5);
  fill(112, 166, 167);
  stroke(30, 57, 67);
  for (int i=0; i<365; i=i+15) {
    rect(120+i, 105, 15, 50);
    rect(120+i, 155, 15, 50);
  }
  fill(28, 90, 40, 240);
  stroke(35, 59, 39);
  ellipse(70, 180, 65, 90);
  fill(103, 81, 35);
  noStroke();
  rect(68, 180, 5, 120);
  fill(28, 90, 40, 150);
  stroke(35, 59, 39);
  ellipse(100, 220, 40, 60);
  fill(103, 81, 35);
  noStroke();
  rect(98, 220, 5, 80);

  fill(0, 0, 0);
  
  rect(a+40, 325, 38, 15);
  rect(a+30, 340, 60, 25);
  stroke(0, 0, 0);
  fill(142, 142, 142);
  ellipse(a+45, 363, 15, 15);
  ellipse(a+75, 363, 15, 15);
  fill(112, 166, 167);
  stroke(0, 0, 0);
  rect(a+60, 325, 20, 15);
  fill(150, 150, 150);
  stroke(100, 100, 100);
  ellipse(a+25, 365, 7, 7);
  ellipse(a+18, 360, 5, 5);
  ellipse(a+15, 355, 3, 3);
  a=(a+1)%width ;

  noStroke();

  if (mouseX< width/2){
      
  fill(255,255,255,200);
  ellipse(50,50,100,40);
  ellipse(70,35,85,50);
  ellipse(30,10,80,20);
  ellipse(300,25,100,50);
  ellipse(330,30,80,40);
  
  }
  
  if (mouseX> width/2){
      
  fill(113,113,113,200);
  ellipse(50,50,100,40);
  ellipse(70,35,85,50);
  ellipse(30,10,80,20);
  ellipse(300,25,100,50);
  ellipse(330,30,80,40);

  }
  
  
  
}

