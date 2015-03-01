
color c = color(255, 255, 255, 120);
color d = color(255, 255, 255, 255);
color e = color(50, 255, 150);
float x = 0;
float y = 100;
float y2 = 150;
float y3 = 230;
float y4 = 300;
float y5 = 330;
float speed = 3;

int xPos = 200;
int xPos2 = 300;
int xPos3 = 150;
int xPos4 = 450;
int xPos5 = 50;
int xPos6 = 500;
int xPos7 = 634;
int xPos8 = 280;
int xPos9 = 333;
int xPos10 = mouseX;
int xDir = 5;
int xDir2 = 3;
int xDir3 = 1;
int xDir4 = 2;
int xDir5 = 4;

void setup() {
  size(1000, 1000);
  background(30, 150, 255);
  smooth();
}

void draw() {
  {
   background(30, 30, 100); 

   fill(d);
   rect(xPos, 200, 10, 10);
   xPos=xPos+xDir;
      
   fill(c);
   rect(xPos2, 300, 9, 9);
   xPos2=xPos2+xDir;
    
   fill(c);
   rect(xPos3, 100, 11, 11);
   xPos3=xPos3+xDir2;
   
   fill(d);
   rect(xPos4, 230, 7, 7);
   xPos4=xPos4+xDir3;
   
   fill(c);
   rect(xPos5, 30, 5, 5);
   xPos5=xPos5+xDir3;
   
   fill(c);
   rect(xPos6, 198, 12, 12);
   xPos6=xPos6+xDir4;
   
   fill(c);
   rect(xPos7, 287, 6, 6);
   xPos7=xPos7+xDir3;
   
   fill(c);
   rect(xPos8, 143, 8, 8);
   xPos8=xPos8+xDir5;
   
   fill(c);
   rect(xPos9, 333, 13, 13);
   xPos9=xPos9+xDir3;
  }
  
  fill(100, 255, 255);
  rect(0, 450, 1000, 600);
  
  fill(255, 255, 230);
  beginShape(); 
  vertex(0, 600);
  vertex(80, 590);
  vertex(150, 580);
  vertex(800, 500);
  vertex(1000, 470);
  vertex(1000, 1000);
  vertex(0, 1000);
  endShape();
  strokeWeight(0);
  
  fill(20, 255, 20);
  beginShape();  
  vertex(800, 0);
  vertex(700, 80);
  vertex(650, 150);
  vertex(680, 130);
  vertex(770, 100);
  vertex(820, 10);
  vertex(850, 40);
  vertex(1000, 10);
  vertex(1000, 0);
  endShape();
  strokeWeight(0);
  
  fill(50, 200, 120);
  beginShape();
  vertex(970, 0);
  vertex(850, 45);
  vertex(820, 140);
  vertex(900, 100);
  vertex(950, 70);
  vertex(1000, 20);
  vertex(1000, 0);
  endShape();
  
  fill(50, 150, 120);
  beginShape();
  vertex(1000, 20);
  vertex(800, 300);
  vertex(750, 350);
  vertex(850, 330);
  vertex(1000, 250);
  endShape();
  
}

  void mouseClicked() {
     fill(e);
     rect(mouseX, mouseY, 80, 80);
     xPos10=xPos10+xDir;
}
