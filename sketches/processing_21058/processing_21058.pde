
int hours;
int minutes;
int seconds;
int xpos = 0;

void setup() {
  size(600, 300);
  colorMode(HSB, 100);
  background(60,30,90);
  noStroke();
  smooth();
}

void draw() {
  background(60,30,90);

   // get system variables
 hours = hour();
 minutes = minute();
 seconds = second();
 
 println(hours + " " + minutes + " " + seconds);
 
    // center sketch
  translate(50,50);
  noFill();
  
    // hour hand
  fill(80, 50, 50);
  pushMatrix();
  rect(xpos,50,12.5*hours,30); //
  popMatrix();
  
    // minute hand
  fill(60, 50, 50);
  pushMatrix();
  rect(xpos,100,5*minutes,30); // 300
  popMatrix();
  
    // second hand
  fill(40, 50, 50);
  pushMatrix();
  rect(xpos,150,5*seconds,30); // 300
  popMatrix();

}

