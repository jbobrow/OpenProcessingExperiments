
void setup()
{
  size(600, 600);
  noLoop();
  background(215);
  smooth();
}

void draw()
{
  
  
    fill(26,153,0);
  smooth();
  noStroke();
tractorBeam(150,150);
  tractorBeam(60,220);
  tractorBeam(80,290);
  tractorBeam(10,350);
  
  // rows and columns of rooftops
  for (int x=5;x<width;x+=60) {
    for (int y=5;y<width;y+=60) {
      rooftop(x, y, 50, random(255));
    }
  }
  
// Aliens Attack Text
fill(255);
stroke(0);
  PFont font;
  font = loadFont("Gungsuh-48.vlw");
  textFont(font);
  String d = "Aliens Attack!";
  textSize(60);
  text(d,60, 100);
  
  // beam circles 
}

void tractorBeam(int c,int d) {
  for (int t= c; t <360;t++) {
    float x = (d+random(10)) * cos(radians(t));
    float y = (d+random(10)) * sin(radians(t));
    ellipse(width/2+x, height/2+y, 10, 10);
  }
}

//rooftop colours
void rooftop(float x, float y, float a, float b) {
  stroke(random(255));
  strokeWeight(3);
  colorMode(HSB, 255);
  fill(b, 220, 220, 100);
  rect(x, y, a, a);


  // spaceship
  stroke(0);
  strokeWeight(1);
  fill(150);
  ellipse(width/2, height/2, 250, 250);
  ellipse(width/2, height/2, 150, 90);
  fill(50);
  ellipse(width/2, height/2, 70, 40);  
  ellipse(width/2, 220, 10, 10);
  ellipse(width/2, 380, 10, 10);
  ellipse(200, height/2, 10, 10);
  ellipse(400, height/2, 10, 10);
  ellipse(365, 240, 10, 10);
  ellipse(365, 360, 10, 10);
  ellipse(235, 240, 10, 10);
  ellipse(235, 360, 10, 10);
  fill(150);
  stroke(0);
  strokeWeight(1);
  ellipse(285, 300, 10, 10);
  ellipse(315, 300, 10, 10);
}


