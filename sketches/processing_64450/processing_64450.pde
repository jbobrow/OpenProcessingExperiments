
int siz=50;
int grow=0;

int n=0;

void setup() {
  size(500, 400);
  noStroke();
  smooth();
  fill(255, 0, 0);
}

void draw() {
  background(255);

    ellipse(250, 200, siz, siz); 

  if (n % 20==0) {
    grow=5;
  }  
  if (siz>75) {
    siz=75;
    grow=-2;
  }

  if (siz<55) {
    siz=55;
    grow=0;
  }

  siz=siz+grow;
  n=n+1;
}


