
int a=500; //sketch size
float s=5; //length of line
float x, y; //start of line
int j = 0; //first "wipe"
int k = -250; //second "wipe" 


void setup() {
  background(20);
  size(500,500);
  noStroke();
  frameRate(100);
}

void draw() {
// First attempt: draw "real" noise pixel by pixel.
// Turns out the sketch slows down to 2fps or so.

//  for (int i=0;i<=a;i++) {
//    for (int j=0;j<=a;j++) {
//      stroke(random(0,255));
//      point(i,j);
//    }
//  }
  
    for (int i=0;i<=0.5*a;i++) {
      stroke(random(0,255));
      x = random(0,a);
      y = random(0,a);
      line(x,y,x+random(0,s),y);
  }
  stroke(100,100);
  line(0,j,a,j);
  j++;
  if (j>a) {
    j=0;
  }
  stroke(100,100);
  line(0,k,a,k);
  k++;
  if (k>a) {
    k=0;
  }
}


