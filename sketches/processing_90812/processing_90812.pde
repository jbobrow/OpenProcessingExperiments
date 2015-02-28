
void setup(){
size(600,500);
background(245,193,236);
smooth();
noCursor();
}
float rad,rad1,rad2;
float x1;
float y1;
float x2;
float y2;
float minX;
float maxX;
int xcent,ycent;
int s;

void draw() {
  if (mousePressed == true){
background(0);
stroke(255);
  }else{
    stroke(244,255,129,50);
  }
  for (int deg1=0; deg1<360; deg1=deg1+60) {
    stroke(196,20,167,10);
  star(50,50 , 50, mouseX+100,mouseY+100);
  star(10, 10, 10, mouseX+5,mouseY+5);
  star(10, 10, 10, mouseX+10,mouseY+10);
  star(10, 10, 10, mouseX+10,mouseY+20);
  star(10, 10, 10, mouseX+20,mouseY+20);
  drawEyes();
  STARS(mouseX, mouseY);
  STARS(mouseX + s + 50, mouseX + s);
STARS(mouseY + s + 94, mouseX + 33);
STARS(mouseX + s - 55, mouseX - 80);


  }
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
void drawEyes() {
  fill(54,206,162,50);
  if (mousePressed == true){
background(0);
stroke(255);
  }else{
    stroke(244,255,129,50);
  }
  drawEye(10,40);
  drawEye(200,400);
  drawEye(300,400);
  drawEye(400,400);
  drawEye(500,400);
  drawEye(600,400);
  drawEye(700,400);
  drawEye(800,400);
    
 }
 void drawEye(float minX, float maxX) {
    
   ellipse(map(mouseX,mouseY,50 + mouseY,minX,maxX), map(mouseY,0,60+ mouseX,25+ mouseX,350), 50, 50);
   fill(0);
  ellipse(map(mouseX,mouseY,50 + mouseY,minX,maxX), map(mouseY,0,60+ mouseX,25+ mouseX,350), 10, 10);
   
    
}
void STARS(int x, int y){
  fill(255, 255, 255, 10);
  ellipse( x+ 5, y + 40, 7,7);
 fill(255, 255, 255, 10);
 ellipse(x + 99, y + 10, 5, 5);
 fill(255, 255, 255, 30);
 ellipse (x + 15, y + 25, 6,6);
 fill(255, 255, 255, 15);
 ellipse ( x + 66, y + 10, 7, 7);
 fill(255, 255, 255, 10);
 ellipse( x + 50, y + 90, 5, 5);
}





