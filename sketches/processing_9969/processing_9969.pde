
float xpos, ypos, snelheid, versnelling, xtarget;

void setup(){
 size (400,400);
 xpos = 10;
 ypos = 10;
 snelheid = 0;
 versnelling = 0;
 xtarget = width - 10; 
}

void draw(){
   background(222);
   versnelling = (xtarget - xpos) * 0.09;
   snelheid += versnelling;
   snelheid *= 0.95;
   xpos += snelheid;
   ypos -= snelheid;
   ellipse(xpos, ypos, 10, 10);
   
     if(mousePressed) {
    xpos = mouseX;
    fill(102);
    background(130);
    text("DOPE SHIT");
  } 
  else {
    ypos = mouseY;
    fill(50);
  }
  rect(mouseX, height/2, mouseY/2+10, mouseY/2+10);
  int inverseX = width-mouseX;
  int inverseY = height-mouseY;

}



