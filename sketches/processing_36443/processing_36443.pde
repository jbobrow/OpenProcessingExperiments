
//homework 3
// Copyright Caroline Record Pittsburgh PA September 8, 2011


int value = 0;

void setup(){
  size(300,800);
  background (#31FFCA); 
  strokeWeight(10); 
}
void draw(){
  int value=0;

//background rectangle    
  
// fill(value);
 noStroke();
 fill(#31FFCA,20);
  rect(0,0,width,height);
 fill(240,65,random(65,182),70);
  rect(random(300),random(800), 50, 50);
  rect(random(300),random(800), 50, 50);
  rect(random(300),random(800), 50, 50);
  rect(random(300),random(800), 50, 50);
  rect(random(300),random(800), 50, 50);
  
  
//double loop grid
   stroke (random(150,255),28+mouseY,28);
       for (int ex=1; ex<6; ex=ex+1) {
    for (int ey=1; ey<6; ey=ey+1) {  
      point (ex*20+mouseX,ey*20+mouseY); 
      } 
      }
}
void mouseDragged() 
{
  value = value + 4;
  if (value > 255) {
    value = 0;
  }
}
                                
