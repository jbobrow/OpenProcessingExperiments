
int x, y;
 
void setup() {
  size(500, 500);
  background(255);
}
  
void draw() {
}
  
void mouseDragged(){
  ellipse(mouseX, mouseY, pmouseX, pmouseY);
  noFill();
  strokeWeight(3);
}
  
void keyPressed(){
 switch(key){
   case '0':
    background(255);    
    break;
    
   case '1':
    stroke(0);
    break;
    
   case '2':
    stroke(255);
    break;
    
   case '3':
    stroke(255, 0, 0);
    break;
    
   case '4':
    stroke(255, 255, 0);
    break;
    
   case '5':
    stroke(0, 255, 0);
    break;
    
       case '6':
    stroke(0, 0, 255);
    break;
    
   case '7':
    stroke(0, 255, 255);
    break;
    
   case '8':
    stroke(255, 0, 255);
    break;
    

  }
}



