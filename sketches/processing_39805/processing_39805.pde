
int num = 20; //sets the number of variables

//arrays
float[] x=new float[num]; //x-coordinate
float[] y=new float[num]; //y-coordinate
float[] s=new float[num]; //speed

void setup() {
  size(300, 300);
  background(50, 0, 10);

  //seed the array
  for (int i=0; i<num; i++) {
    x[i] = random(width);
    y[i] = random(height);
    s[i] = random(.25, 3);
  }
}

void draw() {
  smooth();

  for (int i=0; i < num; i++) {

    //falling ellpises
    noStroke();   
    fill(255, 150, 0, 10);
    ellipse(x[i], y[i], 20, 50);

    //changes the ellipses so they come from the bottom of the composition
    pushMatrix();
    translate(0, 300);

    //rising ellipses
    noStroke();
    fill(0, 200, 150, 50);
    ellipse(x[i], -y[i], 10, 30);

    popMatrix();

    //variable speed
    y[i] = y[i] + s[i];
    if (y[i] > height) {
      y[i] = 0;
    }
  }
}


