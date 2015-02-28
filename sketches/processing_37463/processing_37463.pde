
//Alex Nelson
void setup() {
  size(300,300);
}

// square made of thin lines 5 apart and on a gradient
void draw() {
  background(HSB,100,100,100);
  for (int x=100;x<250;x+=5) {
    stroke(x);
    line(x,100,x,250);
}
// square made on points 5 apart
  fill(255);
  for (int x = 50; x < 100; x = x+5) {
  for (int y = 50; y < 100; y = y+5) {
    point(x,y);
  }
  }
//line from corner to corner
  fill(200);
  line (0,0,300,300);
  
//  black line across page
   noFill();
   for (int y=125;y<250;y+=10) {
   rect(0,y,300,250);

//vertical line through center   
   stroke(5);
   line(150,0,150,300);
}
}


