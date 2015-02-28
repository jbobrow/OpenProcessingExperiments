
PImage hourGear;
PImage minuteGear;
PImage secondGear;

void setup() {
  size(500, 500);
  
  String hoururl = "http://i.imgur.com/UUV0Mdz.png";
  String minuteurl = "http://i.imgur.com/TEXZyhP.png";
  String secondurl = "http://i.imgur.com/xqsvPBp.png";
  
  hourGear = loadImage(hoururl);
  minuteGear = loadImage(minuteurl);
  secondGear = loadImage(secondurl);
}

void draw() {
  background(255);
  
  translate(width/2, height/2);
  rotate(map(hour() % 12, 0, 12, 0, TWO_PI));
  imageMode(CENTER);
  image(hourGear, 0, 0);
  
  rotate(map(minute(), 0, 60, 0, TWO_PI));
  imageMode(CENTER);
  image(minuteGear, 0, 0);
  
  rotate(map(second(), 0, 60, 0, TWO_PI));
  imageMode(CENTER);
  image(secondGear, 0, 0);
  
}


