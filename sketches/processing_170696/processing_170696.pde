
void setup(){
  size(200,200);
background(225);
}
//Starts to draw squares
void draw(){
rectMode(CENTER);
rect(mouseX,mouseY,50,50);
}
//Changes shape
void mousePressed(){
}
void keyPressed(){
  fill(random(0,255), random(0,255),random(0,255));

}

