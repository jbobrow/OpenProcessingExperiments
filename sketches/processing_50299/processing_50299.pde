

/*
XXXX
by Anna Lotko
1/26/12
CTIN 544
*/

float x = 0.0;
float y = 0.0;
float distanceX = 0.0;
float distanceY = 0.0;
int i = 0;
int j = 0;
float easing = .05;

void setup() {
  size(1200, 600);
  smooth();
}

void draw() {
  //the low alpha value fades the spiral slowly
  fill(255, 10);
  rect(0,0, 1200,600);
  
  //changes the amount of easing slightly
  for (float e = 0.0; e <.08; e += .001) {
    easing = e;
  }
  
  //easing
  float targetX = mouseX;
  float targetY = mouseY;
  
  x+= (targetX - x) * easing;
  y+= (targetY - y) * easing;
  
  //nested for loop
  for (i=2; i<width; i+= 15) {
    for (j=2; j<height; j+=15) {
      
      //when the mouse is pressed, the x,y value of pattern area is determined by the mouse
      if (mousePressed == true) {
        distanceX = dist(pmouseX, pmouseY, i,j);
        distanceY = dist(pmouseX, pmouseY, i,j);
        //the R/B values of the stroke color change, depending on mouse location
        stroke((pmouseX-mouseX)*20, (pmouseY-mouseY)*20, 100, 40);
        strokeWeight(10);
        //the pattern is generated using the distance between the mouse and variables i & j
        line(i+distanceX,j+distanceY, i+distanceX+(random(60)),j+distanceY+(random(60)));
        line(i+distanceX,j+distanceY+(random(60)), i+distanceX+(random(60)),j+distanceY);
      }
      //full screen pattern when the mouse is not pressed
      else {
        line(i,j, i+(random(60)),j+(random(60)));
        line(i,j+(random(60)), i+(random(60)),j);
      }
    }
  }
}

  

