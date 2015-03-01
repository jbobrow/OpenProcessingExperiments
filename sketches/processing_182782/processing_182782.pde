
/* @pjs preload="ragno2.png"; */
PImage ragno;

void setup(){
 size (500,500);
 background(255);
 smooth();
 ragno = loadImage("ragno2.png");
 frameRate(600);

  
 


}

void draw(){
  if(mousePressed){
    
   
   scale (random (1.08));
   strokeWeight(1);
   stroke(0);
   line(pmouseX,pmouseY,mouseX,mouseY); 
   
   
   strokeWeight(2);
   stroke(0);
   point(mouseX+35,mouseY+40);//, mouseX,mouseY );
   
   
   noFill();
   strokeWeight(0.3);
   //stroke(random(255),random(255),random(255));
   triangle(pmouseX-50,pmouseY-50,0,0,mouseX-50,mouseY-50);
   
   
   
  
  }
  if(mouseX < 550) {
    cursor(ragno,50,55);
  } else {
   cursor(HAND);
  }
  
}




void keyReleased()
{
  if (key=='c' || key=='C') {
    
    size(500,500);
    background(255);
} }


