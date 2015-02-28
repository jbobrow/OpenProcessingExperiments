
void setup(){
  size(500,500);
  background(0,139,191);
  rectMode(CENTER); 
  
}

void draw(){
  background(0,139,191); 
  strokeWeight(5);
  stroke(0,139,191);
  triangle(width/2,100,100,400,400,400);
  println(mouseX + " " + mouseY);
  
 if(mousePressed == true){
    fill(mouseX,mouseY,255);
  }else{
    fill(0,139,191);
}
}


