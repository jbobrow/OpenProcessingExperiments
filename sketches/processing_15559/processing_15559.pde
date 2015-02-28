

PFont f;
void setup() {
  size(600,360);

  f=loadFont ("UniversCE-Medium-48.vlw");
  textFont(f);
}

void draw () {





  smooth();
  background(255);
  PImage img1;
  img1= loadImage ("image-04.png");
  image(img1,0,0,width,height);  

  float s = map(second(), 0, 60, 0, -178);
  float m = map(minute(), 0, 60, 0, -178);
  float h = map(hour(),0, 24, 0, -178);

  strokeWeight(0);
  fill(255,100,106,195);
  rect(93, 285, 86, h);
  fill(255,161,18,188);
  rect(265,285,83,m);
  fill(254,255,41,179);
  rect(432,285,83,s);








  fill(0, 204);
   int ss= second();
   int mm= minute();
   int hh= hour(); 
   String time = nf(hh,2)+"       :        " +nf(mm,2) +"       :       " + nf (ss,2);
   textAlign(LEFT);
   textSize(30);
   text(time, width/5, height/6);
   


  fill(0,188);
  PFont f;
  f= loadFont ("UniversCE-Medium-48.vlw");
  textFont(f);
  String g=("HOUR                                               MINUTE                                           SECOND");
  textSize(10);
  text(g,120,295,600,300);

  fill(0,15);
  rect(0,32,600,35);

}

