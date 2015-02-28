
   float x=mouseX;
   float y=mouseY;
  int radio=20;
void setup() {

  size(600,600);
 background (255);
 
 smooth ();

}

void draw() { 
     
  
  
}

void mousePressed () {

 
  stroke(0);
   
    
  line (x, y,mouseX,mouseY);
  fill(mouseX,0,mouseY); 
  ellipse(mouseX,mouseY,radio,radio); 
   x=mouseX;
   y=mouseY;
  
}

void keyPressed(){
  
 background (255 ); 
  
}



