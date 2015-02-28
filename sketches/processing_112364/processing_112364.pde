
void setup(){
  size(400,400);
  background(255);
  println("Click and drag your mouse to trace yourself around");
}
void draw(){

if (mousePressed == true){
  stroke(8,8,8);
  strokeWeight(5);
  ellipse(mouseX,mouseY,20,20);
}else{
  background(255);
}
 
  }

 
    
  
  


