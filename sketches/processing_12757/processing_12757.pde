
//Assignment #3
//Brenna Lash
//blash@brynmawr.edu 
//September 23, 2010

float x,y,w,h,a,b,c,d;

void setup() {

  size(500,500);
  background(0);
  smooth();
  
  
}

void draw() {
 

}




void drawMoon(float x, float y, float w, float h) {

  //moon
  noStroke();
  fill(114,211,240,200);
  ellipse(x+w*.4,y+h*.4,w,h);

  fill(0,245);
  ellipse(x+w*.6,y+w*.4,w,h);

  endShape(CLOSE);
}

void drawStar(float a,float b,float c,float d) {


  noStroke();
  fill(232,250,103,200);

  //star
  beginShape();

  vertex(a,b+.15*d);
  vertex(a-.15*c,b+.5*d);
  vertex(a-.4*c,b+.5*d);
  vertex(a-.2*c,b+.7*d);
  vertex(a-.3*c,b+d);
  vertex(a,b+.8*d);
  vertex(a+.3*c,b+d);
  vertex(a+.2*c,b+.7*d);
  vertex(a+.4*c,b+.5*d);
  vertex(a+.15*c,b+.5*d);
  vertex(a,b+.15*d);
  endShape(CLOSE);
}

void mousePressed() {
  float a,b,c,d;

  a=random(0,500);
  b=random(0,500);
  c=width/10;
  d=c; 

  drawStar(a,b,c,d);
}

void keyPressed() {

  float x,y,w,h;

  x=random(0,500);
  y=random(0,500);
  w=width/10;
  h=w;

  drawMoon(x,y,w,h);
}



