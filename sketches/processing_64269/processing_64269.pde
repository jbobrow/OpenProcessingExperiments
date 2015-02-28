
color c;

void setup(){
  size(500,500);
  c = color(0);
  noStroke();
}

void draw(){
  background(255);
  fill(c);
  for(int i=0; i<width; i+=50){
    if(i%100==0)
      ellipse(i, mouseY, 25, 25);
    else
      ellipse(i, height-mouseY, 25, 25);   
  }
}

void mousePressed() {
  c = color(255,0,255);
}

void mouseReleased(){
  c = color(0);
}

