
PFont font;
color col1, col2, col3;

void setup() {
  size(300,300);
  background(100);
  font = createFont("Arial-BoldMT", 48);

 int baseAngle=200;
 col3 = color((baseAngle+240)%360, 30, 80); // tryadic color composition

}

void draw(){
 background(100);

  updateSecond();
  updateMinute();
  updateHour();
 
}

void updateSecond(){
  float sAngle = map(second(), 0, 60, 0, 2*PI);
  noStroke();
  fill(59,134,134);
  ellipse(150+(120*cos(sAngle-PI/2)), 150+(120*sin(sAngle-PI/2)),20,20);
}

void updateMinute(){
  fill(col3);
  float sAngle = map(minute(), 0, 60, 0, 2*PI);
  arc(150,150,200,200, -PI/2, sAngle-PI/2 );

}

void updateHour(){
    textSize(150);
  fill(color(255,30,40));
  textAlign(CENTER,CENTER);
  text(hour(), 140, 130);
}


