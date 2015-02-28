
PImage boom;
PFont gill;


void setup() {
  size(400, 400);
  boom=loadImage("boom.jpg");
  size(boom.width, boom.height);
  imageMode(CENTER);
  fill(255);
  gill=loadFont("GillSans-48.vlw");

  
}

void draw() {
 

background(0);
  
  if (mousePressed) {

    image(boom, width/2, height/2, height/2 , height/2);
    }
    textFont(gill);
    
    text("hi, I'm thinking about sleep.",100,100);
}  




