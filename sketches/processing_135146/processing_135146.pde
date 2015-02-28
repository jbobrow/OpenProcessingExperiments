

void setup() {
 size(800, 400);
  background(0);
  smooth();
  
 
}


void draw() {
  noStroke();
  fill(255);

  float c = map(mouseX, 0, width, 0, 255);
  background(#F5E5FC); //c,c,c
  
  //righteyeball
  float righteye = map(-200, mouseY, width, 0, -135 );
  ellipse(600, 200, 280, righteye);
  
  //rightpupil
  fill(#91DECE);
  float rightpupil = map(mouseX, 0, width, 550, 650);
  ellipse(rightpupil, 200, 90, 90);
  
  //rightiris
  fill(#73D3BF);
  float rightiris = map(mouseX, 0, width, 550, 650);
  ellipse(rightiris, 200, 75, 75);
  //righteyelid
  stroke(#F5E5FC);
  strokeWeight(100);
  noFill();
  float righteyelid = map(-200, mouseY, width, 0, -135 );
  ellipse(600, 200, 280, righteyelid);
  
  stroke(#F5E5FC);
  
  noStroke(); 
  
  fill(255);
  //lefteyeball
  float lefteye = map(-150, mouseY, width, 0, -135 );
  ellipse(200, 200, 280, lefteye);
  
  //leftpupil
  fill(#91DECE);
  float leftpupil = map(mouseX, 0, width, 150, 250);
  ellipse(leftpupil, 200, 90, 90);
  
  //leftiris
  fill(#73D3BF);
  float leftiris = map(mouseX, 0, width, 150, 250);
  ellipse(leftiris, 200, 75, 75);
  
  //lefteyelid
  stroke(#F5E5FC);
  strokeWeight(100);
  noFill();
  float lefteyelid = map(-200, mouseY, width, 0, -135 );
  ellipse(200, 200, 280, lefteyelid);
  
  

}
 

