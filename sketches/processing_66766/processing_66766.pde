
void setup(){
  size(400,600);
  background(0);
  smooth();
  noStroke();
}
void draw(){
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY,5,5);
  println(mousePressed);
  if(mousePressed == true){
    fill(200,230,0);
  }
  else{
    ellipseMode(CENTER);
    ellipse(mouseX,mouseY,30,30);
    fill(0);
  }
}


