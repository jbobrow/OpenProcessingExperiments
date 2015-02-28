
//bg color
int bg = 255;
float diam = 20;
float re, gr, bl;
int rd = 1;
int gd = 1;

//colors randomized
int r = int(random(255));
int g = int(random(255));
int b = int(random(255));
//make a direction for r,g,b
//set this after g and b = 0
//if (r==255 || r==0) {
//  rd = -rd;
//if (g==255 || g==0) {
//  gd = -gd;
//}


//OK:set size, bg, orig. color for ellipse, frame rate
void setup() {
  size(600, 500);
  background(bg);
  frameRate(80);
  noStroke();
}

//PROB: make colors rgb change as mouse moves over time
void draw() {
  if (r < 255) {
    r = r + 1;
  }
  if (r == 255) {
    println(r + "= r");
    if (g < 255) {
      g = g + 1;
    }
    if (g == 255) { 
      println(g + " = g");
      if (b < 255) {
        b = b + 1;
      }
      if (b == 255) {
        println(b + " = b");
        if ((r>=255) && (g>=255) && (b>=255)) {
          println("white");
          //make into loop
          while (r >= 5) {
            r = r - 5;
            println(r + "=r2");
          }
          while (g >= 5) {
            g = g - 5;
            println(g + "=g2");
          }
          while (b >= 5) {
            b = b - 5;
          }
          //fill(r, g, b, 150);
          //color c = color(r, g, b, 150);
          //fill(c);
          println("colorchange");
        }
      }
    }
    //fill(r,g,b,150);
    diam = noise(frameCount * 0.1) * 100;
    ellipse(mouseX, mouseY, diam, diam);
    //ellipse(x,y,diam,diam);
  }
}
void mouseMoved() {
  fill(r, g, b, 150);
}

//click to change ellipse to random color
void mousePressed() {
  fill(random(255), random(255), random(255), 150);
}

//DONE:press any key to switch bg to black or white (invert bg)
void keyPressed() {
  if (bg == 255) {
    background(0);
    bg = 0;
  }
  else {
    background(255);
    bg = 255;
  }
}



