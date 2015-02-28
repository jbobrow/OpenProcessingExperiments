
int t  = 30;
PFont fontA;
float x;
float y;
float targetX, targetY;
float easing = 0.05;
float ooff = 0.0;

void setup () {
  size (640,480);
  smooth ();
  fontA = loadFont("Storno-Regular-20.vlw");
  textFont(fontA, 18);
}

void draw () {
  background (0);
  frameRate (30);
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  //Mouse Origin: 320, 270
  
  //Stars
  fill(255);
  
  ooff = ooff + .1;
  float n = noise(ooff) * 4;
  ellipse(60, 400, n, 2);
  
  ooff = ooff + .1;
  float m = noise(ooff) * 4;
  ellipse(100, 150, m, 2);
  
  ooff = ooff + .1;
  float o = noise(ooff) * 4;
  ellipse(200, 300, o, 2);
  
  ooff = ooff + .1;
  float p = noise(ooff) * 4;
  ellipse(400, 390, p, 2);
  
  ooff = ooff + .1;
  float q = noise(ooff) * 4;
  ellipse(550, 200, q, 2);
  
  ooff = ooff + .1;
  float r = noise(ooff) * 4;
  ellipse(350, 100, r, 2);
  
  //Easing
  targetX = mouseX;
  float dx = targetX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
  
  targetY = mouseY;
  float dy = targetY - y-105;
  if(abs(dy) > 1) {
    y += dy * easing;
  }
  
  //Antenna Ball
  fill(y+100,0,0);
  ooff = ooff + .001;
  float v = noise(ooff) * 16;
  ellipse(x, y, v, 10);
  
  //Shadow
  fill(255);
  ellipse(x,440,mouseY-430,13);
  
  //BlackBar
  fill(0);
  rect(x,mouseY-30,70,112);
  noStroke();
  
  //Body
  noFill();
  stroke(255);
  strokeWeight(3);
  arc(x,mouseY-55,60,60,radians(180),radians(360));
  arc(x,mouseY-5,60,60,radians(0),radians(180));
  line(x-30,mouseY-5,x-30,mouseY-55);
  line(x+30,mouseY-5,x+30,mouseY-55);
  
  //Body Details
  arc(x,mouseY-30,60,60,radians(0),radians(180));
  line(x,mouseY-17,x,mouseY+25);
  arc(x-30,mouseY-38,15,15,radians(90),radians(270));
  arc(x+30,mouseY-38,15,15,radians(270),radians(450));
  
  //Antenna
  strokeCap(ROUND);
  line(x,mouseY-85,x,mouseY-93);
 
  //Face
  arc(x,mouseY-50,38,38,radians(180),radians(360));
  arc(x,mouseY-38,38,38,radians(0),radians(180));
  line(x-19,mouseY-50,x-19,mouseY-38);
  line(x+19,mouseY-50,x+19,mouseY-38);
  
  //Mouth 
  line(x-2,mouseY-30,x+2,mouseY-30);
  
  //Eyes
  fill(255);
  noStroke();
  ellipse(x-9,mouseY-38,5,5);
  ellipse(x+9,mouseY-38,5,5);
  
  //Text
  fill(255);
  text("Greetings, Earthlings.", t, 75);
  

}


