
  
int [] r    =  new int[26];
int [] rVal =  new int[26];
  
void setup() {
 
size (700,700);
background(0);
    int x=width/2;
    int y=height/2;
     
    for(int i=2;i<6;i++) {
        int xL = x  - (50 * i);
        int xR = x + (50 * i);
          
        for(int j=0;j<6;j++) {
          int yT = y - (50 * j);
          int yB = y + (50 * j);
           
          if(i<1)  {
            if(j<2)  {
            drawFan(x,y,30,5,radians(r[0]));
            }  else  {
               drawFan(x,yT,30,5,radians(r[i*j]));
               drawFan(x,yB,30,5,radians(r[i*j]));
               }
          }
          if(j<5)  {
            drawFan(xL,y,30,5,radians(r[i*j]));
            drawFan(xR,y,30,5,radians(r[i*j]));
          }
          drawFan(xL,yT,30,40,radians(r[i*j]));
          drawFan(xR,yT,30,40,radians(-1*r[i*j]));
          drawFan(xR,yB,30,40,radians(r[i*j]));
          drawFan(xL,yB,30,40,radians(-1*r[i*j]));
         
        }
    }
}
 
void drawFan(int x, int y, int w, int h, float rot)  {
  fill(random(255), random(255), random(255));
  float rat=radians(60);
  translate(x, y);
  rotate(rot);
  ellipseMode(CENTER);
  ellipse(0,0,w,h);
  rotate(rat);
  ellipse(0,0,w,h);
  rotate(rat);
  ellipse(0,0,w,h);
  rotate(-1*(rot+rat+rat));
  translate(-x,-y);
}

