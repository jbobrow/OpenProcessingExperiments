
int numB = 10;
int numT = 50;
int s = 20;

int[] xB = new int [numB];
int[] yB = new int [numB];
int[] xT = new int [numT];
int[] yT = new int [numT];

color col = #361C0A;

void setup() {
    size(400,400);
    smooth();
    for (int i = 0; i < numB; i++) {
      xB[i] = int(random(width));
      yB[i] = int(random(height));
    }
    for (int j = 0; j < numT; j++) {
       xT[j] = int(random(width));
       yT[j] = int(random(height));
    }
}

void draw () {
    background(#DBC57E);
    for (int i = 0; i < numB; i++) {
      xB[i]++;
      if (xB[i]>(width + s)) {
           xB[i] = -s;
           yB[i]=int(random(height));
       }
      bear(xB[i], yB[i]);
    }
    for (int i = 0; i < numT; i++) {
      tree(xT[i], yT[i]);
    }
}

void bear(int xx, int yy) {
  noStroke();
  fill(col);
  ellipse(xx,yy,s,s);
  ellipse(xx+10,yy,s-5,s-5);
  //ears
  ellipse(xx+8,yy-7,s-9,s-9);
  ellipse(xx+10,yy-7,s-9,s-9);
  stroke(col);
  strokeWeight(5);
  line(xx-5,yy,xx-5,yy+9);
  line(xx+5,yy,xx+5,yy+9);

}

void tree(int xx, int yy) {
   stroke(#4D2D17);
   strokeWeight(5);
   line(xx,yy+40,xx,yy+50);
   noStroke();
   fill(#11310A);
   triangle(xx-20,yy+40,xx,yy,xx+20,yy+40);
}



