
float bx;
float by;
int boxSize = 75;
boolean overBox = false;
boolean locked = false;
float yOffset = 0.0;
String location = "";
 
void setup()
{
  size(300, 200);
  bx = width/2.0;
  by = height/2.0;
  rectMode(RADIUS); 
}
 
void draw()
{
  background(#FFFFFF);
   
 
  // Draw the fill rectangle
for (int i=1; i < by; i++) {
 
  if (by < (5*(height/6))) {
    if (by > (height/6)){
    fill(#FF0000);
  strokeWeight(1);
  stroke(#FF0000);
    rect(bx, 5.0*height/6, 50, (5*height/6)-by);
  }
 
  }
  if (by <= height/6 && (.8-((by-106)/520))/8*1000 >= 0) {
      fill(#FF0000);
  strokeWeight(1);
  stroke(#FF0000);
    rect(bx, 5.0*height/6, 50, 2*height/3);
  }
}
   fill(#FFFFFF);
   stroke(#FFFFFF);
   rect(0,height, width, ((height/6)+12));
    
      noFill();
  strokeWeight(1);
  stroke(#C9C9C9);
    ellipse(bx, height/6, 100, 12.5);
  fill(#FF0000);
  strokeWeight(1);
  stroke(0);
    stroke(5);
    if (by < height/6)
    {noStroke();
    strokeWeight(0);
    noFill();}
    ellipse(bx, by, 100, 12.5);
    
   strokeWeight(1);
   stroke(#C9C9C9);
   line(bx-50, (height/6), bx-50, 5*(height/6)-2.5);
   line(bx+50, (height/6), bx+50, 5*(height/6)-2.5);
    
     //draw the bottom
     
   fill(#FFFFFF);
   stroke(#FFFFFF);
   rect(0,height, width, ((height/6)+12));
   strokeWeight(1);
   stroke(5);
   fill(#FF0000);
   ellipse(bx, (5.0*(height/6))-10, 100.0, 12.5);
   noFill();
   strokeWeight(1);
   stroke(#C9C9C9);
   ellipse(bx, height/6, 100, 12.5);
    
 if (by <= height/6 && (.8-((by-106)/520))/8*1000 >= 0) {
      fill(#FF0000);
  strokeWeight(1);
  stroke(#FF0000);
    stroke(0);
    ellipse(bx, height/6, 100, 12.5);
  }
    
   } 
    

   
 
void mousePressed() {
    locked = true;
    fill(#FF0000);
  yOffset = mouseY-by;
 
}
 
void mouseDragged() {
  if(locked) {
    by = mouseY-yOffset;
  }
}
 
void mouseReleased() {
  locked = false;
 
 
}
