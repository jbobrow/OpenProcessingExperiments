
//by Rachael Nelson
//1. Title: Roller Coaster, Date: January 29th, 2011
//Start with a vertical line drawn from a specific point, and all subsequent 
//lines begin from a point that shifts slightly down and to the right from the
//previous (But not the same amount of change each time). Each line also has
//an increasing slight change in angle. (First line is vertical, 
//second line is tilted a couple degrees, third line is tilted slightly more, etc.).
//Draw several of these sequences overlapping.

void setup() {
  size(400,400);
  background(40);
  smooth();
  noStroke();
  
  //noLoop();
}

void draw() {
  strokeWeight(0);
  fill(40,10);
  rect(-10,-10,10+width,10+height);
  
  stroke(255);
  //lineSeq(100, 200, 5, 5);
  lineSeq( random(-50,width), random(-50,height+50), 
           int(random(5,20)), int(random(5,20)) );
}

void lineSeq(float x, float y, int dst, int lines) {
  translate(x,y);
  x = 0; y = 0;
  int sw = 1;
  for (int i = 1; i <= lines; i++) {
    rotate(PI/100);
    sw = int(random(1,10));
    strokeWeight(sw);
    line(x,y,x, y-100);
    x +=  dst;
    y +=  dst;
  }
}
                
