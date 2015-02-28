
int rectH;
//color bgCol = (0);

void setup () {
  size(500, 500);
  rectH = height/3;
}

void draw() {

  int ms = millis();
  int s = second();
  int m = minute();
  int h = hour();

  
  float newS = map(s, 0, 59, 0, width);
  
    background(newS, 0, 0);
  
  fill(newS);
  rect(0, 0, newS, newS);
  fill(0, newS, 0);
  rect(0, rectH, m, m);
  fill(0, 0, newS);
  rect(0, rectH*2, h, h);
  
  if ( s == 20) {
  // bgCol = s;
    fill(m, s, ms);
  }
  
  println("MS = " + ms + " S =  " + s + " M = " + m + " H = " + h);
}
    


