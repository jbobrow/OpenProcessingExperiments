
void setup(){
  size (640,360);
}
void draw (){
  background (165);
  star(100,100);
  star(200,300);
}
void star(float x,float y){
  fill(120);
  stroke(255);
  strokeWeight(2);
  // variables start
  beginShape();
  vertex(x,y-50);
  vertex(x+120,y-80);
  vertex(x+160,y-40);
  vertex(x+190,y-70);
  vertex(x+200,y-75);
  vertex(x+71,y-150);
  vertex(x+130,y-20);
  endShape(CLOSE);
}
  
  
  



