
//import processing.pdf.*;

int x=25;
int y=25;
int spacing = 50;

void setup() {
  size(500, 500);//,PDF, "laurenwallpaper.pdf");
  background(174, 227, 220);
}


void draw() {
  smooth();
  for (int k=28; k<=500; k = k+spacing) { //left to right and down lines
    for (int p=30; p<=500; p= p+spacing) {
      strokeWeight(2);
      line (k, p, k+20, p+20);
    }
  }
  for (int r=28; r<=500; r= r+spacing) { //left to right and up lines
    for (int s=23; s<=500; s = s+spacing) {
      strokeWeight (2);
      line (r, s, r+20, s-20);
    }
  }
  for (int j = 0; j <= 500; j = j+spacing) { //even set of circles that fit on page
    for (int i=0; i <= 500; i = i+spacing) {
      fill (37, 126, 183);
      //noStroke();
      ellipse (x+j, y+i, 10, 10);
    }
  }

  for (int m=0; m<=500; m= m+spacing) { //odd set of circles that go off page and in between 10
    for (int n=0; n<=500; n = n+spacing) {
      fill (255, 85, 0);
      ellipse (0+m, 0+n, 10, 10);
    }
  }
  
//exit();
}

                
                
