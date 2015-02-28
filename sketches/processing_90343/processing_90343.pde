
float angle;
float jitter;

void setup(){
  size(800,750);
PImage webImg;

{
  String url = "http://water-library.com/wp-content/uploads/2012/01/Water-80221521.jpg";
  // Load image from a web server
  webImg = loadImage(url, "jpg");
}

{
  background(0);
  image(webImg, 0, 0);
}
}
void draw(){
  
  strokeWeight(10.0);
  stroke(color(255,0,0));
  translate (250,250);
  for (int i=0; i<5; i++) {
    rotate(TWO_PI / 5);
    line (0,0,30,0);

  }

  strokeWeight(0);
  fill(color(48,139,206));
  ellipse(0,0,15,15);
  
  
  strokeWeight(5.0);
  stroke(color(200,0,0));
  translate (100,100);
  for (int i=0; i<10; i++) {
    rotate(TWO_PI / 10);
    line (0,0,30,0);

  }

  strokeWeight(0);
  fill(color(132,215,0));
  ellipse(0,0,15,15);
  
    strokeWeight(5.0);
  stroke(color(60,0,200));
  translate (400,20);
  for (int i=0; i<10; i++) {
    rotate(TWO_PI / 10);
    line (0,0,30,0);

  }

  strokeWeight(0);
  fill(color(255,0,200));
  ellipse(0,0,15,15);

  // during even-numbered seconds (0, 2, 4, 6...)
  if (second() % 2 == 0) {  
    jitter = random(-0.005, -0.003);
  }
  angle = angle + jitter;
  float c = tan(angle);
  translate(width/-5, height/10);
  rotate(c);  
  
  strokeWeight(2.0);
  stroke(color(48,139,206));
  translate (-20,-300);
  for (int i=0; i<20; i++) {
    rotate(TWO_PI / 12);
    line (0,0,30,0);

  }

  strokeWeight(0);
  fill(color(100,30,10));
  ellipse(0,0,10,15);
  
  strokeWeight(2.0);
  stroke(color(200,190,0));
  translate (-200,-300);
  for (int i=0; i<20; i++) {
    rotate(TWO_PI / 16);
    line (0,0,30,0);

  }

  strokeWeight(0);
  fill(color(60,180,0));
  ellipse(0,0,10,15);
  
    strokeWeight(1.0);
  stroke(color(154,12,0));
  translate (100,-300);
  for (int i=0; i<20; i++) {
    rotate(TWO_PI / 20);
    line (0,0,30,0);

  }

  strokeWeight(0);
  fill(color(60,80,0));
  ellipse(0,0,10,15);
  

  strokeWeight(1.0);
  stroke(color(48,139,206));
  translate (250,-100);
  for (int i=0; i<20; i++) {
    rotate(TWO_PI / 7);
    line (0,0,30,0);

  }

  strokeWeight(0);
  fill(color(160,180,0));
  ellipse(0,0,10,15);

}




