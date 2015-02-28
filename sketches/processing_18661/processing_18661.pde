
float x;
float y;
float radius = 20.0;

void setup() {
  size(250,250);
  smooth();
  background(0);
  ellipseMode(RADIUS);
}

void draw() {

  rect(0,0,width,height);
  fill(0,30);
  for( x=random(x); x<250; x+=15) {   
    y+=10;
    stroke(255);
    line(width/2,width/2,mouseX,mouseY);
    stroke(149,208,255);
    line(width/2+10,width/2+10,mouseX,mouseY);
    line(width/2+10,width/2+10,random(x),random(x));

    if (mousePressed) {
      float x = dist (width/2,height/2,mouseX,mouseY);
      stroke(255,120);
      ellipse(mouseX,mouseY,random(x),random(x));
    }
  }
}


