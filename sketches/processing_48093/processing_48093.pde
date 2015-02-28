
float x = 200;
float y = 200;

void setup() {
  size(400, 400);
  //smooth the line
  smooth();
}

void draw() {
  background(255);
  ellipseMode(CENTER);
  stroke(22, 200, 200);
  strokeWeight(5);
  rectMode(CENTER);

  //body and head
  fill(22, 200, 200);
  rect(x, y, 40, 150);

  fill(255);
  ellipse(x, y-100, 80, 80);
  line(x+20, y+75, x+50, y+150);
  line(x-20, y+75, x-50, y+150);
  line(x+20, y-20, x+100, y-50);
  line(x-20, y-20, x-100, y-50);

  //feet
  line(x+50, y+150, x+60, y+140);
  line(x-50, y+150, x-60, y+140);

  //eyes and mouth
  strokeWeight(2);
  stroke(0);
  
  fill (random (255), random (255), random (255));
  ellipse(x+20, y-100, 20, 20);
  
  fill (random (255), random (255), random (255));
  ellipse(x-20, y-100, 20, 20);
  
  stroke(255, 0, 100);
  line(x-20, y-77, x+20, y-77);
  
  //this means that Y equals Y minus 3 (so my dude flies upwards)
 //y = y-3;
}







