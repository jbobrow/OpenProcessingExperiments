
//Jessica Yang
//Feb 24 2013
//moving circles
float circleX = 250;
float circleXspeed = 4;
float circleY = 250;
float circleYspeed = 3;
float circleJ = 500;
float circleJspeed = 3;

void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  noStroke();
  circleX = circleX + circleXspeed;
  circleY = circleY + circleYspeed;

  fill(200, 200, 224, 25);
  
 if (circleY> 300) {
    circleYspeed = -3;
  }
  if (circleY<0) {
    circleYspeed=3;
  }
 if (mousePressed==true) {
   fill(200, 224, 200,25);
           
    }
  
  ellipse(250, 250, circleY, circleY);
  ellipse(250, 250, circleY+30, circleY+30);
  ellipse(250, 250, circleY-30, circleY-30);


  if (circleX> width) {
    circleXspeed = -4;
  }
  if (circleX<0) {
    circleXspeed=4;
  }
  
    fill(1, random(255), random(255), 40);
  ellipse(circleX, 100, 50, 50);
  ellipse(circleX, 150, 40, 40);
  ellipse(circleX, 200, 30, 30);
  ellipse(circleX, 250, 20, 20);
  ellipse(circleX, 300, 30, 30);
  ellipse(circleX, 350, 40, 40);
  ellipse(circleX, 400, 50, 50);

ellipse (100, circleX,50, 50);
 ellipse( 150,circleX, 40, 40);
  ellipse( 200,circleX, 30, 30);
  ellipse( 250,circleX, 20, 20);
  ellipse( 300,circleX, 30, 30);
  ellipse( 350,circleX, 40, 40);
  ellipse( 400, circleX,50, 50);
 
}
