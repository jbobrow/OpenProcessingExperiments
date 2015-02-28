
color lightPink = color(255, 162, 201);
color lightBlue = color(182, 237, 237);
color orange = color(255, 166, 0);
color darkBlue = color(2, 9, 67);
 


void setup() {
  size(500, 500);
  
  smooth();
}

void draw() {
 if (hour() <= 5 && minute() <=59 && second() <= 59)//morning
  {
   background(lightPink);
  }
  else if (hour() <= 17 && minute() <= 59 && second() <= 59)//early afternoon
  {
   background(lightBlue);
  }
  else if (hour() <= 20 && minute() <= 59 && second() <= 59)//late afternoon
  {
   background(orange);
  }
  else //night
  {
   background(darkBlue);
  }
   
  noFill();
  stroke(150);
  ellipse( width/2, height/2, map(hour(), 0, 23, 0, width/2), map(hour(), 0, 23, 0, height/2));
  fill(50);
  noStroke();
  ellipse(width/2 + cos(map(second(), 0, 59, 0, TWO_PI)) * map(hour(), 0, 23, 0, height/2), height/2 + sin(map(second(), 0, 59, 0, TWO_PI)) * map(hour(), 0, 23, 0, width/2), 10, 10);
  fill(200);
  noStroke();
  ellipse(width/2 + cos(map(minute(), 0, 59, 0, TWO_PI)) * map(hour(), 0, 23, 0, height/2), height/2 + sin(map(minute(), 0, 59, 0, TWO_PI)) * map(hour(), 0, 23, 0, width/2), 10, 10);

}
