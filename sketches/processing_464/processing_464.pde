
int yF=0;
int speedF=5;
int spacing=10;
int endY=400;
float x=0;

void setup() {
 //default background:white
 size(1080,630);
 smooth();
}

void draw() {
  drawShore();
  drawWaves();
  drawFoot1();
  //drawFoot2();

}

void drawShore() {
   fill (224,203,168);
   rect (0,0,1080,630);
}

void drawWaves() {
   //foam:white
   yF=yF+speedF;
  if ((yF<0)||(yF>100)) {
    speedF=speedF*-1;
  }

  for (int y=60; y<=endY; y+=spacing) {
    noStroke();
    fill(8,150,190,50);
    bezier(-250,0,360,y-yF,720,y*3/2-yF,2000,0);
  }
}

void drawFoot1() {
   fill (200,163,108);
   ellipse (x,500,20,30);
   ellipse (x-30,510,20,20);
   x=x+70;
}
   
   if (drawFoot1) {
   fill (200,163,108);
   ellipse (x+35,550,20,30);
   ellipse (x+5,540,20,20);
   x=x+70;
}


/*void drawFoot2() {
   fill (200,163,108);
   ellipse (x+35,550,20,30);
   ellipse (x+5,540,20,20);
   x=x+70;
}*/

