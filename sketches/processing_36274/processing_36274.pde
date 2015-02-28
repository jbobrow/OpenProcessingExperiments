
//Click to make the flower grow(or not) in the different weather climates.

void setup() {
  size(300, 300);
}

int rain=2;
int flower=1;
int sun=15;

void draw() {
  //leftside setup
  background(54, 218, 232);
  noStroke();
  smooth();
  fill(0, 200, 0);
  rect(0, 250, width/2, height);
  strokeWeight(5);
  stroke(22, 163, 10);
  ellipse(78, 250, 50, 10);
  line(75, 250, 75, 215);

  noStroke();
  fill(234,28,225);
  ellipse(95, 200, 45, 45);
  ellipse(80, 215, 45, 45);
  ellipse(80, 185, 45, 45);
  ellipse(60, 200, 45, 45);

  fill(255, 244, 31);
  ellipse(75, 200, 30, 30);

  //toggle between weather_left/right sides
  if (mouseX<width/2) {
    //rain clouds_left side
    fill(184); 
    ellipse(20, 45, 76, 22);
    ellipse(25, 20, 76, 45);
    ellipse(112, 20, 76, 45);
    fill(80, 80);
    ellipse(80, 50, 70, 45);
  }
  else {
    //sun_right side
    fill(246, 255, 5);
    ellipse(275, 50, 60, 60);
  }


  //right side setup
  noStroke();
  smooth();
  fill(0, 200, 0);
  rect(width/2, 250, 300, 300);

  //stem
  strokeWeight(5);
  stroke(22, 163, 10);
  ellipse(228, 240, 50, 10);
  line(225, 250, 225, 215);

  //right side flower
  noStroke();
  fill(234,28,225);
  ellipse(245, 200, 45, 45);
  ellipse(230, 215, 45, 45);
  ellipse(230, 185, 45, 45);
  ellipse(210, 200, 45, 45);

  fill(255, 244, 31);
  ellipse(225, 200, 30, 30);


  if (mousePressed) {
    background(54, 218, 232);
    noStroke();
    smooth();
    fill(0, 200, 0);
    rect(0, 250, width/2, height);
    //growing flower_stem
    strokeWeight(5);
    stroke(22, 163, 10);
    ellipse(78, 250-flower, 50, 10);
    line(75, 250, 75, 215-flower);
    //growing flower_petals
    noStroke();
    fill(234,28,225);
    ellipse(95, 200-flower, 45, 45);
    ellipse(80, 215-flower, 45, 45);
    ellipse(80, 185-flower, 45, 45);
    ellipse(60, 200-flower, 45, 45);
    fill(255, 244, 31);
    ellipse(75, 200-flower, 30, 30);
    //rain clouds
    fill(184);
    ellipse(20, 45, 76, 22);
    ellipse(25, 20, 76, 45);
    ellipse(112, 20, 76, 45);
    fill(80, 80);
    ellipse(80, 50, 70, 45);
    
    //sun
    fill(246, 255-sun, 5);
    ellipse(275, 50, 60, 60);
    
    //wilting flower setup
    strokeWeight(5);
    stroke(22-sun, 163-sun, 10);
    fill(0, 200, 0);
    ellipse(228, 240, 50, 10);
    line(225, 250, 225, 215);
    noStroke();
    fill(215-sun, 150-sun, 10);
    ellipse(245, 200, 45, 45);
    ellipse(230, 215, 45, 45);
    ellipse(230, 185, 45, 45);
    ellipse(210, 200, 45, 45);
    fill(255-sun, 244-sun, 31);
    ellipse(225, 200, 30, 30);

    if (sun>=255) {
      sun=15;
    }


    //right side setup
    noStroke();
    smooth();
    fill(sun, 200, 0);
    rect(width/2, 250, 300, 300);
    //rain
    stroke(0, 0, 180, 80);
    strokeWeight(5);
    point(20, rain);
    point(45, rain+10);
    point(75, rain+20);
    point(50, rain+10);
    point(10, rain+20);
    point(140, rain);
    point(90, rain+40);

    if (rain>=height-50) {
      rain=2;
    }

    flower++;
    sun++;
    rain++;
  }

  if (flower>=height-50) {
    flower=1;
  }
}


