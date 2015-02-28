

                
                
int anzahl = 10;
int value= 0;

float winkel = 0;
 
void setup () {
  
  size(500, 500);
  
  smooth ();
  
  rectMode (CENTER);
  noStroke ();
}
 
void draw () {
  background(0);
  
 if (winkel > TWO_PI) {
    winkel = 0;
  }
  
  frameRate(10);
  
  for (int i=0; i < 7; i = i + 1) {
    pushMatrix();
    translate(width/2,height/2);
    
    rotate (winkel);
 
    if(mousePressed){
      stroke(4);
      
    fill (random(255));
    scale(random(7));
    ellipse (0, 0, 180 - i * 40, 180 - i * 40);
    
  }
  else{
    
  
  winkel = winkel + 0.004;
}
 popMatrix();
 
  fill(0);
  
 //monster
 ellipse(mouseX,mouseY,160,80);
  ellipse(mouseX-20,mouseY-30,80,80);
  ellipse(mouseX+20,mouseY-30,80,80);
  ellipse(mouseX,mouseY+60,200,50);
  ellipse(mouseX-45,mouseY+150,40,40);
  ellipse(mouseX+45,mouseY+150,40,40);
  ellipse(mouseX,mouseY+100,100,100);
  
  fill(255);
  fill(255);
    ellipse(mouseX-25,mouseY-40,40,40);
    ellipse(mouseX+25,mouseY-40,40,40);
   
    
    fill(value);
        ellipse(mouseX-25,mouseY-40,20,20);
    ellipse(mouseX+25,mouseY-40,20,20);
    ellipse(mouseX,mouseY,10,10);
    
    
  }
}
void mouseMoved() {
  value= value + 5;
  if (value > 255) {
    value=0;
  }
}
      
    

