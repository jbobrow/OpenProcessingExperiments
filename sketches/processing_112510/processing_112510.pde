
void setup(){
  size (400,400);
  background(232,221,100);
  
}


void draw(){
  background(192);
  //noStroke();
  fill(24,24,180);
  stroke(100,32,15);
  strokeWeight(1);
  rect(mouseX-100,mouseY-100,mouseX+100,mouseY+100);
  fill(#E8D71C,50);
  rect(width/8,50,100,100);
  line(50,50,mouseX-100,mouseY-100);
  line(150,50,mouseX+mouseX,mouseY-100);
  line(50,150,mouseX-100,mouseY+mouseY);
  line(150,150,mouseX+mouseX, mouseY+mouseY);
  
  
 
  
  
  println(mouseX + " " + mouseY);
  
  
  } 


