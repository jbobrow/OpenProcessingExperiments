
void setup() {
  size(600,600);
  smooth();

}

void draw() {
  background(0,1,0);
  float factor = constrain(mouseX/10,0,5);
  fill(240);
  noStroke();
  rectMode(CENTER);
  ellipseMode(CENTER);
  
  textSize(32);
text("I See You", 50, 60); 
fill(255);

 

  ellipse(300, 300, 500, 500);
  ellipse(200, 200, 180, 100);
  ellipse(400, 200, 180, 100);



  float leftXpos = constrain(map( mouseX, 0, 600, 150, 250), 150, 250);
  float leftYpos = constrain(map( mouseY, 0, 600, 180, 220), 180, 220);
  //outer eye
  fill(125, 60, 24);
  ellipse(leftXpos, leftYpos, 40, 40);
  //inner eye
  fill(0);
  ellipse(leftXpos, leftYpos, 20, 20);



   
  float rightXpos = constrain(map( mouseX, 0, 600, 350, 450), 350, 450);
  float rightYpos = constrain(map( mouseY, 0, 600, 180, 220), 180, 220);
  
  fill(125, 60, 24);
  ellipse(rightXpos, rightYpos, 40, 40);
  
  fill(0);
  ellipse(rightXpos, rightYpos, 20, 20);
  
  fill(255,0,0);
    arc(300, 400, 200, 200, 0, PI+QUARTER_PI, OPEN);
    
    
  if (mousePressed) {
    background(0);
  }
  
}
    


