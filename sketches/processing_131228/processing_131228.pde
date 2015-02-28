
//code adapted from Jonathan Beeby

PImage facebook;
PImage gmail;
PImage nyt;
PImage youtube;


void setup() {
  background(255);
  size(500, 500);
  smooth();
  facebook = loadImage("facebook.png");
  gmail = loadImage("gmail.png");
  nyt = loadImage("nyt.png");
  youtube = loadImage("youtube.png");
}
 
void draw() {
  pushMatrix(); // start clock face context
  translate(height/2, width/2); // move to centre
  stroke(0); // line colour
  strokeWeight(3); // line weight
  fill(255); // fill colour
  ellipse(0, 0, 400, 400); // shape of clock face
 
  pushMatrix(); // start tick marks context
  for (int i=0; i<60;i++) {
    if (i%15==0) largeTick(); // every 5 i's follow "largeTick" instructions
    rotate(radians(6)); // rotate by 6 radians?
  }
  popMatrix(); // end tick marks context
 
  pushMatrix(); // start secondHand context
  rotate(radians(6*second()-90));
  secondHand();
  popMatrix(); // end secondHand context
 
  pushMatrix(); // start minuteHand context
  rotate(radians(6*(minute()+second()/60.0)-90));
  minuteHand();
  popMatrix(); // end minuteHand context
 
  pushMatrix(); // start hourHand context
  rotate(radians(30*(hour()+minute()/60.0)-90));
  hourHand();
  popMatrix(); // end hourHand context
 
  // center button
  fill(0);
  noStroke();
  ellipse(0, 0, 15, 15);
 
  popMatrix(); // end clock face content
  
  image(facebook, 223, 60);
  image(gmail, 395, 223);
  image(nyt, 223, 390);
  image(youtube, 50, 223);

}

void largeTick() {
//  strokeWeight(2); // tick weight
//  line(100, 0, 200, 0); // tick length
}
 
void secondHand() {
  strokeWeight(1); // hand weight
  strokeCap(SQUARE);
  line(0, 0, 175, 0); // hand length

}
 
void minuteHand() {
  strokeWeight(3); // hand weight
  strokeCap(SQUARE);
  line(-40, 0, 160, 0); // hand length
}
 
void hourHand() {
  strokeWeight(8); // hand weight
  strokeCap(SQUARE);
  line(-30, 0, 100, 0); // hand length
}



