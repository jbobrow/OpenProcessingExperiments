
 PImage sum;


void setup(){

 frameRate (20);
 size (900, 900);
 noStroke();
 smooth();


 imageMode(CENTER);
   sum = loadImage("sum.png");

   image(sum, width/2, height/2);  
   

 } 
  
  void draw(){
    

  float wide = dist(mouseX,mouseY, pmouseX, pmouseY);
  fill(random(0,255),random(0,255),random(0,255), 80);
  
  if (mousePressed){
   if (mouseButton == LEFT) {
beginShape();
curveVertex(mouseX,mouseY);
curveVertex(mouseX,mouseY);
curveVertex(mouseX+wide/3,mouseY+wide/2);
curveVertex (mouseX, mouseY+wide/1.2);
curveVertex(mouseX-wide/3,mouseY+wide/2);
curveVertex(mouseX,mouseY);
curveVertex(mouseX,mouseY);
endShape();


   }
 
  }



}


