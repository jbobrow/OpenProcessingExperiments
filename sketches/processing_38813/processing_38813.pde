
//Homework # 7
//Copyright Information: Samantha Zucker, Pittsburgh, PA, September 2011


  color white  = color(255,255,255);
  color peach  = color(237,169,105);
  color yellow = color(250,241,172);
  color gree   = color(224,245,210);
  color purple = color(161,131,173);
 
 float  posX, posY, easing, dia, deltaX, deltaY;

 void setup ()
 {
    size( 600, 600 );
    smooth();
    
    easing = 0.02;
    dia=50;
 }


 void draw()
 {
   
   prepScreen();
   initials(posX,posY,dia,dia); 
   wrapX();
   wrapY();
   dataWrite();
 }
 
 
 void dataWrite()
 {
  text("Vertical Speed:" + deltaY, 20, 550); 
  text("Horizontal Speed:" + deltaX, 19,565);  
 }
 
  
 void mouseMoved()
 {
 
   if(frameCount > 50)
  {
     
    //move right  
     if(mouseX > pmouseX)
      {
     deltaX = deltaX + (mouseX - pmouseX)*easing; 
      }
    
    //move down
      if(mouseY > pmouseY)
      {
     deltaY = deltaY + (mouseY - pmouseY)*easing;
      }
      
     //move left
     if(pmouseX > mouseX)
     {
      deltaX = deltaX - (pmouseX - mouseX)*easing; 
     }
     
     //move up
     if(pmouseY > mouseY)
     {
      deltaY = deltaY - (pmouseY - mouseY)*easing; 
     }
 
   }
 
 }
 
  
  void wrapY()
 {
    //vertical postion 
  posY = posY + deltaY;
   
    //wrapping on bottom
    if(posY > height + dia/2)
    {
      posY = -dia/2; 
    }
    //wrapping on top
    if(posY < -dia/2)
    {
       posY = height + dia/2 ;
    }
   
 }
 
 void wrapX()
 {
   //horizontal position
  posX = posX + deltaX;
    //wrapping on right horizontal
    if(posX > width + dia/2)
     {
       posX = -dia/2;
     }
    //wrapping on left horizontal 
    if(posX < -dia/2)
    {
       posX = width + dia/2; 
    }
 
 }
 
 void prepScreen()
 {
   noStroke();
   fill(purple,50);
   rect(0,0,width,height);
 }
 
 void initials(float x, float y, float wd, float ht)
 {
          noStroke();
           
          fill(gree);
          ellipse(x + wd/2,  y + ht/2,  wd+.5*wd, ht+.5*ht);
             
          fill(yellow);
          ellipse(x + wd/2,  y + ht/2,  wd+.25*wd,  ht+.25*ht);  
            
          fill(peach);
          ellipse(x + wd/2,  y + ht/2,  wd,     ht);
            
            
            
         //S
         fill(255,255,255);
         stroke(255,255,255);
         strokeWeight(2);
            
            
         beginShape();
            
         //reference point
         curveVertex(x+.375*wd, y+.5*ht);
            
         //shape,outside
         curveVertex(x+.35*wd, y+.35*ht);
         curveVertex(x+.3*wd, y+.25*ht);
         curveVertex(x+.25*wd, y+.225*ht);
         curveVertex(x+.2*wd, y+.225*ht);
         curveVertex(x+.15*wd, y+.25*ht);
         curveVertex(x+.1*wd, y+.35*ht);
         curveVertex(x+.113*wd, y+.4*ht);
         curveVertex(x+.15*wd, y+.45*ht);
         curveVertex(x+.2*wd, y+.5*ht);
            
         curveVertex(x+.3*wd, y+.575*ht);
         curveVertex(x+.35*wd, y+.65*ht);
         curveVertex(x+.325*wd, y+.75*ht);
         curveVertex(x+.25*wd, y+.8*ht);
         curveVertex(x+.1*wd, y+.75*ht);
         curveVertex(x+.05*wd, y+.65*ht);
         curveVertex(x+.075*wd, y+.65*ht);
         curveVertex(x+.1*wd, y+.75*ht);
         curveVertex(x+.25*wd, y+.8*ht);
         curveVertex(x+.325*wd, y+.75*ht);
         curveVertex(x+.35*wd, y+.65*ht);
         curveVertex(x+.3*wd, y+.55*ht);
         curveVertex(x+.2*wd, y+.45*ht);
         curveVertex(x+.125*wd, y+.35*ht);
         curveVertex(x+.15*wd, y+.25*ht);
         curveVertex(x+.2*wd, y+.225*ht);
         curveVertex(x+.25*wd, y+.225*ht);
         curveVertex(x+.3*wd, y+.275*ht);
         curveVertex(x+.325*wd, y+.35*ht);
         curveVertex(x+.35*wd, y+.35*ht);
         curveVertex(x+.35*wd, y+.35*ht);
            
         endShape();
            
            
         //r
         beginShape();
            
         //reference point
         curveVertex(x+.35*wd, y+.2*ht);
            
         //shape
         curveVertex(x+.4*wd, y+.25*ht);
         curveVertex(x+.45*wd, y+.45*ht);
         curveVertex(x+.45*wd, y+.55*ht);
         curveVertex(x+.45*wd, y+.8*ht);
         curveVertex(x+.475*wd, y+.8*ht);
         curveVertex(x+.45*wd, y+.55*ht);
         curveVertex(x+.45*wd, y+.45*ht);
         curveVertex(x+.5*wd, y+.3*ht);
         curveVertex(x+.55*wd, y+.25*ht);
         curveVertex(x+.6*wd, y+.3*ht);
         curveVertex(x+.65*wd, y+.3*ht);
         curveVertex(x+.625*wd, y+.25*ht);
         curveVertex(x+.575*wd, y+.225*ht);
         curveVertex(x+.5*wd, y+.3*ht);
         curveVertex(x+.45*wd, y+.45*ht);
         curveVertex(x+.45*wd, y+.35*ht);
         curveVertex(x+.45*wd, y+.25*ht);
         curveVertex(x+.4*wd, y+.25*ht);
         //reference point
         curveVertex(x+.4*wd, y+.25*ht);
            
         endShape();
           
        //z
        beginShape();
        //reference point
        curveVertex(x+.525*wd, y+.35*ht);
        //shape
        curveVertex(x+wd*.675, y+ht*.275);
        curveVertex(x+wd*.875, y+ht*.275);
        curveVertex(x+wd*.75, y+ht*.45);
        curveVertex(x+wd*.65, y+ht*.6);
        curveVertex(x+wd*.6, y+ht*.75);
        curveVertex(x+wd*.6, y+ht*.8);
        curveVertex(x+wd*.625, y+ht*.775);
        curveVertex(x+wd*.7, y+ht*.75);
        curveVertex(x+wd*.8, y+ht*.75);
        curveVertex(x+wd*.8, y+ht*.775);
        curveVertex(x+wd*.625, y+ht*.775);
        curveVertex(x+wd*.6, y+ht*.8);
        curveVertex(x+wd*.6, y+ht*.75);
        curveVertex(x+wd*.65, y+ht*.55);
        curveVertex(x+wd*.725, y+ht*.45);
        curveVertex(x+wd*.875, y+ht*.275);
        curveVertex(x+wd*.75, y+ht*.275);
        curveVertex(x+wd*.675, y+ht*.3);
        curveVertex(x+wd*.675, y+ht*.275);
           
        curveVertex(x+wd*.675, y+ht*.275);
           
        endShape();
         
 }
