
void setup (){
  size(400,400);
  
  background(255);
  noCursor();
  smooth();
 
}


void draw(){
  
  if(mousePressed) {
     
    background(255,129,129, 1);

  
  }else{
    
      fill(255,11,3,10);
  noStroke();
  
  
  ellipse(mouseX,mouseY, 10,10);
  
  ellipse(mouseX -100, mouseY +100, 70,70);
   
  }
  
  
  }
  
  /*  stroke(0);
  line(0,0,mouseX, mouseY);
  */
  
  
  
  

  
