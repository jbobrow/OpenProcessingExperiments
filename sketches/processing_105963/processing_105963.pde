
//modify the code to create an interesting clock
//time - millis (), second (), minute (), hours ()

int rectH;
float bgCol = 50;
color c1 = color(23, 45, 67);
color c2 = color(134, 56, 144);

void setup(){
  size(500, 500);
  rectH = height/3;
}

void draw(){
  background(bgCol); //processing already knows millis, second, minute, hour
  int ms = millis();
  int s = second(); //value from 0-59
  int m = minute();//values from 0-59
  int h = hour(); //values from 0-23
  float newS = map(s, 0, 59, 0, width); //this float maps the s value to the width of the screen
  
  //seconds
  fill(c1);
  rect(0, 0, newS, rectH); //here we use newS instead of s to utilize the map
  //minutes
  fill(c2);
  rect(0, rectH, m, rectH);
  //hours
  rect(0, rectH*2, h, rectH);
  
  if (s==20) {
  bgCol=100;
  }

println ("MS = " + ms + "S = "+ s + "M = " + m + "H = " + h);

}
