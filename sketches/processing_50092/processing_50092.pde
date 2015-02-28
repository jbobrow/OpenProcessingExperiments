

/*
Rainbow Sandbox
by Anna Lotko
1/26/12
CTIN 544
*/

float distance;
float x = 0.0;
float y = 0.0;
float easing = 0.05;

void setup() {
  size(600, 600);
  smooth();
  
}

void draw() {
  noStroke();
  //low alpha value enables the doughnut to fade slowely 
  fill(0, 10);
  rect(0,0, 600,600);
  
  //easing
  float targetX = mouseX;
  float targetY = mouseY;
  
  x+= (targetX -x) * easing;
  y+= (targetY -y) * easing;
  
  
  translate(x, y);
  
  for(int i = -600; i<width; i+=10) {
    for(int j= -600; j<height; j+=10) {
      
      distance = dist(x,y, i, j);
      
        //the location of ellipses is determined by the distance between the mouse and the i&j values
        //the size of the elippses is 0-15 width and 0-15 height
        noStroke();
        ellipse(i, j, random(15), random(15));
    
   if(distance <=100 && distance >=50) {
        //for(int d = 5; d<50; d++) {
        //the color of each ellipses is random and reset for the next elipses drawn/frame
        fill(random(255),random(255),random(255));
       //}
      }
      
      else {
      noFill();
      
      }
    }
  }
}

