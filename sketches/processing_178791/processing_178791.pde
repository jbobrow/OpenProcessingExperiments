
Ball b; 
Rectang r,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10; 


  


void setup() 


{
  size(700,700); 
  b = new Ball(200,200,5,1,30); 
  r = new Rectang(random(699),random(699),100,110,color(100)); 
  r1 = new Rectang(250,random(67),100,110,color(255)); 
  r2 = new Rectang(random(699),random(36),100,110,color(0,78,67)); 
  r3 = new Rectang(random(184),random(34),100,110,color(100,8,2)); 
  r4 = new Rectang(random(529),random(234),100,110,color(100,67,2));
  r5 = new Rectang(random(89),random(236),100,110,color(56,8,100)); 
  r6 = new Rectang(random(329),random(953),100,110,color(10,255,90)); 
  r7 = new Rectang(random(26),random(69),100,110,color(200,200,4)); 
  r8 = new Rectang(random(75),random(34),100,110,color(23,67,90)); 
  r9 = new Rectang(random(68),random(95),100,110,color(14,89,34));
  r10 = new Rectang(random(247),random(127),100,110,color(44,117,2)); 


} 


void draw() 
{ 
  background(0); 
  b.drawBall();  
  r.drawRectang(); 
  r1.drawRectang(); 
  r2.drawRectang();
  r3.drawRectang(); 
  r4.drawRectang(); 
  r5.drawRectang(); 
  r6.drawRectang(); 
  r7.drawRectang(); 
  r8.drawRectang();  
  r9.drawRectang(); 
  r10.drawRectang();
  r.calRectang(); 
  r1.calRectang(); 
  r2.calRectang();
  r3.calRectang(); 
  r4.calRectang(); 
  r5.calRectang(); 
  r6.calRectang(); 
  r7.calRectang(); 
  r8.calRectang();  
  r9.calRectang(); 
  r10.calRectang();      
}
  


    





void keyPressed() 
{ 

  if (keyCode == LEFT) 

  { 

    r.moveLeft(); 
    r1.moveLeft(); 
    r2.moveLeft(); 
    r3.moveLeft(); 
    r4.moveLeft(); 
    r5.moveLeft(); 
    r6.moveLeft(); 
    r7.moveLeft(); 
    r8.moveLeft(); 
    r9.moveLeft(); 
    r10.moveLeft(); 


  } 


  if (keyCode == RIGHT) 


  { 

    r.moveRight(); 
    r1.moveRight(); 
    r2.moveRight();
    r3.moveRight(); 
    r4.moveRight(); 
    r5.moveRight(); 
    r6.moveRight(); 
    r7.moveRight();
    r8.moveRight();
    r9.moveRight(); 
    r10.moveRight(); 


     


  } 


  if (keyCode == UP) 


  { 

    r.moveUp(); 
    r1.moveUp(); 
    r2.moveUp(); 
    r3.moveUp(); 
    r4.moveUp(); 
    r5.moveUp(); 
    r6.moveUp(); 
    r7.moveUp();
    r8.moveUp(); 
    r9.moveUp(); 
    r10.moveUp(); 


      


  } 

  if (keyCode == DOWN) 

  { 

    r.moveDown();
    r1.moveDown(); 
    r2.moveDown(); 
    r3.moveDown(); 
    r4.moveDown(); 
    r5.moveDown(); 
    r6.moveDown(); 
    r7.moveDown(); 
    r8.moveDown(); 
    r9.moveDown(); 
    r10.moveDown(); 


  } 
} 

class Ball 


{ 

  float xpos; 
  float ypos; 
  float xvel; 
  float yvel; 
  float size; 
  
 


    


  Ball(float x, float y, float xv, float yv, float s) 


  { 
    xpos = x; 
    ypos = y; 
    xvel = xv; 
    yvel = yv; 
    size = s; 




  } 

  void drawBall() 
  { 
    xpos += xvel; 
    ypos += yvel; 

    if ((xpos < 0) || (xpos > width))  xvel *= -1; 
    if ((ypos < 0) || (ypos > height))  yvel *= -1; 

    fill(#8CAEB2); 
    noStroke(); 
    ellipse(xpos,ypos,size,size); 


  } 
   float calculateDistance(float x, float y)
   {
     float distance=dist(xpos,ypos,x,y);
     return distance;
   }
   
}



class Rectang 

{ 
  float posx;
  float posy; 
  float w; 
  float h; 
  color c; 

  Rectang(float x1, float y1, float wt, float ht, color ctemp) 
  { 
    posx = x1; 
    posy = y1;  
    w = wt;
    h = ht; 
    c = ctemp; 

  } 
  
  void drawRectang() 
  { 
    fill(c); 
    noStroke(); 
    rect(posx,posy,w,h); 
  }
    
    void calRectang()
  {
    if(b.calculateDistance(posx,posy)<30)
    {
      fill(255,0,0);
    }
    else if(b.calculateDistance(posx,posy)>30)
    {
      fill(c);
    }
    rect(posx,posy,w,h);
  }


  void moveLeft() 
  { 
    posx -= 10; 
    
    if (posx < 0) 
    { 
     posx = 0; 
    } 
  } 
  
  void moveRight() 

  { 
    posx += 10; 
    
    if (posx > 600) 
    { 
      posx = 600; 
    } 
  } 

  void moveUp() 

  { 
    posy -= 10; 

    if (posy < 0) 
    { 
      posy = 0; 
    } 
  } 

  void moveDown() 
  { 
    posy += 10; 

    if (posy > 600) 
    { 
      posy = 600; 
    } 
  }
}
