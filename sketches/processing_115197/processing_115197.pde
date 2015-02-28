
float angle;
float jitter;
String message = "do the jitter bug!";

void setup() {
  size(640, 360);
   textFont(createFont("LiSong", 24));
  textAlign(CENTER, CENTER);
}

void draw() {
  background(51);

  // during even-numbered seconds (0, 2, 4, 6...)
  if (second() % 2 == 0) {  
    jitter = random(-0.1, 0.1);
  }
  angle = angle + jitter;
  float c = cos(mouseX);
  translate(width/2, height/2);
  rotate(c);
  text(message,50, 30);   
}


