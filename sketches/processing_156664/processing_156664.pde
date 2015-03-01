
/*
Day02_homework01_By_StephanieMcNiel
*/
void setup(){
  size(800, 600);
  frameRate(30);
}

void draw(){
  background(255);
  println(frameCount);

  fill(158, 245, 234);
  noStroke();
  triangle(250, 60, 550, 100, 340, 350);
  
  fill(0);
  triangle(310, 345, 338, 290, 366, 345);
  
//Draw the puppy nose  
  fill(0);
  triangle(310, 345, 338, 290, 366, 345);
  
  fill(0);
  noStroke();
  triangle(230, 75, 278, 20, 306, 75);

  //Draw the puppy right ear
  fill(0);
  noStroke();
  triangle(530, 175, 535, 80, 470, 75);

   //Draw the puppy eyes
  stroke(255);
  strokeWeight(30);
  point(325, 150);
  point(415, 170);
  stroke(0);
  strokeWeight(20);
  point(325, 150);
  point(415, 170);

  //Draw the puppy body
  fill(158, 245, 234);
  noStroke();
  ellipse(490, 280, 250, 140);

  //Draw the puppy legs
  stroke(158, 245, 234);
  strokeWeight(20);
  line(500, 300, 500, 420);
}

//Puppy blinks
void keyPressed() {
  stroke(255);
  strokeWeight(30);
  point(325, 150);
  point(415, 170);
  stroke(0);
  strokeWeight(3);
  line(322, 148, 328,152);
  line(412, 168,418,172);
}






