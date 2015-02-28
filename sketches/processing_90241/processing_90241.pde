
PImage UnicornRocker;
   int a = second();
  int h = hour();
  float rad,rad1,rad2;
float x1=80;
float y1=60;
float x2=250;
float y2=250;
int xcent,ycent;

void setup(){
 

size(800,600); 
 background(0);
UnicornRocker = loadImage("UnicornRocker.png");
}


  
void draw() {
   if (mousePressed == true){
    image(UnicornRocker, mouseX, mouseY, 390, 500);
  }else{


STARS(mouseX - a - 100, mouseX - 100);
stroke(255,255,255,15);
strokeWeight(abs(mouseX-pmouseX));
  for (int deg1=0; deg1<360; deg1=deg1+60) {
  star(120,60,30,mouseX,mouseY);
  
 STARS(500 + mouseY, mouseX);

  }
  }
  


 drawEyes();
 
 strokeWeight(abs(mouseX-pmouseX));
  for (int deg1=0; deg1<360; deg1=deg1+60) {
  
   star(18, 100, 500,mouseX + 50,mouseY);

  }

}
 
void drawEyes() {
 
  
  fill(9, 10, 240, 60);
  noStroke();
  drawEye(0 + a,mouseY);
  fill(46, 255, 61, 60);
  drawEye(100 + mouseX,mouseY);
fill(135, 197, 247, 60);
  drawEye(mouseX,mouseY);
 fill(255, 100, 227, 60);
 drawEye(mouseY + a, mouseY + a +a);
 fill(86, 2, 93, 60);
 drawEye(mouseY + a + 20, mouseX + a + 27);
  fill(25, 193, 192, 60);
  drawEye(mouseX, mouseY);
   fill(46, 255, 61, 60);
  drawEye(200 + mouseX,mouseY);
   fill(242, 0, 255, 60);
  drawEye(100 + mouseX,mouseY + 100);
   fill(46, 255, 61, 60);
  drawEye(100 - mouseX,mouseY- 100);
 fill(86, 2, 93, 60);
   drawEye(mouseY + a * 2, mouseY + a +a);
   fill(9, 10, 240, 60);
  noStroke();
  drawEye(30 + a,mouseY);
    fill(242, 0, 255, 60);
    drawEye(400 + a, mouseY);
    drawEye(700, mouseX - mouseY);
 }
 
 
  
void drawEye(float minX, float maxX) {
    
   ellipse(map(mouseX,mouseY,50 + mouseY,minX,maxX), map(mouseY,0,60+ mouseX,25+ mouseX,350), 50, 50);
   
    
}

void STARS(int x, int y){
  fill(234, 210 + a, 245, 60 + a);
  ellipse( x+ 5, y + 40, 7,7);
 fill(8 + a, 255, 179 + a, 60);
 ellipse(x + 9 + a, y + 10, 5, 2);
 fill(252, 145, 246, 60);
 ellipse (x + 15, y + 25, 6,6);
 fill(15, 57, 255, 60);
 ellipse ( x + 6, y + 10, 7, 1);

}
void star(int rays, int xradius, int yradius, int xcent, int ycent) {
     for (int deg=0; deg<360; deg=deg+60) {
    rad1=radians(deg);
    rad2=radians(deg+120);
    x1=sin(rad1)*xradius+xcent;
    y1=cos(rad1)*yradius+ycent;
    x2=sin(rad2)*xradius+xcent;
    y2=cos(rad2)*yradius+ycent;
    line(x1,y1,x2,y2);
     
     }   

  
}




