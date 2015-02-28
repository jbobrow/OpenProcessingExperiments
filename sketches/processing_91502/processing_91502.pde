
*/
  float angle = 0;

void setup(){
  size(400,200);

  
  smooth();
}

void draw(){
  background(255);
  noStroke();
  rectMode(CENTER);
 

  
  pushMatrix(); // make the first square follow te mouse
  translate(mouseX,mouseY);
  fill(0);
  rect(0,0,80,80); //1
  popMatrix();

  pushMatrix();

  rotate(angle+=.5);
    translate(200,50); // move all 4 squares
  fill(100);
  rect(0,0,30,30);//3
