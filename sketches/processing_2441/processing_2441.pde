
/*

Advanced Drawing
angela Seear
angelaseear@gmail.com

*/


void setup(){
  
  
  size(500,500);
  background(#363633);
  smooth();
  
  fill(0, 34, 76, 25);
  noStroke();
  rect(100, 10, 300, 300);
  rect(300, 30, 200, 200);

  
  
  
};

void draw(){
  stroke(255, 246, 2, 20);
  line(mouseX +30, mouseY, mouseX*7, mouseY*50);
  
  fill(random(10,30), random(30,50), random(50,76),40);
  noStroke();
  rect(mouseX, mouseY, random (30, 150), random(30,150));
  
  
};

