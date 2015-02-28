
float h = 0;
float m = 0;
float s = 0;
 
void setup() {
  size(600, 600);
  smooth();
  frameRate(60); //10 would be "real time" with a second, minute, and hour hand.
}
 
void draw() {
background(255);
 fill(150,100,50);
 translate(300,300);
rotate(0);

  stroke(0);
  strokeWeight(1);
 rect(-100,-100,200,200);

strokeWeight(10);
 rotate(h);
 line(0,0,0,-100);
 ellipse(0,-100,5,5);
 h=h+2*PI/(600*60*12);

 pushStyle();
 pushMatrix();
 
strokeWeight(5);
rotate(m);
m=m+2*PI/(600*60);
line(0,0,0,-125);
ellipse(0,-125,5,5);


strokeWeight(1);
rotate(s);
s=s+2*PI/600;
line(0,0,0,-60);
ellipse(0,-60,5,5);
popMatrix();
popStyle();
}
