
////////////////////////
/**********************
 Processing 101 - 03
 Wriiten by Gene Kao
 Date --- 2013/11/28
 License - +geneatcg
 ***********************/
////////////////////////

int t = 0;
float z;

void setup() {
  size(610, 450, P2D);
  smooth();
  noStroke();
}

void draw() {
  background(200);

  for (int i = 10; i < width; i+= 10) {
    for (int j = 10; j < height; j+= 10) { 
      float x = i/10;
      float y = j/10;    
      float d = dist(mouseX/10, mouseY/10, x, y);
      //z = cos(sqrt( (x*x) + (y*y) /*- 0.5*t*/));
      z = cos(d - 0.2*t);
      ellipse(i, j, 10*z, 10*z);
    }
  }
  t++; 
}




