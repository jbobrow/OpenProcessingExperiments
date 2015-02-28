
void setup(){
  size(500,500);
  rectMode(CENTER);
}

void draw(){
  background(0,139,191);
  rect(width/2,height/2, 100,100);
  rect(width/8,height/8,100,100);
  rect(7*width/8, 7*height/8,100,100);
  println(mouseX + " " + mouseY);
  stroke(255,255,255);
  strokeWeight(3);
  
  
  if(mousePressed == true){
    fill(255,mouseX,mouseY);
  }else{
    fill(255,255,255,100);
}
}


