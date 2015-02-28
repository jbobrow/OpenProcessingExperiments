
float x, y;
float y1, y2; 
float h, s, b, a;

void setup() {
  size(900, 600);
  colorMode(HSB);
  background(#0099FF);

  ellipseMode(CENTER);
}

void draw() {

  // a = map(y, 0, height, 44, 0) + random(-5,5);
  a = map(y, 0, height, 3, 1) + random(-1, 1);
  s = 28;

  h = map(y, 0, height, 156, 192) + random(-5, 5);
  b = 255;


 // noStroke();
 stroke(0,1);
  fill(h, s, b, a);
  ellipse(width*.5, 0, y*2, y*2);

  noStroke();
  a *= .9;
    fill(h, s, b, a);

  ellipse(width*.5, 0, y, y*2);

  stroke(h,s,b,a);
  line(0,y,width,y);

  for (int i=0; i<15; i++) {
    h = random(96, 156);
    s = random(22, 255);
    b = random(96, 255);
    a = 22;

    stroke(h, s, b, a);

    x = random(width);

    y1 = random(height*.25, height*1.5);
    y2 = random(height*.25, height*1.5);

    //line(x, y1 , x+random(-10,10), y2 );

    strokeWeight(random(2));
    line(0, y1, width, y2);
    
    //noStroke();
    //fill(h, s, b, a);
    //ellipse(x, y1, random(25), (y1/height)*25.0);
  }

  for (int i=0; i<7; i++) {
    h = random(96, 156);
    s = random(22, 255);
    b = random(96, 255);
    a = 22;

    stroke(h, s, b, a);

    x = random(width);

    y1 = random(height*.75, height*1.5);
    y2 = random(height*.75, height*1.5);

    //line(x, y1 , x+random(-10,10), y2 );
    strokeWeight(random(2));
    line(0, y1, width, y2);
    
    ellipse(x, y1, random(25), (y1/height)*25.0);

  }

  y++;
  if (y>height) {
    //exit();
    y = 0;
  }
}



