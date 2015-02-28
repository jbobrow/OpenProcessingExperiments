
int min, hour;
float min_delta, hour_delta;
void setup() {
 
  size (500, 700);
  background (255);
}
void draw() {
 
  fill(255);
  rect(0, 0, width, height);
 
  fill (0);
 
  if (mousePressed == true) {
    /* debug mode */
 
    min = mouseX % 60;
    hour = mouseY % 12;
    if (hour == 0)
      hour = 12;
    else
      hour= mouseY % 12;
  }
  else
  {
    min = minute();
    if (hour() % 12 == 0)
      hour = 12;
    else
      hour= hour() % 12;
  }
 
  if (min == 0)
    min_delta = height;
  else
    min_delta = height / (float)(min+1);
 
 
 
  if (hour == 0)
    hour_delta =  width;
  else
    hour_delta = width / (float)(hour+1);
 
  //  noStroke();
  //  rect( 0, min/2*min_delta, width / 60 * second(), min_delta );
 
 
  stroke(0);
  strokeWeight(sqrt(min_delta * hour_delta) / 20);
 
 
  for (int n = 0 ; n <= min ; n ++) {
 
    fill(255/(min+1)*(n+1), 100, 100, 250);
 
    rect(0, min_delta * n, width, min_delta);
  }
 
 
  stroke(0);
  for (int n = 0; n <= hour ; n++ ) {
 
    fill(130, 255/(hour+1)*n, 20, 80);
    rect(hour_delta*n, 0, hour_delta, height);
  }
 
  fill(0);
  rect( hour/2*hour_delta, min/2*min_delta, hour_delta / 60 * second(), min_delta );
 
 
  fill(0);
  textSize(min(min_delta, hour_delta) / 1.5);
  textAlign(LEFT);
 
  if (hour >= 2) {
    text(hour, width - hour_delta*3 + hour_delta / 4, height - min_delta);
    text(min, width - hour_delta*2 + hour_delta / 4, height - min_delta);
    text(second(), width - hour_delta*1 + hour_delta / 4, height - min_delta);
  }
  else if (hour < 2)
  {
    //textSize(100);
    textAlign(CENTER);
    text(hour, width - width / 5 * 4, height - min_delta);
    text(min, width - width / 5 * 3, height - min_delta);
    text(second(), width - width / 5 * 2, height - min_delta);
  }
}

