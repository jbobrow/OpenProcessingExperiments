
int i = 1;

void setup(){
  size(800, 800);
  background(255);
  noStroke();
}

void draw(){
  if(mousePressed){
    int cv = (int)random(255);
    int cv2 = (int)random(255);
  translate(mouseX, mouseY);
  rotate( i);
  fill(cv, cv2,i, 20);
  beginShape();
  vertex(10,10);
  vertex(10, 20+i);
  vertex(20+i, 10);
  endShape(CLOSE);
  if(i<200){
    i++;
  }
  else{
   i=0; 
  }
}
  }
  
  void mouseReleased(){
   i=0; 
  }


