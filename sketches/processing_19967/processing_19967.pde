
float x = 0;
float x1 = 0;
float x2 = random(40);
float y2 = random(150);

void setup() {
  size(250,250);
  smooth();
  background(0);
}

void draw() {
  fill(255,206,233,30);
  rect(0,0,width,height);


  for (int x=5; x<250; x=x+10) {
    strokeWeight(3.0);
    stroke(255,150);
    rect(random(x),0,random(250),250);
  }

  noFill();
  //eyeball form
  stroke(random(200),y2);
  ellipse(x1,125,125,125);
  ellipse(x1+20,125,80,80);
  ellipse(x1+10,125,60,60);
  ellipse(x1,125,40,40);

  //scrambling circles
  ellipse(x1-150,125,random(95),random(95));
  ellipse(x1-170,125,random(85),random(85));
  ellipse(x1-190,125,random(75),random(75));
  ellipse(x1-210,125,random(65),random(65));



  frameRate(25);
  x1+=2.0;
  if (x1 > 500) {
    x1=-100;
  }
}



