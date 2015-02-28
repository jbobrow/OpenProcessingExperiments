
/* @pjs preload="http://farm8.staticflickr.com/7156/6628096191_a469d349a3_o.png"; */
PImage shoryu;

void setup() {
  size(440, 640);
  //noLoop();
  smooth();
  colorMode(HSB);
  imageMode(CENTER);
  //shoryu = loadImage("shoryu_p5.png");
  shoryu = loadImage("http://farm8.staticflickr.com/7156/6628096191_a469d349a3_o.png");
}

void draw() {
  background(40, 255, 230);
  pushMatrix();
  translate(width/2, height);
  for (int i = 0; i < height*1.5; i+=2) {
    pushMatrix();
    float range = random(-1, 1);
    float d = (height-i*.8)/6 + range*10;
    noFill();
    strokeWeight(1);
    stroke(255, random(153, 204));
    translate((width*2-i)*0.2*sin((-frameCount*3+i)*PI/360) + range, -i);
    line(-d, 0, d, 0);
    popMatrix();
  }
  popMatrix();
  image(shoryu, width/2, height/2);
}

void keyPressed() {
  save("2012_new_year_card.png");
}               
