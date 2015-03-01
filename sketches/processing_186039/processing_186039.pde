
float[] x, y;
float[] vx, vy; // variables e.g. numbers that have a decimal point.
int r = 50;
int Rmax = 250;
int posX;
int posY;
PImage img;

/*
// Area de trabajo
 int areaR = 250; // radio de area de trabajo
 */

void setup() {
  size(600, 600);
  posX = width / 2;
  posY = height / 2;
  x = new float[35]; // x Array size
  y = new float[x.length]; // y array size equal to x
  vx = new float[x.length]; // vx array size equal to x
  vy = new float[x.length]; // vy array size equal to y

  for (int n = 0; n < x.length; n++) { // till n reaches x.length (in this case x = 100 at the moment when the comment was made, see line 5)  
    float theta = random(0, 2*PI);
    float radius = random(0, Rmax);
    x[n] = (width/2) + (radius*cos(theta)); 
    y[n] = (height/2) + (radius*sin(theta));
    vx[n] = random(-2, 2); // gives a random value to the velocity from -5(to the left) to 5(to the rigth)
    vy[n] = random(-2, 2); // gives a random value to the velocity from -5(to the bottom) to 5(to the top)
  }
  background(255, 255, 255); // WHITE
}

void draw() { // we start the graphical part
  //background(255, 255, 255);
  //noFill(); 
 fill(255); // WHITE
  noStroke();
  rect(0, 0, width, height);  
    img = loadImage("TextBeOpenLab.png");
    image(img, width -150, 75);
    
  for (int n = 0; n < x.length; n++) { // till n reaches x.length (in this case x = 100 at the moment when the comment was made, see line 5)
    x[n] = x[n] + vx[n]; 
    y[n] = y[n] + vy[n];
    /* 
     if (x[n] > (width-r) || x[n] < r) {
     vx[n] = -1 * vx[n];
     }
     if (y[n] > (height-r) || x[n] < r) {
     vy[n] = -1 * vy[n];
     }
     */
    if (dist (x[n], y[n], posX, posY) > Rmax) {
      vx[n] = -1 * vx[n];
      vy[n] = -1 * vy[n];
    }
  }

  for (int n = 0; n < x.length; n++) {
    for (int m = 0; m < x.length; m++) {
      float d = dist(x[n], y[n], x[m], y[m]);
      if (d < 2*r + r) {
        strokeWeight(random(2));
        //stroke (random(0, 20), random(0, 20), random(80, 95), 30);
        stroke(0, 80);
        line(x[n], y[n], x[m], y[m]);
      }
    }
  }

//    saveFrame("OpenBioLab-####"); //If you wanna, this will save the images on a "data" folder in your sketch folder
}
