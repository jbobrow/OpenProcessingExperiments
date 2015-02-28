
//Kang-Yu Om Liu 
//Green,Green,Grass of Home(Homework)
//who grass-bound
//my sun rises in the WEST?
//20131030

int div = 3;
void setup() {

  background(149, 182, 198);
  size(500, 500);
  frameRate(2);
}
void draw() {
  background(149, 182, 198);
    
  for(int i = 4;i<496;i+=4){
  grassdarkline(i, 480, i, 250);
  }
  
   
  if (mousePressed){
    flower(mouseX+50,mouseY+20);
    fill(244,random(117,189),random(162,209),random(160,200));
  }
  else  {    
    fill(244,random(117,189),random(162,209));
  flower(random(5,495),random(360,432));
  }
  
  grassline(5, 480, 10, 450);
  for (int i =3; i<497; i+=6) {
    grassline(i++, 500, i++, random(300, 490));
    
  }
 
  
float s =second();
  if (s<60) {
    sun(116-s, 120-s);
  } 
  else {
    fill(239, random(90, 167), 38,random(100,175));
    sun(mouseX+=10,mouseY+=10);
    }
    float ap =1;
    float m = noise(ap)*3;
   if ( m >30){
     sunset(432,200);
   }
    
  }
  
  void grassline (float gx, float gy, float ex, float ey) {
    strokeWeight(random(0,2));
    stroke(random(181, 200), 221, random(180, 209));
    float xstep = gx;
    float ystep = gy;
    float lastx = ex;
    float lasty = ey;
    float y = gx+90;
    int border = 10;
    for (int x=border; x<=width-border;x+=xstep) {

      ystep = random(15)-5;
      y += ystep;
      line(gx, gy, ex, ey++);
      lastx = gx;
      lasty = gy;
    }
  }
  
void grassdarkline(float gdx, float gdy, float edx, float edy) {
  strokeWeight(noise(3,6));
  stroke(112,107,5);
  //line(gdx,gdy,edx+10,edy-130);
  
  float x1step = (edx-gdx)/div;
  float y1step = (edy-gdy)/div;
  float lastx1 = edx;
  float lasty1 = edy;
  float y = gdy;
  float x = gdx;
  for (int i=0;i<div;i++){
    x = x+x1step;
    x = x+random(33)-15;
    y = y +y1step;
    y = y + random(38)-10;
    stroke(random(17, 65), 79, random(37, 68),random(200,255));
    strokeWeight(noise(1,2));
    line(x,height-y, lastx1, height+ lasty1);
    lastx1 = x;
    lasty1 = y;
  }
    
}



void sun(float mx, float my) {
  fill(239, random(167, 180), random(38, 40));
  noStroke();
  //center(136,150)
  ellipse(mx, my, 58, 58);
}

void sunset(float sx,float sy){
  fill(239,90,40,random(200,255));
  noStroke();
  ellipse(sx,sy,78,78);
}

void flower(float x,float y){
  //center(168,293)
  fill(244,random(117,189),random(162,209));
  noStroke();
  beginShape();
  float fX=x;
  float fY=y;
  vertex(fX,fY);
  bezierVertex(fX,fY,fX-12,fY-11,fX,fY-23);
  bezierVertex(fX,fY-23,fX+15,fY-11,fX,fY);
  endShape();
}






