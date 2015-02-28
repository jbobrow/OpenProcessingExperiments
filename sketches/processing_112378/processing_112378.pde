
void setup(){
  size(400,400);
  background(255);
  println("Click to capture");
}
void draw(){
  background(255);
  stroke(mouseX,mouseY,20);
  strokeWeight(5);
  ellipse(200,200,10,10);
  rect(150,150,100,100);
  rect(50,50,300,300);
  if (mousePressed == true){
     stroke(mouseX,mouseY,20);
  strokeWeight(5);
  fill(255,0,0);
  rect(50,50,300,300);
  fill(255);
  rect(150,150,100,100);
  fill(8,8,8);
  ellipse(200,200,10,10);
  }else{
    fill(255);
  }
}


