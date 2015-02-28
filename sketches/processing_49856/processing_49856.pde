
//Claire Gustavson, homework 2, section A, copywrite 2012

void setup () {
  size (400, 400);
}


void draw () {
  initials (50, 50, 300, 300);
}




void initials(int X, int Y, int x, int y) {
  background (255, 200, 200);
  smooth();

  //circle
  noStroke();
  fill (255);
  ellipse (x/2+(X), y/2+(Y), x, y);
  //C

  stroke (255, 200, 12);
  noFill();
  strokeWeight (x/80);
  beginShape();
  curveVertex (x/2+(X), y-(y/15)+(Y));
  curveVertex (x/2-(x/18)+(X), y-(y/20)+(Y));
  curveVertex (x/4+ (x/18)+(X), y-(y/10)+(Y));
  curveVertex (x/7.7+(x/18)+(X), y-(y/5)+(Y));
  curveVertex (x/36+(x/18)+(X), y-(y/2.5)+(Y));
  curveVertex (x/36+(x/18)+(X), y-y+(y/2.5)+(Y));
  curveVertex (x/7.7+(x/18)+(X), y-y+(y/5)+(Y));
  curveVertex (x/4+ (x/18)+(X), y-y+(y/10)+(Y));
  curveVertex (x/2-(x/18)+(X), y-y+(y/20)+(Y));
  curveVertex (x/2+(X), y-y+(y/15)+(Y));
  endShape();


  //d
  stroke (25, 200, 220);
  line (x/2+(x/18)+(X), y-(y/20)+(Y), x/2+(x/18)+(X), y/20+(Y));

  curve(x/2+(x/18)+(X), y-(y/25)+(Y), x/2+(x/18)+(X), y-(y/20)+(Y), x-(x/6)+(X), y-(y/5)+(Y), x-(x/10)+(X), y-(y/2)+(Y));
  curve( x-(x/2)+(X), y-(y/5)+(Y), x-(x/6)+(X), y-(y/5)+(Y), x-(x/9)+(X), y/2-(y/5)+(Y), x-(x/2)+(X), y/2-(y/5)+(Y)); 
  curve( x-(x/2)+(X), y/2-(y/5)+(Y), x-(x/9)+(X), y/2-(y/5)+(Y), x/2+(x/18)+(X), y-y+(y/20)+(Y), x-(x/2)+(X), y-y+(y/20)+(Y)); 
  fill (255);
  strokeWeight (x/40);
  stroke (255);
  line (x/2+(x/26)+(X), y-(y/24)+(Y), x/2-(x/26)+(X), y-(y/24)+(Y));
  line (x/2+(x/26)+(X), (y/24)+(Y), x/2-(x/26)+(X), (y/24)+(Y));

  //I
  
 
  strokeWeight (x/80);
   stroke (255, 121, 0);
  line (x/2+(X), y - (y/24)+(Y), x/2+(X), y/24+(Y));
}


