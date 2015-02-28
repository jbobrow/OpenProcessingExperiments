
float r;
 float g;
 float b;
  
  
void setup() {
 size(400,400);
 
   
   
}
  
  
void draw() {
    
   
    
   
  fill(0);
   
  fill(255);
  rect(75,150,100,100);
  fill(0);
  // pupil
  int x1 = constrain(mouseX,75,175-10);
  int y1 = constrain(mouseY,150,250-10);
  rect(x1,y1,10,10);
    
   
  fill(0);
  //map
  fill(255);
  rect(225,150,100,100);
  fill(0);
  int x2 = constrain(mouseX,225,325-10);
  int y2 = constrain(mouseY,150,250-10);
  rect(x2,y2,10,10);
  // pupille
  //fill(0);
  //float x2 = map(mouseX,0,width,225,325-10);
  //float y2 = map(mouseY,0,height,150,250-10);
  //rect(x2,y2,10,10);
  
    
}
 
void mousePressed() {
  //this will execute any time you press a key—it will paint over anything else that's there
//make background color random
r=random(255);
g=random(255);
b=random(255);
 
background(r,g,b);
 
 
 
  
   
   
}


