
float bxwhite;
float bywhite;
int whiteboxSize=125;
boolean overBoxwhite=false;
boolean lockedwhite=false;
float xOffsetwhite= 0.0;
float yOffsetwhite= 0.0;


float bxblack;
float byblack;
int blackboxSize=125;
boolean overBoxblack=false;
boolean lockedblack=false;
float xOffsetblack= 0.0;
float yOffsetblack= 0.0;

float bxblack2;
float byblack2;
int black2boxSize=125;
boolean overBoxblack2=false;
boolean lockedblack2=false;
float xOffsetblack2= 0.0;
float yOffsetblack2= 0.0;

float bxwhite2;
float bywhite2;
int white2boxSize=125;
boolean overBoxwhite2=false;
boolean lockedwhite2=false;
float xOffsetwhite2= 0.0;
float yOffsetwhite2= 0.0;

void setup()
{
  size(500,500);
  bxwhite=125  ;
  bywhite=125;
  bxblack=375;
  byblack=375;
  bxblack2=375;
  byblack2=125;
  bxwhite2=125;
  bywhite2=375;
  rectMode(RADIUS);
  
}

void draw()
{
  background(100);
  if(mouseX>bxwhite-whiteboxSize && mouseX<bxwhite+whiteboxSize && 
     mouseY>bywhite-whiteboxSize && mouseY<bywhite+whiteboxSize)
      {
        overBoxwhite=true;
        if (!lockedwhite)
        { 
          stroke(0);
          fill(150);
        }
      }
     else {
       stroke(255);
       fill(255);
       overBoxwhite=false;
     }
     //draw the box
     rect(bxwhite,bywhite,whiteboxSize,whiteboxSize);


  if(mouseX>bxblack-blackboxSize && mouseX<bxblack+blackboxSize && 
     mouseY>byblack-blackboxSize && mouseY<byblack+blackboxSize)
      {
        overBoxblack=true;
        if (!lockedblack)
        { 
          stroke(255);
          fill(50);
        }
      }
     else {
       stroke(0);
       fill(0);
       overBoxblack=false;
     }
     //draw the box
     rect(bxblack,byblack,blackboxSize,blackboxSize);
     
   if(mouseX>bxblack2-black2boxSize && mouseX<bxblack2+black2boxSize && 
      mouseY>byblack2-black2boxSize && mouseY<byblack2+black2boxSize)
      {
        overBoxblack2=true;
        if (!lockedblack2)
        { 
          stroke(255);
          fill(255,200,200);
        }
      }
     else {
       stroke(100,0,0);
       fill(100,0,0);
       overBoxblack2=false;
     }
     //draw the box
     rect(bxblack2,byblack2,black2boxSize,black2boxSize);
     
   if(mouseX>bxwhite2-white2boxSize && mouseX<bxwhite2+white2boxSize && 
      mouseY>bywhite2-white2boxSize && mouseY<bywhite2+white2boxSize)
      {
        overBoxwhite2=true;
        if (!lockedwhite2)
        { 
          stroke(0);
          fill(0,0,100);
        }
      }
     else {
       stroke(140,140,255);
       fill(140,140,255);
       overBoxwhite2=false;
     }
     //draw the box
     rect(bxwhite2,bywhite2,white2boxSize,white2boxSize);
}

void mousePressed() {
  if(overBoxwhite) {
    lockedwhite=true;
    fill(255,255,255);
  } else {
    lockedwhite=false;
  }
  xOffsetwhite= mouseX-bxwhite;
  yOffsetwhite= mouseY-bywhite;
  
   if(overBoxblack2) {
    lockedblack2=true;
    fill(255,255,255);
  } else {
    lockedblack2=false;
  }
  xOffsetblack2= mouseX-bxblack2;
  yOffsetblack2= mouseY-byblack2;
  
    if(overBoxblack) {
    lockedblack=true;
    fill(255,255,255);
  } else {
    lockedblack=false;
  }
  xOffsetblack= mouseX-bxblack;
  yOffsetblack= mouseY-byblack;
    if(overBoxwhite2) {
    lockedwhite2=true;
    fill(255,255,255);
  } else {
    lockedwhite2=false;
  }
  xOffsetwhite2= mouseX-bxwhite2;
  yOffsetwhite2= mouseY-bywhite2;
  
}
void mouseDragged() {
  if(lockedwhite) {
    bxwhite=mouseX-xOffsetwhite;
    bywhite=mouseY-yOffsetwhite;
    }
    
  if(lockedblack2) {
    bxblack2=mouseX-xOffsetblack2;
    byblack2=mouseY-yOffsetblack2;
   
    }
   
  if(lockedblack) {
    bxblack=mouseX-xOffsetblack;
    byblack=mouseY-yOffsetblack;    
    }
  if(lockedwhite2) {
    bxwhite2=mouseX-xOffsetwhite2;
    bywhite2=mouseY-yOffsetwhite2;
  }
}
void mouseReleased(){
  lockedwhite=false;
  lockedblack=false;
  lockedblack2=false;
  lockedwhite2=false;
}
