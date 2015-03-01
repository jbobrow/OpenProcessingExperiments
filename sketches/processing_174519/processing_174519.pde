
int x,y; 
int c;

void setup() { 
 size(500, 500); 
 background(0); 
 smooth(); 
} 


void draw(){
}

void mouseDragged(){
//background;
  ellipse(mouseX,mouseY,20,20);
  noStroke();
  fill(100,30);
}

void keyPressed(){ 
 switch(key){ 
  case 'e': 
   background(0); 
   break; //  Eraser black
  case'w':
   background(255);
   break;//  Eraser white
  case'a':   
   ellipse(mouseX, mouseY,100,100);
   stroke(mouseX,mouseY,100,100);
   noFill();
   break;//maru
  case'b': 
   noStroke(); 
   fill(150,10); 
   rect(mouseX,mouseY,100,100); 
   break;
}} 



