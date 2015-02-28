
PImage map;
int x;
PFont f;
String[] earthquakes;

void setup(){
  size(1024, 542);
  x = 15;
  map = loadImage("weedmap.jpg");
  drawBackground();
  rectMode(CENTER);
  ellipseMode(CENTER);
  noStroke();
  rect(x, 527, 30, 30);
  
  f = createFont("Georgia", 20, true);
  textFont(f);
  textAlign(CENTER);
  smooth();
  
  parse();
  drawBackground();
  drawSlider();
//  showQuakes();
}

void draw(){
  drawBackground();
  drawSlider();
  showQuakes();
}

void parse(){
  earthquakes = loadStrings("earthquakes.txt");
  for(int i = 0; i < earthquakes.length; i++){
    earthquakes[i] = earthquakes[i].substring(earthquakes[i].indexOf("March") - 2, earthquakes[i].length());
  }
}

void drawBackground(){
  background(255);
  pushMatrix();
  scale(.5, .5);
  image(map, 0, 0);
  popMatrix();
}

void drawSlider(){
  if(mousePressed){x = mouseX;}
  if(x < 15){x = 15;}
  if(x > 1009){x = 1009;}
  fill(255, 255, 0);
  rect(x, 527, 30, 30);
}

int getSeconds(String s){
  int seconds = 0;
  seconds += (toInt(s.substring(8, s.indexOf(","))) - 8) * 86400;
  seconds += toInt(s.substring(s.indexOf(",") + 2, s.indexOf(",") + 4)) * 3600;
  seconds += toInt(s.substring(s.indexOf(",") + 5, s.indexOf(",") + 7)) * 60;
  seconds += toInt(s.substring(s.indexOf(",") + 8, s.indexOf(",") + 10));
  return seconds;
}

double toInt(String s){
  double num = 0;
  boolean decimal = false;
  int dec = 0;
  boolean negative = false;
  
  for(int i = 0; i < s.length(); i++){
    if(s.charAt(i) == '-'){
      negative = true;
    }else{
      if(s.charAt(i) == '.'){
        decimal = true;
      }else{
        num = num + ((int)s.charAt(i)) - 48;
        num *= 10;
      }
    }
    if(decimal){
      dec++;
    }
  }
  
  while(dec > 1){
    num /= 10;
    dec--;
  }
  num /= 10;
  if(negative){
    num = -num;
  }
  return num;
}

double getX(String s){
  String s2 = s.substring(s.indexOf(",") + 2, s.length());
  s2 = s2.substring(s2.indexOf(",") + 2, s2.length());
  String s3 = s2.substring(s2.indexOf(',') + 1, s2.length());
  double a = toInt(s3.substring(0, s3.indexOf(",")));
  a *= 10000;
  a = Math.round(a);
  a /= 10000;
  return a;
}

double getY(String s){
  String s2 = s.substring(s.indexOf(",") + 2, s.length());
  s2 = s2.substring(s2.indexOf(",") + 2, s2.length());
  double a = toInt(s2.substring(0, s2.indexOf(",")));
  a *= 10000;
  a = Math.round(a);
  a /= 10000;
  return a;
}

int getMag(String s){
  return (int)toInt(s.charAt(0) + "");
}

void showQuakes(){
  
  int second_ = (int)(((double)x)/1009*604800) + 64800;
  
  for(int i = earthquakes.length-1; i >= 0 && getSeconds(earthquakes[i]) < second_; i--){
    double xcoord = getX(earthquakes[i]);
    double ycoord = getY(earthquakes[i]);
    xcoord = (int)((xcoord + 180)/360*1024);
    ycoord = 512 - (int)((ycoord+90)/180*512);
    fill((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    ellipse((int)xcoord, (int)ycoord, getMag(earthquakes[i])+3, getMag(earthquakes[i])+3);
  }
  
  
  
  int day_ = second_ / 86400;
  second_ -= day_ * 86400;
  int hour_ = second_ / 3600;
  second_ -= hour_ * 3600;
  int minute_ = second_ / 60;
  second_ -= minute_ * 60;
  
  fill(255);
  text("March " + (day_ + 8) + ", " + hour_ + ":" + minute_ + ":" + second_, 500, 500);

}

