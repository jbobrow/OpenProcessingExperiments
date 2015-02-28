
int lineColor;
int lineSize;
 
void setup(){
  size(600,500);
  colorMode(HSB, 255, 255, 255, 100);
  smooth();
  background(255);
  lineColor = 0;
  lineSize = 1;
   
}

void draw(){

fill(0);
 rect(0, 450, 600, 50);
 
 fill(255);
 rect(10, 460, 30, 30);
 rect(50, 460, 30, 30);
 rect(90, 460, 30, 30);
 
 
  if((mouseX > 90) && (mouseX < 120) && (mouseY > 460) && (mouseY < 490)){
    if(mousePressed){
     background(255);
  }
  }
 
 
 if(mousePressed){
   line(mouseX, mouseY, pmouseX, pmouseY);
   stroke(lineColor, 255, 255);
 
 if((mouseX > 10) && (mouseX < 40) && (mouseY > 460) && (mouseY < 490)){
    
 if(mousePressed){
      stroke(lineColor++, 255, 255);
      if (lineColor > 255){
        lineColor=0;}
        
    } else {
     stroke(lineColor, 255, 255);

  }}
  
     fill(lineColor, 255, 255);
 rect(10, 460, 30, 30);
 
  if((mouseX > 50) && (mouseX < 80) && (mouseY > 460) && (mouseY < 490)){
    
 if(mousePressed){
   strokeWeight(lineSize++);
   if(lineSize > 10){
     lineSize= 1;
    }
  } else {
    strokeWeight(lineSize);
  }
 rect(50, 460, 30, 30);
  }
}
 }
