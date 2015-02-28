
// The Colour Moog - tools for identifying the colour of dog ears

PImage moog;

void setup() {
  String url = "http://bananamondaes.files.wordpress.com/2013/02/the-moog.jpg";
  moog = loadImage(url, "jpg");
  size(moog.width, moog.height);
  noStroke();
  strokeWeight(10);
  textSize(18);
  textAlign(CENTER);
}

void draw() {
  image(moog, 0, 0);
  
  color c = moog.pixels[mouseY*width + mouseX];
  fill(c);
  ellipse(450,285,30,17);
  ellipse(430,250,50,30);
  ellipse(400,200,70,40);
  ellipse(360,120,320,60);
  fill(0);
  text("Red: "+int(red(c))+", Blue: "+int(green(c))+", Green: "+int(blue(c)),360,125);
  text("Check out Moog's ears..", 300, 50);
  
  if(red(c)>200 & green(c)<100 & blue(c)<100) {
    noFill();
    stroke(c);
    rect(5,5,width-10,height-10);
    noStroke();
  }
}
