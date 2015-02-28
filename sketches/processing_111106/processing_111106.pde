
void setup(){
  size(500,500);
  rectMode(CENTER); 
  
}

void draw(){
  background(0,139,191);
  noStroke();
  fill(255,255,255,50);
  triangle(width/2,mouseY,100,mouseX,400,mouseY);
  fill(255,255,255,100);
  triangle(width/2,mouseX,100,mouseY,400,mouseX);
  fill(255,255,255,50);
  triangle(mouseY,height/2,400,mouseX,100,mouseY);
  fill(255,255,255,100);
  triangle(mouseX,height/2,400,mouseY,100,mouseX);
  fill(255,255,255,50);
  triangle(width/2,mouseY,200,mouseX,200,mouseY);
  fill(255,255,255,100);
  triangle(width/2,mouseX,200,mouseY,200,mouseX);
  fill(255,255,255,50);
  triangle(mouseY,height/2,200,mouseX,200,mouseY);
  fill(255,255,255,100);
  triangle(mouseX,height/2,200,mouseY,200,mouseX);
  
 
 
  println(mouseX + " " + mouseY);  

}


