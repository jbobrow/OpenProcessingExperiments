
int dim;

void setup() {
  size(640, 400);
  dim = width/2;
  background(0);
  colorMode(HSB, 360, 100, 10);
  noStroke();
  ellipseMode(RADIUS);
  frameRate(1);
}

void draw() {
  background(0);
  for (int x = 0; x <= width; x+=dim) {
    drawGradient(x, height/2);
  } 
  int seconds = second();
  int minutes = minute();
  int hours = hour();
  int day = day();
  int month = month();
  int year = year();

    float secondRote = map(seconds,90, 59, 90, -360);    
  float minuteRot = map (minutes, 0, 59, 0, 360);
  float hourRot = map (hours, 0, 23, 0, 360*2);
  float monthRot = map (month, 0, 11, 0, 360);//orange
  float dayRot = map (day, 0, 30, 0, 360);//red
  float yearRot = map (year, 0, 2014, 0, 360);//black
  
  pushMatrix();
  stroke(0);
  fill(random(255),random(255), random(255));
  translate(width/2, height/2);
  rotate(radians(secondRote));
  arc(0, 0, 155, 155, 0, QUARTER_PI, PIE);
  
  popMatrix();
  //MINUTES
  pushMatrix();
  translate(width/2, height/2); //allows you to reset the starting point of the grid
  rotate(radians(minuteRot));
  stroke(0);
  strokeWeight(5);
  line(0, 10, 0, -90);
  popMatrix();

  //HOURS
  pushMatrix();
  translate(width/2, height/2); //allows you to reset the starting point of the grid
  rotate(radians(hourRot));
  stroke(0);
  strokeWeight(3);
  line(0, 10, 0, -65);
  popMatrix();
  
  //MONTH
 pushMatrix();
  translate(width/2, height/2); //allows you to reset the starting point of the grid
  rotate(radians(monthRot));
  stroke(2550);//orange
  strokeWeight(1);
  line(0, 10, 0, -160);
  popMatrix();
  
   textSize(15);
  fill(255);
  text("Time " + hours + ":" + minutes + ":" + seconds, 420, 377);
  textSize(15);
  text("Date: " + month + "/" + day + "/" + year,100, 377);
}


void drawGradient(float x, float y) {
  int radius = dim/2;
  float h = random(0, 360);
  for (int r = radius; r > 0; --r) {
    fill(h, 90, 90);
    ellipse(x, y, r, r);
    h = (h + 1) % 360;
  }
}


