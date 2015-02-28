

  
void setup() {
  size(640, 520);
  noStroke();
  smooth();
}
 
void draw() {
  background(139,95,101);
  
  //ear outline
  fill(139,131,134);
  ellipse(160, 235, 80, 80); //l. ear outline
  ellipse(480, 235, 80, 80); //r. ear outline
  //face outline
  fill(139,131,134);
  ellipseMode(CORNER);
  ellipse(165,95,310,345); 
  //ears
  ellipseMode(CENTER);
  fill(205,205,193);
  ellipse(165, 235, 70, 70); //l. ear
  ellipse(475, 235, 70, 70); //r. ear 
  //face
  fill(205,205,193);
  ellipseMode(CORNER);
  ellipse(170,100,300,330);
  //tired
  noFill();
  stroke(238,213,210,60);
  strokeWeight(7);
  strokeJoin(ROUND);
  ellipseMode(CENTER);
  ellipse(240, 230, 85, 95); //left eye
  ellipse(400, 230, 85, 95); //right eye
  //tired1
  stroke(139,137,137,40);
  strokeWeight(5);
  ellipse(240, 230, 85, 95); //left eye
  ellipse(400, 230, 85, 95); //right eye
  //tired2
  stroke(139,137,137,70);
  ellipse(240, 230, 85, 85); //left eye
  ellipse(400, 230, 85, 85); //right eye
  //eyes1
  noStroke();
  fill(205,205,180);
  ellipse(240, 225, 90, 90); //left eye
  ellipse(400, 225, 90, 90); //right eye
  //eyes2
  fill(238,238,224);
  ellipse(240, 225, 80, 80); //left eye
  ellipse(400, 225, 80, 80); //right eye
  //eyes3
  fill(162,205,90,70);
  ellipse(240, 225, 80, 55); //left eye
  ellipse(400, 225, 80, 60); //right eye
  //nose
  stroke(205,201,165);
  strokeWeight(5);
  noFill();
  strokeJoin(ROUND);
  rect(300,200,40,120);


  //makes the pupils move to follow the mouse
  noStroke();
  smooth();
  fill(139,139,122);
  float pupilX = map(mouseX, 0, width, 215, 265);
  float pupilY = map(mouseY, 0, height, 205, 240);
  float pupilA = map(mouseX, 0, width, 375, 425);
  fill(205,85,85,40);
  ellipse(pupilX, pupilY, 30, 30); //left pupil
  ellipse(pupilA, pupilY, 30, 30); //right pupil
  fill(205,85,85,70);
  ellipse(pupilX, pupilY, 25, 25); //left pupil
  ellipse(pupilA, pupilY, 25, 25); //right pupil
  fill(139,139,122);
  ellipse(pupilX, pupilY, 20, 20); //left pupil2
  ellipse(pupilA, pupilY, 20, 20); //right pupil2
  
  }

