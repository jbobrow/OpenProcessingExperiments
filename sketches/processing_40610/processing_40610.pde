
float [] x = new float[1000];

void setup() {
//framerate(30);
  size(400, 400);
  smooth();
  noStroke();
  //fill (255,200);
  for (int i = 0; i < x.length; i++) {
    x[i] = random( -2000, 200) ;
  }
}

void draw() {
  background(0);
  for (int i = 0; i <x.length; i++) {
    x[i] += 2;
    float y = i* 0.9;
    
    fill (248, 250, 204); // muffin top
    stroke(0);
    arc (x[i], y, 50, 50, PI, PI*2);
    fill(115, 224, 218, 200); //muffin bottom
    stroke(0);
    quad (x[i]-20, y, x[i]-17, y+20, x[i]+17, y+20, x[i]+20, y);
    stroke(0, 200); //lines on muffin wrapper
    line (x[i]+16, y+2, x[i]+13, y+18);
    line (x[i]+12, y+2, x[i]+9, y+18);
    line (x[i]-16, y+2, x[i]-13, y+18);
    line (x[i]-12, y+2, x[i]-9, y+18);

    stroke (225, 99, 240); //sprinkles
    line (x[i]-5, y-5, x[i]-1, y-1);
    line (x[i]+7, y-7, x[i]+10, y-10);
    line (x[i], y-11, x[i]+4, y-15);
    line (x[i]+20, y-3, x[i]+17, y-9);
    line (x[i]-18, y-10, x[i]-15, y-7);
    line (x[i]-14, y-17, x[i]-12, y-14);
    line (x[i]-11, y-8, x[i]-10, y-12);
  }
}


