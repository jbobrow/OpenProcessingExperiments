
int num =10;

int[] x = new int[num];
int[] y = new int[num];
//int x,y;

void setup() {
  size(600, 600);
  // initialize values of grid
  for (int j=0; j<y.length; j++) {
    for (int i=0; i<x.length; i++) {
      x[i]=(width/num)*i;
      y[j]=(height/num)*j;
    }
  }
}

void draw () {
  noCursor();
  background(5);

  ellipse(mouseX, mouseY, 10, 10);     //replace cursor with circle

  for (int j=0; j<y.length; j++) {
    for (int i=0; i<x.length; i++) {                  //create row for each y-position
      int r = 10;
      if (dist(mouseX, mouseY, x[i], y[j])<200) {    //check for distance to mouse
        r = 30;
        stroke(250);
        line(mouseX, mouseY, x[i], y[j]);            //line connecting mouse circle
      }
      noStroke();
      fill(250);
      ellipse(x[i], y[j], r, r);              //draw circle at grid point
    }
  }
}



