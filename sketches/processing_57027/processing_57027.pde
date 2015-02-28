
void setup() {
  size (400, 400);
  //how fast DRAW runs through the code
  frameRate(6);
  noStroke();
  smooth();
}
void draw (){
  ellipse(random(300), random(400),75,75);
  rect(random(50), random(30), 25,40);
  fill (random(46), random (20), random (15), 2);
  //random number between zero and the chosen number
  
}

