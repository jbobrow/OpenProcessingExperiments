
void setup() {
  size(400, 400);
  background(0);
  frameRate(1);
  
  smooth();  
  strokeWeight(.25);
  stroke(60);
  line(0, 0, width, height);  
  line(0, height, width, 0);
  //verticals
  stroke(60);
  line(width/8, height, width/8, 0);  
  line(width/4, height, width/4, 0);  
  line(3*width/8, height, 3*width/8, 0);
  line(width/2, height, width/2, 0);
  line(5*width/8, height, 5*width/8, 0);
  line(6*width/8, height, 6*width/8, 0);
  line(7*width/8, height, 7*width/8, 0);
  //medium verticals
  stroke(40);
  line(width/8+10, height, width/8+10, 0);
  line(width/4-10, height, width/4-10, 0);
  line(3*width/8-10, height, 3*width/8-10, 0);
  line(5*width/8+10, height, 5*width/8+10, 0);
  line(6*width/8+10, height, 6*width/8+10, 0);
  line(7*width/8-10, height, 7*width/8-10, 0);
  //horizontals
  stroke(60);
  line(0, height/8, width, height/8);
  line(0, height/2, width, height/2);
  line(0, height/4, width, height/4);
  line(0, 3*height/8, width, 3*height/8);
  line(0, 5*height/8, width, 5*height/8);
  line(0, 6*height/8, width, 6*height/8);
  line(0, 7*height/8, width, 7*height/8);
  //medium horizontals
  stroke(40);
  line(0, 6*height/8+10, width, 6*height/8+10);
  line(0, 7*height/8-10, width, 7*height/8-10);
  line(0, 5*height/8+10, width, 5*height/8+10);
  line(0, 3*height/8-10, width, 3*height/8-10);
  line(0, height/4-10, width, height/4-10);
  line(0, height/8+10, width, height/8+10);
}
int numR = 15;//number of rectagles to draw
float ptY = random(100, 300);//y variable for point

void draw() {  
  //draw a random sized rectangle when clicked
  if (numR > 0) {
    noStroke();
    rectMode(CENTER);
    //make fill yellow w/ random transparency
    fill(255, 255, 0, random (50, 200));
    //random size and center point
    rect(random(width), random(height), random (0, 200), random (0, 200));
    //every fifth rectangle draw a line, else a point along an X.
    if (numR % 5==0) { 
      stroke(255);
      fill(255);
      strokeWeight(random(.5, 5));
      line(random(width), 0, random(height), height);
    }
    else {
      stroke(255);
      strokeWeight(7);
      point(random(width), ptY);
    }
  }
  numR--;
}


