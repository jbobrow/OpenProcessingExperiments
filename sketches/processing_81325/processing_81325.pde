
//* To view the original sketch visit: http://www.openprocessing.org/sketch/75087

PImage img; 

int lineColor;
int lineSize;
  
void setup(){
  size(500, 800);
  img = loadImage ("tree.jpg");
  colorMode(HSB, 255, 255, 255, 100);
  smooth();
  background(255);
   image (img, 0, 0); 
  lineColor = 0;
  lineSize = 1;
    
}
 
void draw(){
fill(0);
 rect(0, 750, 600, 50);
  
 fill(255);
 rect(10, 760, 30, 30);
 rect(50, 760, 30, 30);
 rect(90, 760, 30, 30);

  
  if((mouseX > 90) && (mouseX < 120) && (mouseY > 760) && (mouseY < 790)){
    if(mousePressed){
       image (img, 0, 0);
     
  }
  }
  
 if(mousePressed){
   line(mouseX, mouseY, pmouseX, pmouseY);
   stroke(lineColor, 255, 255);
  
 if((mouseX > 10) && (mouseX < 40) && (mouseY > 760) && (mouseY < 790)){
     
 if(mousePressed){
      stroke(lineColor++, 255, 255);
      if (lineColor > 255){
        lineColor=0;}
         
    } else {
     stroke(lineColor, 255, 255);
 
  }}
   
     fill(lineColor, 255, 255);
 rect(10, 760, 30, 30);
  
  if((mouseX > 50) && (mouseX < 80) && (mouseY > 760) && (mouseY < 790)){
     
 if(mousePressed){
   strokeWeight(lineSize++);
   if(lineSize > 10){
     lineSize= 1;
    }
  } else {
    strokeWeight(lineSize);
  }
 rect(50, 760, 30, 30);
  }
}
 }


