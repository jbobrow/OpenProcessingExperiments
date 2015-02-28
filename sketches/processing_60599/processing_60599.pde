
void setup(){
  size(500,500);
  smooth();
  noCursor();
  background(220);
}
 
void draw(){
   
if(mousePressed){
   
  //HARDCORE
  fill(0);
  noStroke();
  rectMode(CENTER);
  triangle(mouseX, mouseY, 250,50,150,0);
   
}
 else{
   
    
  //SOFT
  fill(255,80);
  noStroke();
  frameRate(10);   
  ellipse(mouseX, mouseY, 8,8);
}
}
