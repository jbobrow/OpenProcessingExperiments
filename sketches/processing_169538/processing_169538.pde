
// The code for an handless analog clock that runs off of your computer system's time

float secondRotation;  
float minuteRotation;
float hourRotation;


void setup () {
  
  size(400,400); 

}


void draw () {

  background(0);
  
  secondRotation = map(second(), 0, 60, 0, 360);
  minuteRotation = map(minute(), 0, 60, 0, 360);
  hourRotation = map(hour(), 0, 24, 0, 720);
  //Defines the rotation paths for the invisible hands of the clock. Mapped in degrees; could also use Pi

  noFill();
  strokeWeight(15);  
  stroke(#FFBD24);
  ellipse(width/2, height/2, 120, 120); //Draws seconds arc
  stroke(#FF248A);
  ellipse(width/2, height/2, 240, 240); //Draws minutes arc
  stroke(#24FF3E);
  ellipse(width/2, height/2, 360, 360); //Draws hours arc
  
  pushMatrix();                   
    translate(width/2, height/2); //Translates the line to the center point of the clock
    rotate(radians(secondRotation)); //Rotates the line along the called upon rotation path
    strokeWeight(20);
    stroke(0);                    //Makes the line the same color as the background
    line(0, 0, 0, -200);          //Draws the invisible line to go slightly past the second hand arch of the clock, creating the effect of a "handless clock"
  popMatrix();
  
  pushMatrix();
    translate(width/2, height/2);
    rotate(radians(minuteRotation));
    line(0, 0, 0, -140);          //Draws the invisible line to go slightly past the minute hand arch
  popMatrix();
  
  pushMatrix();
    translate(width/2, height/2);
    rotate(radians(hourRotation));
    line(0, 0, 0, -70);          //Draws the invisible line to go slightly past the hour hand arch
  popMatrix();

}

  


