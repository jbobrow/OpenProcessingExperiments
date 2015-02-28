
lee hye ri
201420101

PFont font;
PFont font2;
 
 
 
void setup() {
  size(600, 600);
  noFill();
  smooth();
  font = createFont("AdobeHebrew-BoldItalic",36);
  font2 = createFont("ACaslonPro-Italic",48);
}
 
void draw() {
 
  stroke(second()*8,206,255);
  strokeWeight(1);
  background(0);
 
 
  float v;
  float y;
 fill(255,66,77);
  for (float i=0; i<=width;i=i+3) {
  for (float j=height/2; j<=height/2;j=i+500) {
       float strokeVal=map(0,0,255,0,255);
   ellipseMode(CENTER);
   ellipse(i, j, hour()*10-5, height/2);//changes the size and location of ellipses
   ellipse(j, i, second()*20+10, second()*10+10); 
   textAlign(CENTER,CENTER);
   textFont(font2);
   text(minute(),350,400);
   textFont(font);
   text(second(),350,450);
   textFont(font2);
   text(hour(),350,350);
   
  }
  }
 
}
