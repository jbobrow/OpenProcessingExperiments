

float x1, y1;
float x2, y2;
float x3, y3;
float x4, y4;
float x5, y5;
float x6, y6;

int frames;

void setup() {
  size (600, 600);
  x1=200;
  y1=200;
  x2=400;
  y2=200;
  x3=200;
  y3=300;
  x4=400;
  y4=300;
  x5=200;
  y5=400;
  x6=400;
 y6= 400;
 //noFill();
 strokeWeight (5);
 frameRate(60);
frames= 0 ;
}
  
  
  void draw1()
  {
    beginShape();
    //noFill();
    fill(105,52,262);
    vertex (x2,y2);
    vertex (x1,y1);
    vertex (x3,y3);
    vertex (x4,y4);
    vertex (x6,y6);
    vertex (x5,y5);  
    endShape();
 
  }
  
  
 
 void draw2()
  {
      beginShape();
    //noFill();
    fill(105,52,262);
    vertex (x2,y2);
    vertex (x1,y1);
    vertex (x3,y3);
    vertex (x4,y4);
    vertex (x6,y6);
    endShape();
  }
 
 void draw3()
  {
      beginShape();
    //noFill();
    fill(105,52,262);
    vertex (x6,y6);
    vertex (x2,y2);
    vertex (x1,y1);
    vertex (x3,y3);
     vertex (x4,y4);  
    endShape();
  }
 
 
 void draw4()
  {
        beginShape();
    //noFill();
    fill(105,52,262);
    vertex (x6,y6);
    vertex (x2,y2);
    vertex (x1,y1);
    vertex (x5,y5);
    vertex (x3,y3);
    vertex (x4,y4);   
    endShape();
  }
  
  void draw () {
  background (0);
  stroke (255);
frames = frameCount%30;
  
  
  if(frames<=7)
  draw1 ();
  else if (frames>7&&frames<15)
  draw2 ();
  else if (frames>15&&frames<22)
  draw3 ();
  else 
  draw4 ();
  }


