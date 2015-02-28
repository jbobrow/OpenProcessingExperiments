

int prevY;



void setup(){
 size(400, 400);
 smooth();
 background(255); 
}

float printable;
/////////////////////////////////////////////
void draw(){
 noStroke();
  fill(155, 10*abs(mouseY-prevY)+5);
  
  print(mouseY-prevY);
  rect(0,0,width,height);
float weight = (((float)mouseY/(float)height)*2)-1;///works
  
 for(int i = 1; i <= width; i++)
 {
   stroke(255, 0, 0);
   beginShape();
   vertex(i, 0.7*weight*i*(cos(((float)i/width)*HALF_PI)));
   endShape();
 }
 
 
 for(int i = 1; i <= width; i++)
 {
   stroke(255, 127, 0);
   beginShape();
   vertex(i, 0.85*weight*i*(cos(((float)i/width)*HALF_PI)));
   endShape();
 }
 
 for(int i = 1; i <= width; i++)
 {
   stroke(255, 255, 0);
   beginShape();
   vertex(i, weight*i*(cos(((float)i/width)*HALF_PI)));
   endShape();
 }

 for(int i = 1; i <= width; i++)
 {
   stroke(152, 255, 0);
   beginShape();
   vertex(i, 1.2*weight*i*(cos(((float)i/width)*HALF_PI)));
   endShape();
 }
 
 for(int i = 1; i <= width; i++)
 {
   stroke(0, 255, 0);
   beginShape();
   vertex(i, 1.5*weight*i*(cos(((float)i/width)*HALF_PI)));
   endShape();
 }
 
  for(int i = 1; i <= width; i++)
 {
   stroke(0, 255, 152);
   beginShape();
   vertex(i, 1.9*weight*i*(cos(((float)i/width)*HALF_PI)));
   endShape();
 }  
 
  for(int i = 1; i <= width; i++)
 {
   stroke(0, 255, 255);
   beginShape();
   vertex(i, 2.4*weight*i*(cos(((float)i/width)*HALF_PI)));
   endShape();
 }  
 
  for(int i = 1; i <= width; i++)
 {
   stroke(0, 152, 255);
   beginShape();
   vertex(i, 2.9*weight*i*(cos(((float)i/width)*HALF_PI)));
   endShape();
 }  
 
  for(int i = 1; i <= width; i++)
 {
   stroke(0, 0, 255);
   beginShape();
   vertex(i, 3.5*weight*i*(cos(((float)i/width)*HALF_PI)));
   endShape();
 }  
 

 prevY=mouseY;
 
}

