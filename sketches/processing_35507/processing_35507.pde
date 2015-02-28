
void setup(){
  size(300,300);
}


void draw(){
  background(mouseX,250,mouseY);
  
  stroke(250,0,0);
  line(0,mouseY,300,mouseY);
  
  line(300-mouseX,0,300-mouseX,300);
  
  line(69,0,69,300);
  
 fill(mouseY,mouseX,.5*mouseY);
 ellipse(300-mouseX,75,.25*mouseY,30);
 
 fill(mouseY-mouseX,100,mouseX);
 ellipse(300-mouseX,75,.15*mouseY,25);

 
 
 
fill(mouseX,mouseY,.5*mouseX);
ellipse(69,300-mouseY,.5*mouseX,90);

fill(mouseX,200,90);
ellipse(100,mouseY,.25*mouseX,25);

  
  
}
  

