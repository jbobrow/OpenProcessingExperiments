
int eSize;
int x, y;
 
void setup(){
  size(600, 600);
  background(138,43,226);
  noStroke();
  smooth();
  fill(0);
} 


void draw(){
 // ellipse(mouseX, mouseY, 10, 10);
 }

void mouseDragged(){
  ellipse(mouseX,mouseY,50,120);
}


 
 
void keyPressed() {
   switch(key) {
 
    
 // maru - random color
  case '1':            
  fill(random(255),random(255),random(255));
  println("1");
  break;
 
 
 
 // shikaku - random color
  case'2':
    noStroke();
  fill(random(255),random(255),random(255));
  rect(mouseX, mouseY,100,100);
    break;
    
    
 
 // keshigomu     
  case '3':
  fill(138,43,226);
  println("3");
  break;
 
 
 // Reset
  case '4':
  background(138,43,226);
  println("4");
  break;

  }
}


