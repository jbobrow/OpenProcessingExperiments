
void setup(){
   smooth();
  size(500,500);}

  void draw(){
  tris();
  spin();
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
  translate((mouseX+pmouseX)/2,pmouseY);
  rotate(radians(millis()/3));
  noStroke();
  fill(mouseY+second(),40+3*second(),140+second(),millis()%255+40);
  ellipse(0,120,mouseY%17,mouseY);
popMatrix();
}

void text(){
  textSize(50);

 fill (mouseY+second(),40+3*second(),140+second(),255);
  if(mouseX<200||mouseY<100){
    text("WORLD",310,350);}
  if(mouseX>250||mouseY>150){
    text("HELLO",50,90);}
}
