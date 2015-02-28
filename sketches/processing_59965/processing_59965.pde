
void setup(){
  size(450,450);
  background(52,51,51);
  noCursor();
  rectMode(CENTER);
  smooth();
  frameRate(5);

}


void draw(){  
  if(mousePressed){
    stroke(0);
    strokeWeight(1.0);
  line(0,0,mouseX,mouseY);
  line(450,540,mouseX,mouseY);
  }else{
    stroke(255);
    strokeWeight(3.3);
    line (450,0,mouseX,mouseY);
    line(0,450,mouseX,mouseY);
  
}


}
