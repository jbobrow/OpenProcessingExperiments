
PImage img;
int mod = 1;
int s = 6;
void setup() {
    size( 512, 512 );
    img = loadImage("lenna.png");
    rectMode(CENTER);
}
void draw() {
  background(0);
  if (mousePressed == true) {
    background(0);
    if (mod < 3) {
      mod += 1;
    } else {
      mod = 1;
    }
  } 
  for (int i = 0; i < width; i+=s) {
    for (int j = 0; j < height; j+=s) {
      int px1 = i + round(s/2);
      int py1 = j + round(s/2);
      int   c1 = img.get( px1, py1 );
      float b1 = brightness( c1 );
      fill( b1 );
      stroke( c1 );
      float r1 = map( b1, 0, 255, 0, s);
      if (mod == 1) {
        ellipse( i, j, r1, r1 );
      } 
      if (mod == 2) {
        rect( i, j, r1, r1 );
      } 
      if (mod == 3) {
        if (j % 20 == 0) {
          int x1 = px1;  
          int y1 = py1 - round(r1/2);
          int x2 = px1 - round(r1/2);
          int y2 = py1 + round(r1/2);
          int x3 = px1 + round(r1/2);
          int y3 = py1 + round(r1/2);
          triangle(x1, y1, x2, y2, x3, y3);
        } else {
          int x1 = px1;  
          int y1 = py1 + round(r1/2);
          int x2 = px1 - round(r1/2);
          int y2 = py1 - round(r1/2);
          int x3 = px1 + round(r1/2);
          int y3 = py1 - round(r1/2);
          triangle(x1, y1, x2, y2, x3, y3);
        }
        
        int px2 = i + s;
        int py2 = j + round(s/2);
        int   c2 = img.get( px2, py2 );
        float b2 = brightness( c2 );
        fill( b2 );
        stroke( c2 );
        float r2 = map( b2, 0, 255, 0, s);
        if (j % 20 == 0) {
          int x4 = px2;  
          int y4 = py2 + round(r1/2);
          int x5 = px2 - round(r1/2);
          int y5 = py2 - round(r1/2);
          int x6 = px2 + round(r1/2);
          int y6 = py2 - round(r1/2);
          triangle(x4, y4, x5, y5, x6, y6);  
        } else {
          int x4 = px2;  
          int y4 = py2 - round(r1/2);
          int x5 = px2 - round(r1/2);
          int y5 = py2 + round(r1/2);
          int x6 = px2 + round(r1/2);
          int y6 = py2 + round(r1/2);
          triangle(x4, y4, x5, y5, x6, y6);  
        }
      }
    }
  }
}


