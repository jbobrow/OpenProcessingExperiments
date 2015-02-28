
void setup() {
  size(600,600);
    smooth();
}

void draw() {
  //fill(((mouseX+mouseY)/1200)*255);
  
  
  if(mousePressed){
    strokeWeight(random(0,20));
   stroke(mouseX * 0.425, mouseY*0.425, random(0,255));
  line(mouseX, mouseY,pmouseX, pmouseY);
  fill((600-mouseX) * 0.425, (600-mouseY)*0.425, 0);
  line(600-mouseX,600-mouseY,600-pmouseX,600-pmouseY);
  }
   
}

