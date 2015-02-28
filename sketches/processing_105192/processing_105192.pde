
//mouseX, mouseY, pmouseX, pmouseY
//pmouseX = previous mouse position

void setup(){
  size(1000,400);
}

void draw(){
  background(100);
  float myDifference = abs(mouseX-pmouseX);
  //abs = absolute value, because sometimes the difference is negative and color requires a positive number.
  stroke(200);
  
 //rect changes color
  rectMode(CENTER);
  fill(myDifference);
  rect(20,20,50,50);

  stroke(255);
  line(mouseX,50, pmouseX,height-50);
  println(mouseX + " : " + myDifference);
  println("The difference is; " + myDifference);
}
