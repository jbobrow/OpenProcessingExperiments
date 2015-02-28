
color c;
 
void setup(){
  size(500,500);
  c = color(0);
  noStroke();
}
 
void draw(){
  background(255);
  
  for(int i=0; i<width; i+=50){
    if(i%100==0){
      noStroke();
      fill(c);
      ellipse(i, mouseY, 40, 40);
    }
    else{
      stroke(0);
      fill(255);
      ellipse(i, height-mouseY, 100, 100);  
    }
  }
}
 
void mousePressed() {
  c = color(150, 50);
}
 
void mouseReleased(){
  c = color(0);
}


