
class Pixel 
{ 
  // declaration ///////////
  int x; 
  int y; 
  color c,a,c2; 
  int sw; 
  int taille; 
  int col=0; 
   int i=0;
  boolean fs=false;
  boolean sense= false;
 // define the sqare buton surface
  Pixel(int x_, int y_) 
  { 
    x = x_; 
    y = y_; 
    c = color(255,255,212); 
   c2= color (0,200,0,300); 
    taille=50; 
  } 
 
// display the buton when it is pressed or not 
  void display() 
  { 
    rectMode(CENTER);
    strokeWeight(sw); 
    stroke(255);
    if(fs == true ) // when buton is pressed
      {  
        fill(c2); 
      } 
        else 
        { 
           fill(255); 
        } 
    rect(x,y,taille,taille);
  } 
 
 boolean pospix(float mx, float my) 
  { 
    boolean resp=false;         // when buton is not pressed
    if(mx>=x-taille/2 && mx<=x+taille/2) 
    { 
      if(my>=y-taille/2 && my<=y+taille/2) 
      { ;
        resp=true; 
        fs=!fs; 
      } 

    } 
    return resp; 
  } 
  
// function changing the buton color when it is pressed
 void changcolor() 
  { 
    if(fs==true) 
    { 
      float vert = green(c2); 
      if(sense ==true) 
      { 
        if(vert+2>255) 
        { 
          vert=255; 
          sense = !sense; 
        } 
        else 
        { 
          vert += 2; 
        } 
      } 
      else 
      { 
        if(vert-2<100) 
        { 
          vert=100; 
          sense = !sense; 
        } 
        else 
        { 
          vert -= 2; 
        } 
      } 
      c2 =color(0,vert,0); 
    } 
    else 
    { 
      sense = false; 
      c2 = color(0,255,0); 
    } 
  }
 
}

