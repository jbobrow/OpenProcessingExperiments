
void setup(){
   smooth();
  size(500,500);}

  void draw(){
  tris();
  spin();

  polka();
 text();
  }
  
  void tris(){
    strokeWeight(2);
    fill(160);
    triangle(0,0,width,0,mouseX,mouseY);
    fill(74);
    triangle(0,0,0,height,mouseX,mouseY);
    fill(0);
    triangle(0,height,width,height,mouseX,mouseY);
    fill(84);
    triangle(width,height,width,0,mouseX,mouseY);
 
}

void spin(){
  pushMatrix();
  translate(mouseX,mouseY);
  rotate(radians(millis()/3));
  noStroke();
  fill(mouseY+50,40+second(),140);
  ellipse(0,120,mouseY%17,mouseY);
popMatrix();
}

void text(){
  textSize(50);
  if(mouseX<200){
    text("HELLO",50,50);
  if(mouseX>200){
    text("WORLD",50,250);

}}}
