
float cx, cy, rad;
float filla=0, fillb=0, fillc=0;

void setup(){
  size(500,500);
  background(0);
  frameRate(120);
  
}

boolean button=false;
void draw(){
  
  
  if(mousePressed){
    noStroke();
    fill(filla,fillb,fillc);
    //comment out the next few lines to have all circles random colors
    cx=random(-50,50);
    cy=random(-50,50);
    rad=random(5,50);
    
    
     button=true;
  /* uncomment the following to have all circles be of random coloprs
  
  filla=random(0,255);
   fillb=random(0,255);
   fillc=random(0,255);
    */
    ellipse(mouseX+cx, mouseY+cy, rad, rad);
  }
  
}
 void mouseClicked()
 {
   button=true;
   filla=random(0,255);
   fillb=random(0,255);
   fillc=random(0,255);
}



