
int num=50; //number of indices

//array setup
float[] y = new float[num];
float[] x =new float[num]; 



color rain = color(18, 229, 255); //setup colors
color lightning = color(255, 248, 10);

void setup() {
  size(300, 300);


  //setup the seed
  for (int a = 0; a < y.length; a++) {     //setup seed a
    y[a] = random(height);
  }


  for (int b = 0; b < x.length; b++) {     //setup seed b
    x[b] = random(width);
  }
}


void draw() {
  background(140);  //gray background

  //setup rain
  fill(rain);
  stroke(0,45,255); //outside of raindrop darker
  for (int a =0; a < num; a++) {
    ellipse((width/y.length)*a, y[a], 8,12) ;  //sets the size of rain
    y[a] = y[a]+2.5; //speed of rain
    if (y[a] > width) y[a] = 0;
  }
  
  //setup lightning
  stroke(255,255,100);
  fill(lightning);
  for (int b =0; b < num; b+=15) {
    rect((height/x.length)*b+5, x[b], 5, height);
    x[b]=x[b]+1; //lightning speed
    if (x[b] > height) x[b] = 0;
  }
}


