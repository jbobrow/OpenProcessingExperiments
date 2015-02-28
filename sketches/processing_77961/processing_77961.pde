
int tamany = 50;
void setup(){
  size(500,500);
  smooth();
   background(255);
}
void draw(){
  fill(50,20,20);
 noStroke();
ellipse(mouseX-25,mouseY-15,15,15);



}
void keyPressed(){
  if(key=='r'||key=='r'){
  fill(random(255),random(255),random(255));
  rect(mouseX,mouseY,random(25,10),random(5,25));
  
  if(key=='e'||key=='e'){
  fill(random(255),random(255),random(255));
  ellipse(mouseX,mouseY,random(80,15),random(25,35));
  
  if(key=='t'||key=='t'){
  fill(random(255),random(255),random(255));
  triangle(mouseX,mouseY,random(20,25),random(25,15),random(15,15),random(10,25));
  
fill(255,255,255);

} }

  }}

  



