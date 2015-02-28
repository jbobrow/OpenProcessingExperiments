
float count;
int colorcount;
int newcolor = 0;
int r;
int g;
int b;

void setup() {
  size(500, 500);
  background(#000000);
}

void draw() {
  
  //background(newcolor, newcolor, newcolor);
  translate(width/2, height/2);
  count = count + 3;
  
  fill(r, g, b);
  noStroke();
  ellipse(0, 0, count, count);
 
  if (count > 750) {
    count = 0;
    r = int(random(0,255));
    g = int(random(0,255));
    b = int(random(0,255));
  }
  //newcolor = colorcount;
}



