
PFont font;

int timer = 0;
int lastprinttime;
color randcolor1 = color(255,255,0);
color randcolor2 = color(255,0,0);

void setup() {
  size(600,200);
  frameRate(30);
  smooth();
  font = loadFont("Arial-Black-48.vlw");
}

float angle = 0.02;
float delta = 0.02;

void draw() {
  background(127+127*sin(angle));
  angle+=0.04;

  stroke(random(255),random(255),random(255),32);
  strokeWeight(5+5*sin(angle));
  wtf(width/2,height/2,150);

  noStroke();
  fill(127+127*sin(angle*-4),50);
  for (int i = 0; i <= width*10; i++) {
    float y = noise(delta)*height/2;
  //  ellipse(i*10-width,y + height/4,2,16); //lags p.js
    delta += 0.1*sin(angle);
  }
  fill(64,64,255);


  int milliseconds = millis();
  if(milliseconds - lastprinttime >= 200){
    lastprinttime = milliseconds;
    timer++;
  }

  if(timer > 1){
    timer = 0;
    randcolor1 = color(random(60,255),random(60,255),random(60,255));
    randcolor2 = color(random(60,255),random(60,255),random(60,255));
  }
  if(timer == 0) {
    fill(randcolor1);
    textFont(font,100);
    text("PARTY",100,125);
  }

  if(timer >= 1){
    fill(randcolor2);
    textFont(font,100);
    text("TIME",150,125);
  }



  pushMatrix();
  translate(600*sin(angle*1.25),75);
  rotate(7*sin(angle));
  lolcoolfaceguy(50,50,50,50);
  popMatrix();


  pushMatrix();
  translate(400*sin(angle*-1.25),75);
  rotate(6*sin(angle*-1));
  lolcoolfaceguy(50+20*sin(angle),50+30*sin(angle),50+30*sin(angle),50+20*sin(angle));
  popMatrix();



}

float noisey = 0.1;

void wtf(float x, float y, float r)  {   
  fill(127+127*sin(angle),127-127*sin(angle),127-127*sin(angle),64);
  ellipse(x+random(-3,3),y+random(-3,3),r+r*sin(angle),r+r*sin(angle*1.25));
  if (r > 30) {
    wtf(x-r,y,r/1.5);
    wtf(x+r,y,r/1.5);
  }   
}

void lolcoolfaceguy(float x, float y, float w, float h) {
  stroke(0);
  strokeWeight(2);
  fill(255,255,0);
  ellipse(x,y,w,h);
  ellipse(x-x/4,y-y/6,x/3,y/3);
  ellipse(x+x/5,y-y/6,x/3,y/3);
  fill(0);
  ellipse(x-x/5,y-y/5,x/6,y/6);
  ellipse(x+x/4,y-y/5,x/6,y/6);
  fill(255,0,0);
  beginShape();
  curveVertex(x-x/3,y+y/10);
  curveVertex(x-x/3,y+y/10);
  curveVertex(x-x/5,y+y/2.75);
  curveVertex(x,y+y/2.35);
  curveVertex(x+x/5,y+y/2.75);
  curveVertex(x+x/3,y+y/10);
  curveVertex(x+x/3,y+y/10);
  endShape();
  line(x-x/3,y+y/10,x+x/3,y+y/10);
}






