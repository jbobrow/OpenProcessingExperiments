
String data[] = loadStrings("http://www.weatherzone.com.au/vic/central/st-andrews");
PFont font;

void setup() {
  font = loadFont("EurostileRegular-25.vlw");
  textFont(font, 18);
  size(340,480);
  background(255);
  frameRate(1);
}

void draw() {
  weather();
  fill(209,209,209);
  //rect(85, 120, 170, 240);

}


void weather() {

  for (int j=0; j<data.length; j++) {

    String[] bit = split(data[j], ",");
  }

  //println(data[696]);
  String weather = data[696];
  text(weather, 100 ,200, 150, 240);
}


