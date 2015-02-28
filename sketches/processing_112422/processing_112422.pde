
void setup() {
  size(400,400);
  background(255,255,255);  
}

void draw(){
  background(255,255,255);
strokeWeight(1);
  fill(208,32,144);
  stroke(mouseX,mouseY,0);
  rect(50,50,50,50);
  fill(255,0,20);
 rect(mouseX,mouseY,100,100);
 line(50,50,mouseX,mouseY);
 line(100,50,mouseX+100,mouseY);
 line(100,100,mouseX+100,mouseY+100);
 line(50,100,mouseX,mouseY+100);
 
 println(mouseX + "" + mouseY);
 
 
 


 
}


