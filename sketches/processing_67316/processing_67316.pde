
PFont font;
int hour;
int minute;
int second;

void setup() {
  size(500,500);
  font = loadFont("Meiryo-36.vlw");
  textFont(font, 36);
  smooth();
  hour = hour();
  minute = minute();
}

void draw(){
  background(0);
  //put the seconds int amount here so that as it's drawn and seconds go up, circle will get bigger
  second = second();
  //I want there to be a circle whose width is based on the hour time
  fill(69, 185, 32);
  ellipse(50, 50, hour, 20);
  text(hour(), 45, 45);
  //and a circle whose width is based on the minutes time
  fill(116, 32, 185);
  ellipse(200, 200, minute, 30);
  text(minute(), 190, 190);
  //and a circle whose width is based on the seconds time
  fill(32, 185, 171);
  ellipse(400, 400, second, 40);
  text(second(), 410, 410);
  
}
  

