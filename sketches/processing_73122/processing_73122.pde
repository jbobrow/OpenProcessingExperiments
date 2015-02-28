
int hours;
int minutes;
int seconds;


void setup() {
  size(600, 600);
  colorMode(HSB, 100);
  background(0, 0,90);
  strokeCap(ROUND);
  smooth();
  frameRate(60);
}

void draw() {
   
   // get system variables
 hours = hour();
 minutes = minute();
 seconds = second();
 
 println(hours + " " + minutes + " " + seconds);
    
    // fix for 24 hour clock
  if(hours > 12) {
   hours -= 12; 
  }
 
   background(0, 0,90);
 

 
    // center sketch
 line(262, 167, 312, 167);
 line(286, 167, 286, 214);
 

 
 line(270, 307, 297, 307);
 line(270, 307, 270, 362);
 line(270, 362, 297, 362);

 line(268, 392, 268, 455);
 line(268, 423, 303, 392);
 line(268, 423, 303, 453);
  translate(280,413);
  rotate(radians(90));
  noFill();


  
    // second hand
  strokeWeight(3);
  stroke(40, 50, 50);
  pushMatrix();
  rotate(radians(6 * seconds));

  
  pushMatrix();
        rotate(.2);
   ellipse(150, 0, 30, 30);
        rotate(.2);
  ellipse(150, 0, 30, 0);
        rotate(.2);
    ellipse(150, 0, 30, 30);
        rotate(.2);
  ellipse(150, 0, 30, 0);
        rotate(.2);
    ellipse(150, 0, 30, 30);
        rotate(.2);
  ellipse(150, 0, 30, 0);
        rotate(.2);
    ellipse(150, 0, 30, 30);
        rotate(.2);
  ellipse(150, 0, 30, 0);
        rotate(.2);
    ellipse(150, 0, 30, 30);
        rotate(.2);
  ellipse(150, 0, 30, 0);
        rotate(.2);
    ellipse(150, 0, 30, 30);
        rotate(.2);
  ellipse(150, 0, 30, 0);
        rotate(.2);
    ellipse(150, 0, 30, 30);
        rotate(.2);
  ellipse(150, 0, 30, 0);
        rotate(.2);
    ellipse(150, 0, 30, 30);
        rotate(.2);
    ellipse(150, 0, 30, 0);
        rotate(.2);
  ellipse(150, 0, 30, 30);
        rotate(.2);
    ellipse(150, 0, 30, 0);
        rotate(.2);
  ellipse(150, 0, 30, 30);
        rotate(.2);
    ellipse(150, 0, 30, 0);
        rotate(.2);
  ellipse(150, 0, 30, 30);
        rotate(.2);
    ellipse(150, 0, 30, 0);
        rotate(.2);
  ellipse(150, 0, 30, 30);
        rotate(.2);
    ellipse(150, 0, 30, 0);
        rotate(.2);
  ellipse(150, 0, 30, 30);
        rotate(.2);
    ellipse(150, 0, 30, 0);
        rotate(.2);
  ellipse(150, 0, 30, 30);
        rotate(.2);
    ellipse(150, 0, 30, 0);
        rotate(.2);
  ellipse(150, 0, 30, 30);
        rotate(.2);
    ellipse(150, 0, 30, 0); 
        rotate(.2);
  ellipse(150, 0, 30, 30);  
  popMatrix();

  

  
  popMatrix();
  
}
