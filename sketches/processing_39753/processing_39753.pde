
//An array of growing circles

int num = 50; //number of circles

//array
float[] x= new float[num]; //x value
float[] y= new float[num]; //y value
float[] a= new float[num]; //rate of growth
color[] c= new color[num]; //color

void setup() {
  size(300, 300);
  colorMode(HSB, 100);
  smooth();

  for (int i=0; i< num;i++) {
    x[i] = random(width);
    y[i] = i* (height/num);
    a[i] = random(1, 4);
    c[i] = color(int(random(100)), 50, 100, 25);
  }
}

void draw() {
  background(100);

  for (int i=0; i< num; i++) {

    stroke(0);
    fill(c[i]);
    ellipse(width/2, height/2, x[i], x[i]);


    x[i]=x[i]+ a[i];
    if (x[i]> width+10) {
      x[i] = -100;
    }
  }
}


