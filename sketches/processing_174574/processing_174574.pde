

int x, y; 
 
  
void setup() {
  size(500, 500);
  background(255);
  noStroke();
  smooth();
  fill(255);  
} 
  
void draw() {
//   fill(255);
// ellipse(mouseX, mouseY, 20, 20); 
} 

void mouseDragged(){
  
  if(key == 'a'){
    fill(0);
  }else if( key == 'z'){
    fill(255);
  }else if( key == 's'){
    fill(random(255),random(255),random(255));
  }

 ellipse(mouseX, mouseY, 25, 25);
  
}
void keyPressed(){
  //background(255,0,0);
  if(key == CODED){
    if(keyCode == UP){
  fill(0,0,255);
}else if(keyCode == DOWN) {
   fill(255);
   rect(0,0,width,height);
}else if(keyCode == LEFT) {
   fill(0,255,0);
}else if(keyCode == RIGHT) {
   fill(255,0,0);
  }
 }
}


