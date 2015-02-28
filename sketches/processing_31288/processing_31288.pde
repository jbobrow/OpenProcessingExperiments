
PGraphics pg1;
PGraphics pg2;
PGraphics pg3;
PGraphics backgrnd;

void setup() {
  background(255);
  size(800, 800);
  pg1 = createGraphics(800, 800,P3D);
  pg2 = createGraphics(800,800,P3D);
  pg3 = createGraphics(800,800,P3D);
  backgrnd = createGraphics(800,800,P3D);
  int x = 0;
  
 

  
}

void draw()
{
int x = 0;
int a = 800; //ellipse diameter
int b = 400; //ellipse center

ellipseMode(CENTER);

 //  while(x<0);
  {
    backgrnd.beginDraw();
      backgrnd.background(255);
    backgrnd.endDraw();
    
    pg1.beginDraw();
      pg1.background(0,0);
      pg1.fill(255);
      pg1.ellipse(b,b,a,a);
    pg1.endDraw();
    
    a = a/2;
    b = b/2;
    
    pg1.blend(backgrnd,0,0,800,800,0,0,800,800,DIFFERENCE);
    
    image(pg1,0,0);
    
 // while(x<5);
    {
    
    pg2.beginDraw();
      pg2.background(0,0);
      pg2.fill(255);
      pg2.ellipse(b,b,a,a);
      pg2.ellipse(3*b,b,a,a);
      pg2.ellipse(b,3*b,a,a);
      pg2.ellipse(3*b,3*b,a,a);
    pg2.endDraw();
    
    a=a/2;
    b=b/2;
    
/*    pg3.beginDraw();
      pg3.background(0,0);
      pg3.fill(255);
      pg3.ellipse(b,b,a,a);
*/    pg3.endDraw();
    
    pg2.blend(pg1,0,0,800,800,0,0,800,800,DIFFERENCE);
//    pg3.blend(pg2,0,0,800,800,0,0,800,800,DIFFERENCE);
    image(pg2,0,0);
//    image(pg3,0,0);
    
    x=x+1;
    }
   
   
 /*  pg3.beginDraw();
     pg3.background(0,0);
     pg3.fill(255);
     pg3.ellipse(b,b,a,a);
   pg3.endDraw();
   
   pg3.blend(pg2,0,0,800,800,0,0,800,800,DIFFERENCE);
   
   image(pg1,0,0);
   image(pg2,0,0);
   image(pg3,0,0);
   x=x+1;
*/
  }
   //image(pg1,0,0);
   //image(pg2,0,0);
  
}

