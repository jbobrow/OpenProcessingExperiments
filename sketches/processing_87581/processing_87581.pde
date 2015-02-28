
float es = 50;
float ex,ey;
boolean over = false;
boolean locked = false;
float xoff, yoff;

void setup(){
    size(640,480);
    ex = width/2;
    ey = height/2;
}

void draw(){
  background(0);
  if(dist(mouseX,mouseY,ex,ey) < es/2){
     fill(200); 
     over = true;
  }
  else{
     fill(255); 
     over = false;
  }
  
  ellipse(ex, ey,  es,es);
}
void mousePressed(){
   if(over){
      locked = true;
      xoff = mouseX-ex;
      yoff = mouseY-ey;
   } 
}
void mouseDragged(){
   if(locked){
      ex = mouseX-xoff;
      ey = mouseY-yoff;
   }   
}
void mouseReleased(){
   locked = false; 
}



