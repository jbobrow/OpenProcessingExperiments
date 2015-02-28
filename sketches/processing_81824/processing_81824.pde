
float xs[];
float ys[];
float xSpeeds[];
float ySpeeds[];
float xGravity[];
float yGravity[];
color colors[];
float r;
float gravity; 
int useless;

//initializing variables
void setup() {
  size(500, 300);
  colorMode(HSB, 360, 100, 100, 255);
  noStroke();

  xs =new float[5000];
  ys =new float[xs.length];
  xSpeeds =new float[xs.length];
  ySpeeds =new float[xs.length];
  xGravity =new float[xs.length];
  yGravity =new float[xs.length];
  colors = new color[xs.length];
  r = 20;


  //generating array variables using while loop
  //generating inital positions and colors of each of the 1000 circles using while loop
  int i =0;
  while (i<xs.length) {
    xs[i]=width/2;
    ys[i]=height/2;
    xSpeeds[i]=0;
    ySpeeds[i]=0;
    xGravity[i]=random(-.01, .01);
    yGravity[i]=random(-.01, .01);
    colors[i]=color(random(255), 100, 120, 90);
    i++;
  }
}


//drawing initial circles and setting inital speed
void draw() {
  background(0, 0, 0);
  for (int i=0; i<xs.length; i++) {
    fill(colors[i]);
    ellipse(xs[i], ys[i], r, r);


    xs[i]=xs[i]+xSpeeds[i]; 
    ys[i]=ys[i]+ySpeeds[i];
    xSpeeds[i]=xSpeeds[i]+xGravity[i];
    ySpeeds[i]=ySpeeds[i]+yGravity[i];

    //reverse y direction of circles when hitting upper or lower bounds of window
    if (ys[i]<0 || ys[i]>height) {
      ySpeeds[i]=ySpeeds[i]*-.85;
    }

    //reverse x direction of circles when hitting left or right bounds of window
    if (xs[i]<0 || xs[i]>width) {
      xSpeeds[i]=xSpeeds[i]*-.95;
    }
  }
}



