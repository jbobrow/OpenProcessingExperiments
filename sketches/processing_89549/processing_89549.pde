
void setup (){
  size(480,240);
  smooth();
}
 
void draw() {
  //background (255,240) ;
  if (mousePressed){ //change the color when i click the mouse
  strokeWeight(2);
  stroke(random(0,255),random(0,255),random(0,255),random(0,255));
    ellipse(mouseX,mouseY,50,50);
    fill(random(0,255),random(0,255),random(0,255),random(0,255));
  }
  ellipse(mouseX,mouseY,50,50);
  if(keyPressed){
  background(255);
  }
}
