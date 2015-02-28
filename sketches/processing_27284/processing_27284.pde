
ivoid setup(){
  size (900,600);
  background(255);
  stroke(0);
  smooth();
}
void draw(){
if (mousePressed){
  stroke(255);
  fill(0);
} else{
  stroke(0);
  fill(255);
}
triangle(mouseX,mouseY,random(0,300), random(0,300),random(0,300),random(450
,250));
  
}

