
void setup(){
  size(400,400);
  background(255);
  println("To exit, please move your mouse around the centre of the screen,");
}
void draw(){
   fill(255,0,0);
  stroke(mouseX,mouseY,8);
  strokeWeight(10);
  rect(50,50,300,300);
  stroke(255);
  rect(180,180,40,40);
  if (mouseX == 200 || mouseY == 200){
    println("Please exit");
    fill(255);
    stroke(8,8,8);
  strokeWeight(10);
  ellipse(200,200,300,300);
  }else{
    println("To exit, please move your mouse around the centre of the screen");
    fill(255,0,0);
     stroke(mouseX,mouseY,8);
  strokeWeight(10);
 rect(50,50,300,300);
 stroke(255);
  rect(180,180,40,40);
  }
}
    
 
  
    
    
    


