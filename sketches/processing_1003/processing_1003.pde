
/** 
 * GridFans by Lane Foulk, adapted from Rotating Blocks by Nigel Parker.
 * Many thanks to him for sharing that piece of very informational work.
 * Additional thanks to Myer Nore, one of my former math students, who
 * (now in the role of teacher) has introduced me to Processing.
 *  
 * This display is modeled on a coordinate plane where 'fans' that lie 
 * on the x and y axes are stationary.  Those in the quadrants variously
 * rotate in opposite directions, and at speeds varying with distance
 * from the Origin.  Sort of...  And is very colorful besides.  ;p
 */ 
  
int [] r    =  new int[26]; 
int [] rVal =  new int[26]; 
 
void setup() { 
 
  // Load array with initial rotation speeds 
  for(int c=0; c<26; c++)  {
    rVal[c]=c;
  }
 
  // Set the initial screen size etc   
  size(640,640);  
  smooth();  
  noStroke();    
} 
 
void draw() { 
 
    background(0); 
    int x=width/2;
    int y=height/2;
    
    for(int i=0;i<6;i++) { 
        int xL = x  - (50 * i); 
        int xR = x + (50 * i); 
         
        for(int j=0;j<6;j++) { 
          int yT = y - (50 * j);
          int yB = y + (50 * j);
          
          if(i<1)  {
            if(j<1)  {
            drawFan(x,y,30,5,radians(r[0]));
            }  else  {
               drawFan(x,yT,30,5,radians(r[i*j]));
               drawFan(x,yB,30,5,radians(r[i*j]));
               }
          }
          if(j<1)  {
            drawFan(xL,y,30,5,radians(r[i*j]));
            drawFan(xR,y,30,5,radians(r[i*j]));
          }
          drawFan(xL,yT,30,5,radians(r[i*j]));
          drawFan(xR,yT,30,5,radians(-1*r[i*j]));
          drawFan(xR,yB,30,5,radians(r[i*j]));
          drawFan(xL,yB,30,5,radians(-1*r[i*j]));
          r[i*j]=(r[i*j]+rVal[i*j])%360;
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
 


