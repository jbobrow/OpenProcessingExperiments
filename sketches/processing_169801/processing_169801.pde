
//box declaration
float bxwhite;
float bywhite;
int whiteboxSize=25;
boolean overBoxwhite=false;
boolean lockedwhite=false;
float xOffsetwhite= 0.0;
float yOffsetwhite= 0.0;

void setup()
{
  size(1600,900);
  background(0);
  bxwhite=125;
  bywhite=125;
  rectMode(RADIUS);
}

void draw()
{
  
     if (keyPressed) {
         if(key == 'n'|| key == 'N') {
          rotate(PIE);
         }
      } else {
        rotate(0);
      }
     
     if (keyPressed) {
         if(key == 'b'|| key == 'B') {
           fill(0);noStroke();
         }
      } else {
        if(mouseX>bxwhite-whiteboxSize && mouseX<bxwhite+whiteboxSize && 
     mouseY>bywhite-whiteboxSize && mouseY<bywhite+whiteboxSize)
      {
        overBoxwhite=true;
        if (!lockedwhite)
        { 
          stroke(255);
          fill(150);
        }
      }
     else {
       stroke(255);
       fill(255);
       overBoxwhite=false;
     }
     
      }
     
     ellipse(bxwhite,bywhite,whiteboxSize,whiteboxSize);
}
 
void mousePressed() 
  {
    if(overBoxwhite) {
      lockedwhite=true;
      fill(255,255,255);
    } else {
      lockedwhite=false;
    }
  
    xOffsetwhite= mouseX-bxwhite;
    yOffsetwhite= mouseY-bywhite;
  }
  
void mouseDragged() {
  if(lockedwhite) {
    bxwhite=mouseX-xOffsetwhite;
    bywhite=mouseY-yOffsetwhite;
    }
 } 
 
void mouseReleased(){
  lockedwhite=false;
 }
