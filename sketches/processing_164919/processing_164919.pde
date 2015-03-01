
PImage Breloom;

void setup(){
  size(600,600);
  background(#19338B);
  Breloom=loadImage("Breloom.jpg");
}
void draw(){
colorMode(HSB, 100);
//First Brush
  if(key=='1')
  if (mousePressed){
    stroke(#950000);
    strokeWeight(14);
    line(mouseX,mouseY,pmouseX,pmouseY);
  }
//Second Brush
if (key=='2')
if(mousePressed){
  imageMode(CENTER);
 image(Breloom,pmouseX,pmouseY);
 }

//Third Brush
if (key=='3')
if(mousePressed){
  fill(#52009B);
  stroke(#000000);
  strokeWeight(3);
  rect(pmouseX,random(pmouseY),50,50);
  fill(#008301);
  rect(random(pmouseX),pmouseY,50,50);
  
}
  
  
}


