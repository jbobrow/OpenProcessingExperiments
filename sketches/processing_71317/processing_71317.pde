
void setup(){
   
  size(500,500);
  background (mouseX,mouseY,mouseX);
  ellipseMode(CENTER);
    
   
}
 
void draw (){
  //line
  strokeWeight(1);
  stroke(mouseX,mouseY,mouseX-10);
line(mouseX,mouseY,mouseX-70, mouseY+130);
//ellipse
    stroke(0);
    fill(mouseX,abs(mouseX -pmouseX),mouseY);
  smooth();
  strokeWeight(random(0.1,2));
  ellipse(pmouseX,mouseY,abs (mouseX -pmouseX),abs (mouseX -pmouseX));
   
}
 
 
void keyPressed(){
   
background (mouseX,mouseY-20,mouseX-50);
   
   
}
 
 void mousePressed(){
 }


  

  
 


