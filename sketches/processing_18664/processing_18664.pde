
float x = 0.0;
float y = 15.0;
float b = 40.0;

void setup() {
  size(250,250);
  smooth();
}

void draw() {
  background(183,255,204);
  fill(255,100);

  x+=20;
  if (x > 230) {
    x = 25.0;
  }
  y+=20;
  if (y > 230) {
    y = 25.0;
  }
  b+=30;
  if (b > 100) {
    b = 10.0;
  }

  for(int i=0; i<250; i+=15) {
    stroke(0,i,random(255),100);
    strokeWeight(i/100);
    bezier(i,250,i*2,0,0,i*2,i,0);
  }

  frameRate(8);
  stroke(255,150);
  rect(30,200,20,20);
  rect(90,135,40,40);
  rect(170,210,60,60);
  noFill();
  stroke(random(255));
  ellipse(40,50,20,20);
  ellipse(110,135,40,40);
  ellipse(200,220,60,60);

  noFill();
  stroke(94,240,238);

  strokeWeight(random(2));
  ellipse(40,50,x,y);
  ellipse(110,135,x,y);
  ellipse(200,220,x,y);
  ellipse(40,50,b,y);
  ellipse(110,135,b,y+5);
  ellipse(200,220,b,y+10);
  stroke(random(150,150));
  line(x,y,b,y);
  line(x,y,x,b);

  line(x,y,x+=20,y+=20);
  line(x,y,random(b),random(y));
  ellipse(x,y,random(50),random(50));
}



