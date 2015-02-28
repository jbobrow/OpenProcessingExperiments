
//code edited and borrowed from Nick Senske's example code for a spirograph-like effect

void setup() {
  size(600, 600);
  background(0);
}

//set counters to track rotation
int j = 1; //primary rotation
int g = 1; //rotation at the radius

void draw() {
  noFill();
  pushMatrix();
  translate(width/2, height/2);  //move the origin to the center
  rotate(radians(g));          //rotate from the center, convert degrees to radians
  translate(150, 0);             //set the radius
  rotate(radians(j + 75));     //rotate the ellipse about the next axis

  stroke(255, 75);
  strokeWeight(2);
  line(j, g, 5, 5);

  smooth();
  stroke(255, 0, 0, 25);
  for (int countX=0;countX<width;countX++) {
    for (int circleSize=50;circleSize>=10;circleSize-=5) {
      ellipse(25+(countX*50), height/2, circleSize, circleSize);
    }
  }


  popMatrix();

  //increment the rotation
  j+=50;
  g++;
}


