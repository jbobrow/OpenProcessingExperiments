
void setup(){
  size (400,400);
  background(0);
    
}
  
  
void draw(){
  background(0);
  //noStroke();
  fill(255,0,0);
  stroke(mouseX,mouseY,225);
  strokeWeight(2);
  rect(mouseX-100,mouseY-100,mouseX+100,mouseY+100);
  fill(255,0,0,150);
  rect(width/8,50,100,100);
  line(50,50,mouseX-100,mouseY-100);
  line(150,50,mouseX+mouseX,mouseY-100);
  line(50,150,mouseX-100,mouseY+mouseY);
  line(150,150,mouseX+mouseX, mouseY+mouseY);
    
    
   
    
    
  println(mouseX + " " + mouseY);
    
    
  }



