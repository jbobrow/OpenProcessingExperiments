
//by Nastasia Hyam
//Problem Set 3, Question 3: Fancy Brush: Spinning pretty spikes

float theta = 0.5;
float d = 0;

void setup(){
  size(600, 600, P3D); 
  background(220,140,250);
  noStroke();

  smooth();


}

void draw(){

  frameRate(20);
  fill(mouseX, mouseY);
  if (d >= 3) d *= -1;
}

void mouseDragged(){
  brush(); 
}





void brush(){ 

  fill (mouseX, mouseY, random(100, 23));



  //rotate according to mouse position
  pushMatrix();
  translate(mouseX, mouseY);

  rotateZ(theta);
  scale(d);

  beginShape();
  //draw spikes
  vertex(mouseX, -20);
  vertex(-50, 10);
  vertex(-50, 20);
  vertex(-23, 14);
  vertex(-12, 17);



  endShape(CLOSE);     

  theta += 0.7;
  d+= 0.05;

  popMatrix(); 

}
// make canvas red if key pressed
void keyPressed(){
  background(240,46,62);
}







