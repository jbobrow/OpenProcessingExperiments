
void setup(){
  size(500,500);
  smooth();
  noStroke();
  noFill();
}
void draw(){
if((mouseX<250)&&(mouseY>250))  {
  fill(255);
  ellipse(125,375,250,250);
}else if((mouseX<250)&&(mouseY<250)){
  fill(0);
  rect(0,0,250,250);
}else if ((mouseX>250)&&(mouseY<250)){
  fill(255);
  triangle(375,0,250,250,500,250);
}else{
  fill(0);
  rect(250,250,500,500);
}
  
}


