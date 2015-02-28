
void setup () {
  size (400, 400);
  smooth();
  noCursor();

}
 void draw() {
   noStroke();
  
    fill(255, 255, 255, 100);
    rect(0, 0, width, height);

    
   
    if(mousePressed){
       strokeWeight(10);
    stroke(0);
    line(mouseX, mouseY, mouseX+mouseX, mouseY+50);
    line(mouseX, mouseY, mouseX+50, mouseY+mouseY);
    line(mouseX+mouseX, mouseY+50, mouseX+50, mouseY+mouseY);
    ellipse(mouseX,mouseY,10,10);
    ellipse(mouseX+mouseX,mouseY+50,10,10);
    ellipse(mouseX+50,mouseY+mouseY,10,10);
    fill(255, 255, 255, 200);
    strokeWeight(2);
    ellipse(mouseX+mouseX,mouseY+50,mouseX-mouseY,mouseY-mouseX);
    ellipse(mouseX,mouseY,mouseX-mouseY,mouseY-mouseX);
    ellipse(mouseX+50,mouseY+mouseY,mouseX-mouseY,mouseY-mouseX);
      
       } 
  
  
  
  else{
    strokeWeight(10);
    stroke(0);
    line(mouseX, mouseY, mouseX+mouseX, mouseY+50);
    line(mouseX, mouseY, mouseX+50, mouseY+mouseY);
    line(mouseX+mouseX, mouseY+50, mouseX+50, mouseY+mouseY);
    ellipse(mouseX,mouseY,10,10);
    ellipse(mouseX+mouseX,mouseY+50,10,10);
    ellipse(mouseX+50,mouseY+mouseY,10,10);
    fill(83,206,216,200);
    strokeWeight(2);
    ellipse(mouseX+mouseX,mouseY+50,mouseX-mouseY,mouseY-mouseX);
    ellipse(mouseX,mouseY,mouseX-mouseY,mouseY-mouseX);
    ellipse(mouseX+50,mouseY+mouseY,mouseX-mouseY,mouseY-mouseX);
     
  }}
