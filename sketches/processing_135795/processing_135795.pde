
void setup(){
  size(400,400);
  smooth();
  
}
void draw(){
  float r=random(400);
  float y=random(400);
  frameRate(30);
  background(20,mouseY+45,mouseY+70);
  //sun
  fill(255,244,114);
  ellipse(250,400-mouseY,320-mouseY/1.3,320-mouseY/1.3);
  
  //moon
  fill(255,200);
  ellipse(mouseY,mouseY,90,90);
  
  //saturn
  noStroke();
  fill(43,255,0);
  ellipse(mouseX,155,40,40);
  noFill();
  strokeWeight(5);
  stroke(255);
  ellipse(mouseX, 150, 50,30);
 
  
  // stars
  stroke(255);
  strokeWeight(4);
  point(r,y);
  point(r+y,y+r);
  point(r+r,y+y);
 
  //grass
  noStroke();
  fill(28,107,160);
  rect(0,300,width,100);
}
