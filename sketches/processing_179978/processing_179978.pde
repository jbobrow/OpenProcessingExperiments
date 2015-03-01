
PImage logo;

void setup(){
  size (800,600);
  imageMode(CENTER);
  background(255);
  logo = loadImage("rdr_logo_2.jpg");
  image(logo, width/2, height/2);
}

void draw(){
  background(255);
  image(logo, width-mouseX+30, height-mouseY+30);
}
