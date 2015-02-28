
void setup() {
  size(500, 500);
  smooth();
  noStroke();
  fill(0);
  rect(0, 0, width, height);
 
}
 
void draw(){
 
  if(mousePressed){
   noStroke(); 
   fill(200, 20);
   rect (mouseX, 0, 20, 500);
 }
}



  


