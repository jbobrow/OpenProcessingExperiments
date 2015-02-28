
float x, y;
float y1, y2; 
float h, s, b, a;

void setup() {
  size(900, 600);
  
  colorMode(HSB);
  background(#102731);
  
  ellipseMode(CENTER);
  
  noCursor();
}

void draw() {
  
  noStroke();
  fill(196+(y/height*64), 128, 64, 2);
  rect(0, 0, width, height*.15);
    
  // sun
  fill(8, 200, 255, 4);
  noStroke();
  ellipse(width*.5+random(-5,5), random(-height*.1, height*.1), width+random(height*.1, height*.11), random(height*.1, height*.011));
  
  // sun reflection
  fill(8, 200, 111, random(0,3));
  ellipse(width*.5+random(-22,22), random(height*.1, height*.2), width+random(height*.1, height*.11), random(height*.1, height*.001));
  
  // horizon
  stroke(16, 255,244,  random(1,11));
  line(0,height*.17+random(-33,33),width, height*.15+random(-33,33) );

  // sun bursts
  noFill();
  
  a = map(y, 0, height, 0, 3) + random(-1, 1);
  s = 211;

  h = map(y, 0, height, 164, 212) + random(-5, 5);
  b = map(y, 0, height, 196, 64);

  //stroke(0, 1);
  strokeWeight(y*random(.3, .7));
  
  stroke(h, s, b, a);
  ellipse(width*.5, height*.15, width+y*2, y*2);

 // noStroke();
  a *= .9;
  s *=.4;
  stroke(h, s, b, a);
  ellipse(width*.5, height*.15, y*2, y);

  //stroke(h, s, 255, a*2);
  //strokeWeight(random(3));
  //line(0, y, width, y);

  horzLine(44, .17);

  horzLine(11, .15);
  


  //y++;
  y+=.4;
  if (y>height) {
    //exit();
    y = 0;
  }
}

void horzLine(int amount, float topY) {
   for (int i=0; i<amount; i++) {
     
    y1 = random(height*topY, height*1.5);

    h = map(y1, 0, height, 128, 255); //random(96, 128);
    s = map(y1, 0, height, 128, 255); // random(22, 255);
    b = map(y1, 0, height, 196, 32); // random(22, 255);
    a =  map(y1, 0, height, 4, 44);

    stroke(h, s, b, a);

    x = random(width);

   // y2 = random(height*topY, height*1.5);

    //line(x, y1 , x+random(-10,10), y2 );

    strokeWeight(random(5));
    line(0, y1+random(-33,33), width, y1+random(-33,33));
  }
}


