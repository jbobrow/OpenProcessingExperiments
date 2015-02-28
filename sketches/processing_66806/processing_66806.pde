
//variable

PFont eventName;
String title = "London 2012 Olympics";
float angle = 0.0; 
float speed = 0.05; 
float radius = 48.0; 
float sx = 100.0;
float sy = 100.0;


//setup
void setup() {
  size (600, 450);
  eventName = loadFont ("Consolas-48.vlw");
  noStroke();
  smooth(); 

}



//draw
void draw() {
  fill(255, 255, 255, 4 );
  rect(0, 0, width *2, height *2 );
  angle += speed; 
  float sinval = sin(angle);
  float cosval = cos(angle);
  float x1 = 200 + (cosval * radius);
  float y1 = 200 + (sinval * radius);
  fill(0);
  ellipse(x1 + 105, y1, 10, 10);
    fill(255,0,0);
  ellipse(x1 + 210, y1, 10, 10);
    fill(0,255,0);
  ellipse(x1 + 155, y1 + 50, 10, 10);
    fill(255,255,0);
  ellipse(x1 + 55, y1 + 50, 10, 10);
    fill(0,128,255);
  ellipse(x1, y1, 10, 10); 
   text(title, 100, 250);
 

}


// edit by Shenhang Wang

