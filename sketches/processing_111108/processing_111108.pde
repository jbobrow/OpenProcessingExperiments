
void setup(){
  size(500,500);
  rectMode(CENTER); 
  
}

void draw(){
  background(0,139,191);
  strokeWeight(5);
  stroke(255,mouseX,mouseY);
  fill(255,255,255,100);
  triangle(width/2,100,100,400,400,400);
  println(mouseX + " " + mouseY);  

}


