
void setup () {
  size (400, 400);
  smooth();
  noCursor();

}
 void draw() {
   noStroke();
  
    fill(255, 255, 255, 2);
    rect(0, 0, width, height);

    
   
    if(mousePressed){
       background(255);
       
        stroke (0);
     strokeWeight (2);
     fill (255,5);
     ellipse (200, 0, mouseY,mouseY);
     ellipse (200, 400, mouseX,mouseX);
       } 
  
  
  
  else{
         background(255);
       
        stroke (0);
     strokeWeight (20);
     fill (0);
     ellipse (200, 0, mouseY,mouseY);
     ellipse (200, 400, mouseX,mouseX);
       } 
     
  }
