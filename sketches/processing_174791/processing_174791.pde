
int w = 800;
int h = 800;
 
PFont fontNanum;
 
void setup() {
  size(w, h);
  background(random(255),random(255),random(255));
  fontNanum = createFont("San-Serif", 20);
  textFont(fontNanum);
 
  smooth();
  strokeWeight(35);

}
 
void draw() {
  background(random(255),random(255),random(255));
 
  int is = second();
  int im = minute();

  int ih = hour();
  String am = "am";
  if(ih > 12){
    ih -= 12;
    am = "pm";
  }
  float fs = float(is);
  stroke(255);
  float fm = float(im);
  float fh = float(ih);
 
  fill(random(255),random(255),random(255));
  stroke(255);
  stroke(random(255),random(255),random(255));
  arc(h/2, h/2, h, h, TWO_PI - PI/2, TWO_PI - PI/2 + TWO_PI*(fh/12));
  fill(random(255),random(255),random(255));
 
  stroke(255);
  stroke(random(255),random(255),random(255));
  arc(h/2, h/2, h - 100, h - 100, TWO_PI - PI/2, TWO_PI - PI/2 + TWO_PI*(fm/60));
  fill(random(255),random(255),random(255));
  arc(h/2, h/2, h - 200, h - 200, TWO_PI - PI/2, TWO_PI - PI/2 + TWO_PI*(fs/60));
  noStroke();
   stroke(random(255),random(255),random(255));
  fill(random(255),random(255));
  textAlign(CENTER, CENTER);
  text(ih + "h " + im + "m " + is + "s " + am, w/2 + 2, h/2 + 2);
  noStroke();
  fill(1);
  ellipse(400,400,15,15);
}
