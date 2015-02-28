
void setup(){
size(500,500);
smooth();
background(0,70,255);}

void draw(){
  
  strokeWeight(12);
  line (0,0,0,500);
  
  strokeWeight(8);
  line(70,0,70,400);
  
   strokeWeight(6);
  line(270,0,270,300);
  
   strokeWeight(8);
  line(400,150,400,500);


 strokeWeight(12);
  line(275,150,500,150);
  
   strokeWeight(8);
  line(70,300,400,300);
  
   strokeWeight(6);
  line(0,400,400,400);
  
   strokeWeight(20);
  line(0,500,500,500);
  
  
 pushMatrix();
translate(274,0);
noStroke();
fill(0,255,255);
rect(0,0,240,145);

popMatrix();
  
 pushMatrix();

translate(405,155);
noStroke();
fill(250,255,255,255);
rect(0,0,95,365);
 
popMatrix();

 pushMatrix();

translate(6,402);
noStroke();
fill(0,255,255);
rect(0,0,392,93);
 
popMatrix();

 pushMatrix();

translate(6,0);
noStroke();
fill(0,150,255);
rect(0,0,64,397);
 
popMatrix();

 pushMatrix();

translate(274,155);
noStroke();
fill(255,0,0);
rect(0,0,124,141);
 
popMatrix();
  
   pushMatrix();

translate(75,0);
noStroke();
fill(255,255,255);
rect(0,0,192,296);
 
popMatrix();
  

}
  


