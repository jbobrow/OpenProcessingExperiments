
PFont font;
float y = 400;
float x = 400;
float eyeR;
float mouth;


void setup(){
  size(800,800);
  background(255);
  smooth();
  font = loadFont("ACaslonPro-Bold-48.vlw");
 
}
void draw(){
  noStroke();
  background(255);
  stroke(0);
  strokeWeight(100);
  line(x,y,x,y+1000);
  fill(0,0,0);
  noStroke();
  ellipse(x,y,500,500);
  fill(eyeR,0,0);
  ellipse(x + 100,y,100,100);
  fill(eyeR,0,0);
  ellipse(x - 100,y,100,100);
  strokeWeight(50);
  stroke(255);
  line(x-50,y+150,x+50,y+150);
  fill(0);
  textFont(font,70);
  translate(0,0);
  text("REASON IS TREASON",17,100);
  y = y + random(-1,1);
  x = x + random(-1,1);
  eyeR = random(0,255);

}

