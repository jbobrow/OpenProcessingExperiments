
void setup() {
  size(300, 300);
}
int back=0;
int fishbodyA=37;
int fishA=10;
int fishB=20;
int fishbodyB=87;
int fishC=60;
int fishD=70;
int fishbodyC=137;
int fishE=110;
int fishF=120;

void draw() {
  background(0,0,back);
 
  //  First fish
  noStroke();
  fill(222,50,40);
  ellipseMode(CENTER);
  ellipse(fishbodyA, 40, 40, 20);
  triangle(fishB, 40, fishA, 30, fishA, 50);
  
  //  Second fish
  fill(0,200,50);
  ellipse(fishbodyB, 80, 40, 20);
  triangle(fishD, 80, fishC, 70, fishC, 90);
 
  // Third fish
   fill(250,255,0);
  ellipse(fishbodyC, 130, 40, 20);
  triangle(fishF, 130, fishE, 120, fishE, 140);

  back++;
  fishbodyA++;
  fishA++;
  fishB++;
  fishbodyB++;
  fishC++;
  fishD++;
  fishbodyC++;
  fishE++;
  fishF++;
  
//  Giant red crosshair
}
void mouseDragged() {
  fill(255, 0, 0);
  ellipse(mouseX, mouseY, 10, mouseY);
  ellipse(mouseX, mouseY, 10, 30);
  ellipse(mouseX, mouseY, mouseX, 20);
  ellipse(mouseX, mouseY, 10, 30);
  fill(255, 255, 0);
  ellipse(mouseX, mouseY, 20, 20);
}


