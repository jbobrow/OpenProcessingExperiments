

int num = 2000;
int range = 6;

float[] ax = new float[num];
float[] ay = new float[num];
float[] bx = new float[num];
float[] by = new float[num];
float[] cx = new float[num];
float[] cy = new float[num];
float[] dx = new float[num];
float[] dy = new float[num];


int maxImages = 4;
int imageIndex = 0;
int top, left;

PFont f;

PImage[] images = new PImage [maxImages];
String[] filenames = new String [maxImages];

void setup() {
  size(800,531);
  //String[] filenames = {"aqua_air1_800by531.jpg","aqua_air2_800by531.jpg","aqua_air3_800by531.jpg","aqua_air4_800by531.jpg"};
  //for (int i=0; i < filenmes.length; i++) {
  //images[i] = loadImage(filenames[i]);
  //}
  
  for(int i = 0; i < num; i++) {
    ax[i] = 420;
    ay[i] = height/2;
    bx[i] = 620;
    by[i] = 350;
    cx[i] = 600;
    cy[i] = 350;
    dx[i] = 520;
    dy[i] = 360;
    
  }
  frameRate(30);
  
  images [0] = loadImage("aqua_air1_800by531.jpg");
  images [1] = loadImage("aqua_air2_800by531.jpg");
  images [2] = loadImage("aqua_air3_800by531.jpg");
  images [3] = loadImage("aqua_air4_800by531.jpg");
  
  f = loadFont("SunshineInMySoul-20.vlw");
  
}

void draw() {
  
  noStroke();
  float Index = map(mouseX, 150, width, 3, 0);
  imageIndex = int(Index);
  fill(255, 100);
  image(images[imageIndex],0,0);
  
  textFont(f,20);
  fill(255);
  //text("The short path is situated within hte non-temporal moment of analogy.",20,40);
  text("To get there from here is not a matter of direction,",40,450);
  text("but  rather  the  inference of similarity, memory and discovery.",140,480);
  //text("Every short path is another path.",120,450);
  
  // Shift all elements 1 place to the left
  for(int i = 1; i < num; i++) {
    ax[i-1] = ax[i];
    ay[i-1] = ay[i];
    bx[i-1] = bx[i];
    by[i-1] = by[i];
    cx[i-1] = cx[i];
    cy[i-1] = cy[i];
    dx[i-1] = dx[i];
    dy[i-1] = dy[i];
  }

  // Put a new value at the end of the array
  ax[num-1] += random(-range, range);
  ay[num-1] += random(-range, range);
  bx[num-1] += random(-range, range);
  by[num-1] += random(-range, range);
  cx[num-1] += random(-range, range);
  cy[num-1] += random(-range, range);
  dx[num-1] += random(-range, range);
  dy[num-1] += random(-range, range);

  // Constrain all points to the screen
  ax[num-1] = constrain(ax[num-1], 0, width);
  ay[num-1] = constrain(ay[num-1], 0, height);
  bx[num-1] = constrain(bx[num-1], 0, width);
  by[num-1] = constrain(by[num-1], 0, height);
  cx[num-1] = constrain(cx[num-1], 0, width);
  cy[num-1] = constrain(cy[num-1], 0, height);
  dx[num-1] = constrain(dx[num-1], 0, width);
  dy[num-1] = constrain(dy[num-1], 0, height);
  
  // Draw a line connecting the points
  for(int i=1; i<num; i++) {    
    float val = float(i)/num * 204.0 + 51;
    stroke(val);
    line(ax[i-1], ay[i-1], ax[i], ay[i]);
    line(bx[i-1], by[i-1], bx[i], by[i]);
    line(cx[i-1], cy[i-1], cx[i], cy[i]);
    line(dx[i-1], dy[i-1], dx[i], dy[i]);
  }
  
}

/*
void mousePressed() {
  imageIndex = (imageIndex + 1) % images.length;
  tint(255,100);
}
*/


