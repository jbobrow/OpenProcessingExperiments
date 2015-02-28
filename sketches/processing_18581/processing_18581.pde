
void setup() {
  size(250, 250);
  background(255);
  smooth();
}

void draw() { 
  stroke(101,209,214,random(255)); //colour of random opacity
  noFill();
  strokeWeight(1);
  for(int l=0; l<=height; l+=100) { 
  bezier(0, 0, random (l), random (l), random (l), random (l), 250, 250);
  //beziers starts at top left corner + ends at bottom right corner
  //beziers made of random coordinates determined by "l"
}
 
  stroke(255); //white beziers
  noFill();
  strokeWeight(1);
  for(int l=0; l<=height; l+=100) {
  bezier(0, 0, random (l), random (l), random (l), random (l), 250, 250);
   //beziers starts at top left corner + ends at bottom right corner
  //beziers made of random coordinates determined by "l"
}
}

