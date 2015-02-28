
int eSize;
int x, y;
 
void setup() {
  size(600, 600);
  background(255);
  noStroke();
  smooth();
  fill(0);
 
  eSize = 20; 
  x = width/2;
  y = height/2;
}
 
void draw() { 
 if(keyPressed){ 
  if(key == 'a'){ 
   fill(0); 
   noStroke(); 
   ellipse(mouseX,mouseY,eSize,eSize); 
  } 
  else if(key == 's'){ 
   fill(#ff0000); 
   noStroke(); 
   ellipse(mouseX,mouseY,eSize,eSize); 
  }
  else if(key == 'd'){ 
   fill(#0000ff); 
   noStroke(); 
   ellipse(mouseX,mouseY,eSize,eSize); 
  }
  else if(key == 'z'){ 
   fill(255); 
   noStroke(); 
   ellipse(mouseX,mouseY,eSize,eSize); 
  } 
 } 
} 

 
void mousePressed(){
  eSize = 80;
}
 
void mouseReleased(){
  eSize = 20;
}



