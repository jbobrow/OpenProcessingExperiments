
void setup(){
  
  size(600,400);
 background(255, 240,185);
 smooth();
  
}

void draw(){
  
   background(255, 240,185);
  
if (mouseX<200){
 strokeWeight(5);
 stroke(255);
  fill(255,5,80);
ellipse(300,200,250,250);}

if ((mouseX>200) && (mouseX<400)){
 strokeWeight(5);
 stroke(255);
  fill(25,5,255);
ellipse(300,200,250,250);}

if (mouseX>400){
 strokeWeight(5);
 stroke(255);
  fill(5,255,119);
ellipse(300,200,250,250);}

noStroke();
fill(0);
ellipse(mouseX,200,20,20);

}

