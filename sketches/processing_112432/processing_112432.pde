
void setup() {
  size(400,400);
  background(0,0,0);  
}

void draw(){
  //noStroke();
  
  fill(0,0,0);
  stroke(mouseX,mouseY,0);
  strokeWeight(1);
  rect(100,100,100,100);
  fill(0,0,0,20);
 rect(50,50,100,100);
 line(50,50,100,100);
 line(150,50,200,100);
 line(50,150,100,200);
 line(150,150,200,200);
 
 println(mouseX + "" + mouseY);
 
 


 
}


