
void setup(){
  size(500,500);
  background(40,80,80);
  frameRate(100);
}
 
void draw(){
  noStroke();
  fill(255,255,255,50);
  if(mousePressed == true) {
    ellipse (mouseX+random(-50,50),mouseY+random(-50,50),20,20);
    stroke(255);
    
  }
  if(keyPressed){
    if(key == '1'){
  fill(255);
  stroke(4);
  line (mouseX,mouseY,mouseX+random(-50,50),mouseY+random(-50,50));
  ellipse (mouseX+random(-50,50),mouseY+random(-50,50),5,5);
  line (mouseX,mouseY,mouseX,500);
  }}
  
    fill(89,25,90,90);
    stroke(10);
    if(keyPressed) {
    if (key == '2'){
    line (pmouseX,pmouseY,mouseX+random(-20,20),mouseY+random(-20,20));
    ellipse (mouseX ,mouseY ,20,20);
  }}
  
}

