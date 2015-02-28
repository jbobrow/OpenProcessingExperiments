
//Eric Hines
//7-8-13
//Happy Face
//describing things is too hard

void setup(){
  size(500, 500);
  smooth();
  strokeWeight(30);
}

void draw(){
  background(204);
  stroke(102);
  if(mousePressed) {
    stroke(8);   
  }else{
    stroke(225);
  }
  rect(mouseX+1,mouseY+40,9,9);
 ellipse (mouseX-20,mouseY-20,9,9);
  ellipse(mouseX+20,mouseY-20,9,9);

}
