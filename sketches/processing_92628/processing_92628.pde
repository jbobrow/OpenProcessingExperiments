
color [] pal = {#FFFFFF,#FFe8ED,#F569CB,#FF9B16,#D8FF5A};

float [] rt = {.35, .06, .49, .43, .67, .01, .46, .13, .08, .06, .64, .04, .08, .12, .17};
 
Ell ell1;
Ell ell2;
Ell ell3;
Ell ell4;
 
void setup(){
  size(500,500);
  smooth();
 
  ell1 = new Ell(1, 3);
 
  ellipseMode(CENTER);
  fill(#860084);
  text("Click and slowly drag the circles to draw. Press any key to clear the screen.", 1, 498);
}
 
void draw(){
   background(pal[0]);
  noStroke();
  ell1.update();
  ell1.display();
  translate(0, 0, -50);
  rectMode(CORNERS);
  noStroke();
  fill(0);
  if((mousePressed) && (mouseX < 50 + width/19 && (mouseX > 50))){
      rect(100, 450*rt[0], 400, 425);
      }
  if((mousePressed) && (mouseX < 50 + width*2/19 && (mouseX > 50 + width/19))){
      rect(100, 450*rt[1], 400, 425);
      }
  if((mousePressed) && (mouseX < 50 + width*3/19 && (mouseX > 50 + width*2/19))){
      rect(100, 450*rt[2], 400, 425);
      }
  if((mousePressed) && (mouseX < 50 + width*4/19 && (mouseX > 50 + width*3/19))){
      rect(100, 450*rt[3], 400, 425);
      }
  if((mousePressed) && (mouseX < 50 + width*5/19 && (mouseX > 50 + width*4/19))){
      rect(100, 450*rt[4], 400, 425);
      }
  if((mousePressed) && (mouseX < 50 + width*6/19 && (mouseX > 50 + width*5/19))){
      rect(100, 450*rt[5], 400, 425);
      }
  if((mousePressed) && (mouseX < 50 + width*7/19 && (mouseX > 50 + width*6/19))){
      rect(100, 450*rt[6], 400, 425);
      }
  if((mousePressed) && (mouseX < 50 + width*8/19 && (mouseX > 50 + width*7/19))){
      rect(100, 450*rt[7], 400, 425);
      }
  if((mousePressed) && (mouseX < 50 + width*9/19 && (mouseX > 50 + width*8/19))){
      rect(100, 450*rt[8], 400, 425);
      }
  if((mousePressed) && (mouseX < 50 + width*10/19 && (mouseX > 50 + width*9/19))){
      rect(100, 450*rt[9], 400, 425);
      }
  if((mousePressed) && (mouseX < 50 + width*11/19 && (mouseX > 50 + width*10/19))){
      rect(100, 450*rt[10], 400, 425);
      }
  if((mousePressed) && (mouseX < 50 + width*12/19 && (mouseX > 50 + width*11/19))){
      rect(100, 450*rt[11], 400, 425);
      }
  if((mousePressed) && (mouseX < 50 + width*13/19 && (mouseX > 50 + width*12/19))){
      rect(100, 450*rt[12], 400, 425);
      }
  if((mousePressed) && (mouseX < 50 + width*14/19 && (mouseX > 50 + width*13/19))){
      rect(100, 450*rt[13], 400, 425);
      }
  if((mousePressed) && (mouseX < 50 + width*15/19 && (mouseX > 50 + width*14/19))){
      rect(100, 450*rt[14], 400, 425);
      }
  }
  
  class Ell {
   
  int x;
  int y;
  int d;
  int p;
  int i;
  float mx;
   
  Ell(int iTemp, int pTemp){
    d = 30;
    x = 50;
    y = 450;
    p=pTemp;
     
  }
   
  void update(){
    if((dist(x ,y,mouseX,mouseY) < 30/2 )&& (mousePressed) && (mouseX>50) && (mouseX<450)){
    x = x + (mouseX - pmouseX);
}
  }
 
void display(){
  noStroke();
  fill(pal[p]);
  ellipse(x, y, d, d);
  }
 
}
