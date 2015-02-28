
PImage img;

void setup() {
  size(603, 449);
  img = loadImage("http://25.media.tumblr.com/77dfeec70b90f04a1dbd96cd0758661c/tumblr_mx5aj13R5D1rwnnjro1_1280.jpg");
}

void draw() {
  image(img, 0, 0);

  
  float x = random(0, 603);
  float y = random(0, 700);
  
  float x2 = random(0, 603);
  
  float f = random(0, 255);
  
  color c = color(255);
  
  float h = random(10, 200);
  float w = random(20, 300);
  
  float sw = random(1, 10);
  
  noStroke();
  rect(0, 0, 603, 449);
  fill(158, 100);
  
  stroke(c);
  line(x2, 0, x2, 449);
  strokeWeight(sw);
 
  noStroke();
  rect(x, y, w, h);
  fill(255, f);
  
  //ellipse(x,y,30,30);
  
  frameRate(10);
}
