
void setup(){
  size(600,600);
  background(250,250);
  smooth();
  noCursor();
  strokeWeight(0.2);
  frameRate(10);
}
 
 
void draw(){
  noStroke();
  fill(0,5);
  
  //horizontal
  triangle(mouseX,mouseY,250,100,350,100);
  triangle(250,500,350,500, mouseX,mouseY);
 //vertical
  triangle(100,250,100,350, mouseX,mouseY);
  triangle(mouseX,mouseY,500,250,500,350);

}


