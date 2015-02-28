
int counter;
void setup (){
  size (800,600);
  background (#FFFFFF);
  rect (0,0,width,50);

fill (255,17,2);
rect (0,0,width/5,50);

fill (250,97,2);
rect (width/9,0,width/5,50);

fill (255,238,2);
rect (width/9*2,0,width/5,50);

fill (78,255,2);
rect (width/9*3,0,width/5,50);

fill (2,181,255);
rect (width/9*4,0,width/5,50);

fill (2,39,225);
rect (width/9*5,0,width/5,50);

fill (134,2,255);
rect (width/9*6,0,width/5,50);

fill (0,0,0);
rect (width/9*7,0,width/5,50);

fill (255,255,255);
rect (width/9*8,0,width/5,50);

}
 
void draw (){
   
  if (mousePressed && mouseX>0 && mouseX<width/9 && mouseY<50){
    strokeWeight (9);
    stroke (255,17,2);
  }
   
  if (mousePressed && mouseX>width/9 && mouseX<width/9*2 && mouseY<50){
    strokeWeight (9);
    stroke (250,97,2);
  }
   
  if (mousePressed && mouseX>width/9*2 && mouseX<width/9*3 && mouseY<50){
    strokeWeight (9);
    stroke (255,238,2);
  }
   
  if (mousePressed && mouseX>width/9*3 && mouseX<width/ 9*4 && mouseY<50){
    strokeWeight(9);
     stroke (78,255,2);
 }

     
      if (mousePressed && mouseX>width/9*4 && mouseX<width/ 9*5 && mouseY<50){
    strokeWeight(9);
    stroke (2,181,255);
    
    }
    
    
     if (mousePressed && mouseX>width/9*5 && mouseX<width/ 9*6 && mouseY<50){
    strokeWeight(9);
    stroke (2,39,225);
  }
   
    
    
     if (mousePressed && mouseX>width/9*6 && mouseX<width/9*7 && mouseY<50){
    strokeWeight(9);
    stroke (134,2,255);
  
 }
    if (mousePressed && mouseX>width/9*7 && mouseX<width/9*8 && mouseY<50){
    strokeWeight(9);
    stroke (0,0,0);
   
 }
    if (mousePressed && mouseX>width/9*8 && mouseX<width && mouseY<50){
    strokeWeight(9);
    stroke (255,255,255);
 
  }
   
  if (mousePressed&&mouseY>60){
line (mouseX,mouseY,pmouseX,pmouseY);
}
}
 

