
//Need to figure out a way to upload data file for images to show up b/c of old version of processing//


int x = 0;
int speed = 1;
int posX = 600;
PImage whiteRabbit;
PImage grass;
PImage cloud;



int xspacing = 600;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 150.0;  // Height of wave
float period = 300.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

void setup() {
  size(600,600);
  smooth();
  
  whiteRabbit = loadImage("rabbit.png");
  grass = loadImage("grass.png");
  cloud = loadImage("cloud.png");
  
  w = width+600;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  
  
}

void draw() {
  background(100,202,255);
  fill(26,54,0);
  rect(0,450,600,150);
  

  
  /*GRASS*/
  
    image(grass, posX,475,75,125);
    posX--;

    image(grass, posX+500,450,50,100);
    posX--;

    image(grass, posX+1000,475,75,125);
    posX--;

    image(grass, posX+1500,450,50,100);
    posX--;

    image(grass, posX+2000,475,75,125);
    posX--;

    image(grass, posX+2500,400,50,100);
    posX--;

    image(grass, posX+3000,475,75,125);
    posX--;
 
    image(grass, posX+3500,450,50,100);
    posX--;
  
  /*CLOUDS*/
  
    image(cloud, posX,100,125,50);
    posX--;

    image(cloud, posX+500,50,125,50);
    posX--;

    image(cloud, posX+1000,100,125,50);
    posX--;

    image(cloud, posX+1500,50,125,50);
    posX--;

    image(cloud, posX+2000,100,125,50);
    posX--;

    image(cloud, posX+2500,50,125,50);
    posX--;

    image(cloud, posX+3000,100,125,50);
    posX--;
 
    image(cloud, posX+3500,50,125,50);
    posX--;
   


  calcWave();
  renderWave();
}



void calcWave() {
    // Increment theta (try different values for 'angular velocity' here
  theta += 0.05;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  noStroke();
  fill(255);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    image(whiteRabbit,x*xspacing, height/2+yvalues[x], 100, 150);
  }
}



