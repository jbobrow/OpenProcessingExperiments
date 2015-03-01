
int x, y;
int eSize;

void setup(){
  
     size(500, 500);
  background(255);
  noStroke();
  smooth();
  fill(0);
  x = width;
  y = height;
  
}
    
void draw() { 
}
  
void mouseDragged(){
  triangle(mouseX, mouseY, 0,10, 0,0 );
}
 
void mouseReleased() {
  
  background(255);
  
}
  void keyPressed() {
  background(255);
  fill(255, 0, 0);
  text(key, width/2, height/2);  
  switch(key) {
    case 'a':
      x += 5;
      println("a");
      break;
 

  }
  
  }


   
  


