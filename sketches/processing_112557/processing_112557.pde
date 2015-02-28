
void setup(){
  size(400,400);
  background(105,128,253);
  
}

void draw(){
  fill(#310A36);
  stroke(0,0,255);
  strokeWeight(2);
  rect(mouseX-50,mouseY-50,mouseX-100,mouseY-100);
  fill(#310A36);
  rect(100,100,100,100);
  line(50,50,mouseX-100,mouseY-100);
  line(150,50,200,100);
  line(50,150,100,200);
  line(150,150,200,200);
  
println(mouseX + " " + mouseY);

}


