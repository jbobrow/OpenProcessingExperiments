
PImage UnicornRocker;
 PImage boottle;
 PImage boottle2;
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
boottle = loadImage("boottle.png");
boottle2 = loadImage("boottle2.png");
}


  
void draw() {
   if (mousePressed == true){
     int s = second();
  int h = hour();

    image(UnicornRocker, mouseX, mouseY, 390, 500);
    image(boottle, mouseX, mouseY + 400, 30, 60);
    image(boottle2, mouseX + 50, mouseY + 400, 60, 30);
     image(boottle2, mouseX + 350, mouseY + 400, 60, 30);
     fill(77, 71,  71, s );
  rect(0, 0, 800, 600);
  }else{


 fill(118, 115, 115);
stroke(118,115,115, 15);

strokeWeight(abs(mouseX-pmouseX));
  for (int deg1=0; deg1<360; deg1=deg1+60) {
  star(90, 50, 20,mouseX,mouseY);

  }
  }
  


 drawEyes();
 
 strokeWeight(abs(mouseX-pmouseX));
  for (int deg1=0; deg1<360; deg1=deg1+60) {
   fill(118, 115, 115);
   star(18, 100, 500,mouseX + 50,mouseY);

  }

}
 
void drawEyes() {
 
  

   fill(242, 0, 255, 20);
  drawEye(100 + mouseX,mouseY + 100);
   fill(46, 255, 61,15);
  drawEye(100 - mouseX,mouseY- 100);
 fill(86, 2, 93, 15);
   drawEye(mouseY + a * 2, mouseY + a +a);
   fill(9, 10, 240, 20);
  noStroke();
  drawEye(30 + a,mouseY);
    fill(242, 0, 255, 20);
    drawEye(400 + a, mouseY);
    drawEye(700, mouseX - mouseY);
 }
 
 
  
void drawEye(float minX, float maxX) {
    
   ellipse(map(mouseX,mouseY,50 + mouseY,minX,maxX), map(mouseY,0,60+ mouseX,25+ mouseX,350), 50, 50);
   
    
}

void star(int rays, int xradius, int yradius, int xcent, int ycent) {
     for (int deg=0; deg<360; deg=deg+60) {
       fill(118, 115, 115);
    rad1=radians(deg);
    rad2=radians(deg+120);
    x1=sin(rad1)*xradius+xcent;
    y1=cos(rad1)*yradius+ycent;
   
    y2=cos(rad2)*yradius+ycent;
    line(x1,y1,x2,y2);
     
     }   

  
}




