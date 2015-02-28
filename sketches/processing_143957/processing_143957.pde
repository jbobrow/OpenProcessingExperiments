
// hw 2/25/14
// arrays
// hw 2/27/14
// timer, collision detection
// hw 3/4/14
// image
// hw 3/6/14
// typography

PFont myFont;
float loc;
PImage bg;
ArrayList<Float> timesCollided = new ArrayList<Float>();

void setup() {
  bg = loadImage("geometry.png");
  background(255);
  image(bg, 0, 0);
  size(400, 400);
  myFont = createFont("Courier New", 32);
  textFont(myFont);
  textAlign(CENTER, CENTER);
}

void draw() {
  background(255);
  image(bg, 0, 0);
  if ( loc < height ) { loc = 10+millis()/100; }
  if ( loc >= height ) { loc = height-millis()/100; }
  noStroke();
  fill(0);
  //collision btwn text and wall
  if(loc > mouseY - 30 && loc < mouseY + 30 ) { 
    timesCollided.add(loc);
    loc = mouseY; 
  }
  fill(0);
  rect(0,0,400,loc);
  text(60 - second(), mouseX,mouseY);
  for ( int i = 0; i < timesCollided.size(); i++ ) {
     fill(random(0,255),random(0,255),random(0,255));
    text(timesCollided.get(i),0+i,300+random(random(-300,300),random(-300,300)));
  }
}



