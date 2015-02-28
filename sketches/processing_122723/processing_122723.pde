
int x, y; 
int a;
  
void setup(){
  size(600, 600);
  background(255);
  noStroke();
  smooth();
  fill(a);
   
  a = 8;
  x = width/2;
  y = height/2;
}
   
void draw() {
}
 
void mouseDragged(){
  triangle(mouseX, mouseY, 58, 20, 86, 75); 
}

void keyPressed() {
  
  
  switch(key) {
    case 'A': //random ni iro wo kimeru.
      fill(random(0,255),random(0,255),random(0,255));   
      break;
      
    case 'Z': // iro wo kuro ni modosu
      fill(0);
      break;
      
    case 'D': // hakusi ni
      background(255);   
      break;
  }
}


