
//Christopher Chan
//ckchan@andrew.cmu.edu
//(c) Written on Sept 6 2012
//Assignment 4 - CLOCK

float d, h1, h2, h3, mr, mg, mb, sr, sg, sb, msr, msg, msb;
color c;
void setup () {
  size(400, 400);
  background(#FFFFFF);
  smooth();


  d = 50;
  h1 = PI*5/4;
  h2 = 0;
  h3 = 0;
  mr= random(255);
  mg= random(255);
  mb= random(255);
  sr= random(255);
  sg= random(255);
  sb= random(255);
  msr= random(255);
  msg= random(255);
  msb= random(255);
  c = color(random(255),random(255),random(255));
}

void draw () {

  //black background
  noStroke();
  fill (#FFFFFF, 2);
  rect (0, 0, 400, 400);

  //center
  fill(#AAAAAA);
  ellipse (width/2, height/2, d, d);

  //crosshair
  stroke (#888888);
  strokeWeight(1);
  noFill();
  line (width/2, d, width/2, height-d);
  line (d, height/2, width-d, height/2);

  //timer
  translate (width/2, height/2);
  strokeWeight(3);

  //minutes
  stroke (mr, mg, mb);
  rotate (h1);
  h1=h1+PI*2/100/60/60;
  line(d*1.5, d*1.5, d*2, d*2);

  //seconds
  stroke (sr, sg, sb);
  rotate (h2);
  h2=h2+PI*2/100/60;
  line(d, d, d*3/2, d*3/2);  

  //milliseconds
  stroke (msr, msg, msb);
  rotate (h3);
  h3=h3+PI*2/100;
  line(d/2, d/2, d, d);

  frameRate (100);
  println (frameCount);
}

void keyPressed () {
  if (key == 'a') {
    mr = random(255);
    mg = random(255);
    mb = random(255);
  }
  else if(key == 's') {
    sr = random(255);
    sg = random(255);
    sb = random(255);
  }
  else if(key == 'd') {
    msr = random(255);
    msg = random(255);
    msb = random(255);
  }
}

void mousePressed() {
 noLoop(); 
}

void mouseReleased() {
 loop(); 
}


