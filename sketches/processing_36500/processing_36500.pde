
void setup(){
  size(500, 500);
  smooth();
  noStroke();
  fill(250);
  rect(0, 0, width, height);
}
 
void draw(){
  noStroke();
  fill(255, 0);
   
   
  if(mousePressed==true){
  stroke(2, mouseX);
  line(mouseX,mouseY,random(width),random(width));

  line(width/1, height-2, mouseX, mouseY);
  
   
}else{
  stroke(0, mouseX);
  ellipse(width/3, height-0, mouseX, mouseY);
  ellipse(width/3, 0, mouseX, mouseY);
}
 
}


