
int x, y;  

 
void setup() {
  size(600, 600);
  background(0);
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
  }else if( key == 'b'){
    fill(255);
  }
  else if( key == 'r'){
    fill(random(255),random(255),random(255));
  }
   else if( key == 'm'){
    fill(random(255));
  }
 ellipse(mouseX, mouseY, 20, 20);
 
}



void keyPressed(){
  //background(255,0,0);
  if(key == CODED){
    if(keyCode == UP){
  fill(255,0,0);
}else if(keyCode == DOWN) {
   fill(0);
   rect(0,0,width,height);
}else if(keyCode == LEFT) {
   fill(0,0,255);
}else if(keyCode == RIGHT) {
   fill(0,255,0);
}
  }
}




