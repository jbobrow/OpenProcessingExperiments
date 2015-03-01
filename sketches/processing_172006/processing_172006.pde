
int w = 100;
int h = 100;

PFont fontNanum;

void setup() {
  size(w, h);
  background(#CD853F);
  fontNanum = createFont("San-Serif", 10);
  textFont(fontNanum);

  smooth();
  noStroke();
}

void draw() {
  background(#CD853F);
  int is = second();
  int im = minute();
  int ih = hour();
  String am = "am";
  if(ih > 12){
    ih -= 12;
    am = "pm";
  }
  float fs = float(is);
  float fm = float(im);
  float fh = float(ih);

  fill(#FF8C60);
  arc(h/2, h/2, h, h, TWO_PI - PI/2, TWO_PI - PI/2 + TWO_PI*(fh/12));
  fill(#FFA54E);
  arc(h/2, h/2, h - 25, h - 25, TWO_PI - PI/2, TWO_PI - PI/2 + TWO_PI*(fm/60));
  fill(#FFDAA6);
  arc(h/2, h/2, h - 50, h - 50, TWO_PI - PI/2, TWO_PI - PI/2 + TWO_PI*(fs/60));
  
  fill(#8B5A2A);
  textAlign(CENTER, CENTER);
  text(ih + "h " + im + "m " + is + "s " + am, w/2 + 2, h/2 + 2);
  fill(255);
  textAlign(CENTER, CENTER);
  text(ih + "h " + im + "m " + is + "s " + am, w/2, h/2);
}
                
