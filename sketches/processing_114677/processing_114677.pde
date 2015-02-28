
void setup(){
  background(0);
  size(800,600);
}


void drawSun(){
  translate (400,300);
  noStroke();
  fill(255, 255, 0);
  ellipse (0,0, 30, 30);
  rotate(radians(millis()/20));
}

void drawEarth(){
  translate (150,150);
  noStroke();
  fill(50,100,100);
  ellipse(0,0,25,25);
  rotate(radians(millis ()/15));
}

void drawMoon(){
  translate(50,50);
  noStroke();
  fill(0,0,225);
  ellipse(0,0,15,15);
  rotate(radians(millis ()/5));
}

void drawSatellite(){
  translate(20,20);
  noStroke();
  fill(200,50,50);
  ellipse(0,0,8,8);
  rotate(radians(millis ()/1));
}

void draw(){
  background (0);
  drawSun();
  drawEarth();
  drawMoon(); 
  drawSatellite();
}
