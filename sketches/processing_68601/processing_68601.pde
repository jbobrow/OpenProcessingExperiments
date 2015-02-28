
int seconds;
int minutes;
int hours;

PImage clock;


void setup() {

  size(600, 600);
  frameRate(12);
  noStroke();
  smooth();
  clock = loadImage("clock.png");
  
}

void draw() {
  image(clock, 0, 0);

  seconds = second();
  minutes = minute(); 
  hours = hour();

  //Hour hand---------------------------->>
  pushMatrix(); //Start of second transformation matrix which controls the hour rotation.
  translate(width/2, height/2);

  rotate(hours * PI/30);
  translate(60, 0);
  fill(21, 163, 227);

  rect(0, 0, 120, 15);
  popMatrix(); 
  
   //Minute hand--------------------------->>
  pushMatrix(); //Start of second transformation matrix which controls the hour rotation.
  translate(width/2, height/2);

  rotate(minutes * PI/30); //Again, adjusts rotation direct & speed.
  translate(90, 0);
  fill(0, 158, 165);

  rect(0, 0, 180, 10);
  popMatrix(); //End of second transformation matrix.
  
  //Second hand--------------------------->>
  pushMatrix(); 

  translate(width/2, height/2);
  rotate(seconds * PI/30 ); //makes the pointer rotate
  translate(125, 0); //sets the distance of pointer1
  fill(0, 70, 275);
  rectMode(CENTER);
  rect(0, 0, 250, 5);

  popMatrix(); //End of first transformation matrix.

  pushMatrix();

  translate(width/2, height/2);
  fill(0);
  ellipseMode(CENTER);
  ellipse(0, 0, 30, 30);
  

  popMatrix();
}


