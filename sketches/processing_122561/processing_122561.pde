
int x,y,c = 0;
int eSize = 20;



void setup() {
  size(600, 600);
  noStroke();
  smooth();
  fill(0);
  background(255);
}
 
void draw() {
}

void mousePressed(){
  ellipse(mouseX, mouseY, 23, 23);
  }

void mouseDragged(){
   ellipse(mouseX, mouseY, random(50), random(50) );
   }

void keyPressed(){
  
  switch(key){
    case 'r':
    fill(255,0,0);
    break; // Red draw
    
    case 'b':
    fill(0,0,255);
    break; // Blue draw
    
    case 'g':
    fill(0,255,0);
    break; // Green draw
    
    case 'k':
    fill(0);
    break; //  Black draw
  
    case 'e':
    fill(255);
    break; //  Eraser(White)

    case 'z':
    background(255);
    break; //all clear
    
  
 }

}








