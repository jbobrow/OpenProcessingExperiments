
void setup(){
  //frameRate(2);
size(1000,600);
background(255);
}

void draw(){
  if (mousePressed){
    stroke(random(255),random(255),random(255));
    strokeWeight(random(2,20));
    strokeCap(SQUARE);
  line(mouseX,mouseY,pmouseX,pmouseY);
  }
  
}
