
int hours;
int minutes;
int seconds;

void setup() {
  size(600, 600);
  background(0);
  strokeCap(ROUND);
  smooth();

}

void draw() {
  
 hours = hour();
 minutes = minute();
 seconds = second();

 println(hours + " " + minutes + " " + seconds);

  if(hours > 12) {
      hours -= 12;
  }

 if(hours < 7) {
    fill(255);
    background(0);
    noStroke();
    ellipse(300, 20, 10, 10);
    ellipse(580, 300, 10, 10);
    ellipse(300, 580, 10, 10);
    ellipse(20, 300, 10, 10);
 } else if(hours > 20) {
    fill(255);
    background(0);
    noStroke();
    ellipse(300, 20, 10, 10);
    ellipse(580, 300, 10, 10);
    ellipse(300, 580, 10, 10);
    ellipse(20, 300, 10, 10);
 } else {
    fill(247, 247, 25);
    background(67, 177, 247); 
    noStroke();  
    ellipse(300, 20, 10, 10);
    ellipse(580, 300, 10, 10);
    ellipse(300, 580, 10, 10);
    ellipse(20, 300, 10, 10);
 }

 noStroke();
 rect(200, 200, 200, 200);

  translate(300, 300);
  rotate(radians(90));
  noFill();

 //hour
 strokeWeight(5);
 stroke(18, 48, 67);
 pushMatrix();
 rotate(radians(30 * hours));
 line(0, 0, -100, 0);
 popMatrix();

 //minute
 strokeWeight(3);
 stroke(69, 124, 160);
 pushMatrix();
 rotate(radians(6 * minutes));
 line(0, 0, -160, 0);
 popMatrix();

 //second
 strokeWeight(1);
 stroke(108, 198, 198);
 pushMatrix();
 rotate(radians(6 * seconds));
 line(0, 0, -240, 0);
 popMatrix();

}

