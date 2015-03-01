
void setup(){
  size(500, 500);
  background(20);
  frameRate(150);
}
  
void draw(){
 //float r = random(6,30);
 if (mousePressed){
 stroke(27, 219, 195);
 strokeWeight(4);
strokeCap(ELLIPSE);
  line(mouseX,mouseY,pmouseX,pmouseY);    // line vs ellipse?
  noStroke();
  fill(255,255,255);  
  } else {
    stroke(20);
    strokeWeight(9);
  }
  line(mouseX, mouseY, pmouseX, pmouseY);
}
