
void setup(){
  size(700,700);
  background(255);
  noStroke();
  frameRate(10);
  fill(255,0,0,100)
}
int z = 1;
void draw(){
  if (mousePressed){
    ellipse(mouseX,mouseY,5,5);
  }
  if (key == 'r'){
    fill(255,0,0,100);
  }
  if (key == 'g'){
    fill(0,255,0,100);
  }
  if (key == 'b'){
    fill(0,0,255,100);
  }
  if (key == 't'){
     fill(255,255,255);
   }
   if (key == 'z'){
    background(255);
  }
  if (key == 32){
    saveFrame();
  }
  
}
