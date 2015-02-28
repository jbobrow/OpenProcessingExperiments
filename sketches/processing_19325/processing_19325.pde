
float cx, cy, rad;
float filla=0, fillb=0, fillc=0;

void setup(){
  size(500,500);
  background(19,218,225,5);
  frameRate(60);
  
}

boolean button=false;
void draw(){
  
  
  if(button==true){
    noStroke();
    fill(filla,fillb,fillc);
    cx=random(-50,50);
    cy=random(-50,50);
    rad=random(5,50);
    button=false;
  }
  ellipse(mouseX+cx, mouseY+cy, rad, rad);
}
 void mouseClicked()
 {
   button=true;
   filla=random(0,255);
   fillb=random(0,255);
   fillc=random(0,255);
}



