

 
void setup() {
  size(400, 400);
  smooth();
  background(0);
}
 
void draw() {
  fill(0);
  smooth();
  
 
  fill(0);
  stroke(255);
  ellipse(mouseX, mouseY, 30, 30);
   
  if(mousePressed){
    fill(155,120,0);
    ellipse( mouseX, mouseY, 30, 30);
    fill(80);
     ellipse( 200, 200, mouseX, mouseY);
  }
 
 
  fill(255);
  stroke(0);
  ellipse( mouseX, mouseY, 20, 20);
  fill(255);
  noStroke();
  ellipse( 200, 200, mouseX, mouseY);

}
                
                
