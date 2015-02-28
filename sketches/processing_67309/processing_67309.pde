
float xH, yH, xM, yM, xS, yS;
float degH, degM, degS;
float radH, radM, radS;
PFont font;

void setup() {
  size(500, 500);
  background(0);
  font = createFont("Helvetica", 24);
}

void draw() {
  fill(0, 20);
  noStroke();
  rect(0, 0, 150, 50);
  fill(255);
  textFont(font);
  text((hour() + ":" + minute() + ":" + second()), 10, 40);
  
  degH = map(hour(), 0, 23, 0, -359);
  degM = map(minute(), 0, 59, 0, -359);
  degS = map(second(), 0, 59, 0, -359);
  
  radH = (PI/180)*degH;
  radM = (PI/180)*degM;
  radS = (PI/180)*degS;
  
  xH = -sin(radH)*70 + (width/2);
  yH = -cos(radH)*70 + (height/2);
  xM = -sin(radM)*120 + (width/2);
  yM = -cos(radM)*120 + (height/2);
  xS = -sin(radS)*180 + (width/2);
  yS = -cos(radS)*180 + (height/2);
  
  //bg
//  circS();
//  fill(255, 0, 100);
//  noStroke();
//  ellipse(width/2, height/2, 15, 15);
  
  fill(255);
  ellipse(width/2, height/2, 15, 15);
  
  ellipse(xH, yH, 12, 12);
  ellipse(xM, yM, 10, 10);
  ellipse(xS, yS, 5, 5);
  
//  line(width/2, height/2, xH, yH);
//  line(width/2, height/2, xM, yM);
//  line(width/2, height/2, xS, yS);
  
  noFill();
  stroke(255, 0, random(255), random(3));
  beginShape();
  curveVertex(0, height);
  curveVertex(0, height);
  curveVertex(width/2, height/2);
  curveVertex(xH, yH);
  curveVertex(xM, yM);
  curveVertex(xS, yS);
  curveVertex(xS, yS);
  endShape();
  
  noFill();
  stroke(random(20), 255, random(100), random(3));
  beginShape();
  curveVertex(width, 0);
  curveVertex(width, 0);
  curveVertex(xS, yS);
  curveVertex(xM, yM);
  curveVertex(xH, yH);
  curveVertex(xH, yH);
  endShape();
  
  //flash
  if(second() >= 59) {
    background(0, 5);
  }
  
  println(dist(xS, yS, xH, yH));
  
  if(dist(xS, yS, xH, yH) < 200) {
    stroke(255, 255, 255, random(5));
    line(xH, yH, xM, yM);
    line(xM, yM, xS, yS);
    line(xH, yH, xS, yS);
  }
  
}

void circS() {
  noStroke();
  fill(255 - second()*3);
  ellipse(width/2, height/2, second()*2, second()*2);

}

