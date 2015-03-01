
float x1, y1;
float x2, y2;
float x3, y3;
float x4, y4;

int frames;

void setup() {
  size (800, 600);
  x1=100;
  y1=100;
  x2=700;
  y2=100;
  x3=100;
  y3=500;
  x4=700;
  y4=500;
  
 //noFill();
 strokeWeight (5);
 frameRate(10);
frames= 0 ;
}
  
  
  void draw1()
  {
    beginShape();
    //noFill();
    fill(105,52,262);
    vertex (x1,y1);
    vertex (x2,y2);
    vertex (x3,y3);
    vertex (x4,y4);
    endShape();
 
  }
   void draw2()
  {
      beginShape();
    //noFill();
    fill(105,52,262);
    vertex (x3,y3);
    vertex (x1,y1);
    vertex (x4,y4);
    vertex (x2,y2);
    endShape();
  }
 
 void draw3()
  {
      beginShape();
    //noFill();
    fill(105,52,262);
    vertex (x1,y1);
    vertex (x4,y4);
    vertex (x3,y3);
     vertex (x2,y2);  
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
 
  }


