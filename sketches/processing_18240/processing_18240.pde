
color rightColor = color(255,255,0);
color leftColor = color(255,0,0,100);
color satelliteColor = color(255,60,60);
color ballColor = color(0,255,120);

void setup() {
smooth();
size(200,160);
}

void draw() {
background(rightColor);

noStroke();
fill(leftColor);
rect(0,0,width*.5,height);

stroke(0);
//fill(255);
// vertical stripe
strokeWeight(25);
line(width*.25+5,0,width*.25+5,height);

// left ball
fill(satelliteColor);
strokeWeight(2);
ellipse(width*.05, height*0.2,width*.15,width*.15);

// right one
strokeWeight(3);
ellipse(width*.45,height*.25,width*.2,width*.2);

// big one
fill(ballColor);
strokeWeight(3);
ellipse(width*.25+5,height*.25-20,width*.5,width*.5);

// inner one
fill(satelliteColor);
strokeWeight(4);
ellipse(width*.22,height*.15,width*.22,width*.22);
}

void mouseMoved() {
  ballColor = color(0,255,120,map(mouseX,0,width,0,255));
  satelliteColor = color(255,60,60,map(mouseY,0,height,0,255));
}

