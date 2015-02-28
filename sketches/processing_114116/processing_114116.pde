
float x, y;
float y1, y2; 
float h, s, b, a;
float sw;

void setup() {
  size(900, 600);

  colorMode(HSB);
  background(#025BA7);

  ellipseMode(CENTER);

  noCursor();
}

void draw() {

  noStroke();
  fill(y/height*255, 128, 64, 2);
  rect(0, 0, width, height*.17);

  // sun
  fill(4, 196, 255, 16);
  noStroke();
  //stroke(255,1);
  ellipse(width*.5+random(-5, 5), height*.1+random(-5, 5), random(height*.07, height*.11), random(height*.07, height*.11));

  // sun reflection
  fill(4, 196, 255, 8);
  noStroke();
  ellipse(width*.5+random(-22, 22), height*.55+random(-5, 5), random(height*.044, height*.077), random(height*.77, height*.88));


  // sun bursts
  noStroke();

  a = map(y, 0, height, 3, 2) + random(-1, 1);
  s = 211;

  h = map(y, 0, height, 16, 8) + random(-5, 5);
  b = 128;

  fill(h, s, 255, a*.5);
  ellipse(width*.5, height*.17+random(-5, 5), width*1.4, y*.17);

  a *= .5;
  s *=.4;
  fill(255-h, s, b, a);
  ellipse(width*.5, height*.1, width*2, y*4);

  horzLine(77, .17);

  // horizon
  stroke(4, 196, 255, random(1, 11));
  line(0, height*.17+random(-33, 33), width, height*.15+random(-33, 33) );


  y+=.4;
  if (y>height) y=0;
  
}

void horzLine(int amount, float topY) {
   for (int i=0; i<amount; i++) {
     
    y1 = random(height*topY, height);

    h = map(y1, 0, height, 96, 8); //random(96, 128);
    s = map(y1, 0, height, 8, 255); // random(22, 255);
    b = map(y1, 0, height, 64, 196); // random(22, 255);
    a =  map(y1, 0, height, 44, 11);

    stroke(h, s, b, a);

    x = random(width);

   // y2 = random(height*topY, height*1.5);

    //line(x, y1 , x+random(-10,10), y2 );

    strokeWeight(random(8));
    line(0, y1+random(-33,33), width, y1+random(-33,33));
  }
}


