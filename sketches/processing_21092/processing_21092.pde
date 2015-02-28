
int s;
int m;
int h;
int index;

void setup () {

  size (600,600);
  colorMode(HSB,255);
  background(125);
  smooth();
}

void draw() {

  background(125);
  // get system variables
  s = second();
  m = minute();
  h = hour();

  // fix for 24 hour clock
  if (h > 12) {
    h -=12;
  }

  translate(width/2,height/2);
  rotate(radians(90));
  noStroke();

  fill(210);
  for (float i = 0; i < TWO_PI; i+=0.1) {

    arc(0,0,400,400,i,i+0.05);
  }


  fill(125);
  ellipse(0, 0, 210,210);

//second hand
  strokeWeight(14);
  stroke(#fbf5b1);
  pushMatrix();
  rotate(s % 60 * 0.1-0.025);
  line(-105,0, -200,0);
  popMatrix();
  
//minute hand  
  strokeWeight(16);
  stroke(#c4df9b);
  pushMatrix();
  rotate(m % 60 * 0.1-0.025);
  line(-105,0, -200,0);
  popMatrix();

//hour hand  
  strokeWeight(16);
  stroke(#a4dff7);
  pushMatrix();
  rotate(h % 3600 * 0.1-0.025);
  line(-105,0, -200,0);
  popMatrix();

//second hand in center changes color in different time 
  noStroke();
  fill(s*4.25,90,220);
  pushMatrix();
  rotate(s % 60 * 0.1-3.35);
  arc(0,0,140,140,0,0.37);
  popMatrix();
  
}


