
float x;
float y;
float speed = 2.5;

PFont eventName;
String title = "London 2012";

void setup() {
  size(640, 480);
  eventName = loadFont("eventName.vlw");
  textFont (eventName);
}



void draw() {

  background(#97D2F4);

  smooth();
  noFill();
  strokeWeight(4);
  stroke(255);
  arc(185, 155, 40, 40, 0, TWO_PI);
  arc(235, 155, 40, 40, 0, TWO_PI);
  arc(285, 155, 40, 40, 0, TWO_PI);
  arc(210, 173, 40, 40, 0, TWO_PI);
  arc(260, 173, 40, 40, 0, TWO_PI);

  text(title, 100, 250);

  frameRate(6);
  noFill();

  // color lines  
  stroke(random(255), random(255), random(255), random(255));
  strokeWeight(10);


  bezier(
  0, height/2, 
  width/2, random(0, height), 
  random(width), random(height), 
  width, height/2
    );



  stroke(255);
  strokeWeight(5);


  bezier(
  0, height/2, 
  width/2, random(0, height), 
  random(width), random(height), 
  width, height/2
    );
}


void mousePressed() {
  noLoop();
}

void mouseReleased() {
  loop();
}



