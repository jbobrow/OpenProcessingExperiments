
//Adam Oaks

int num = 29;
float[] mySize = new float[num];
float[] ypos = new float[num];
float[] speed = new float[num];
color[] myColors = new color[4];
int[] col = new int[num];


void setup() {

  size(300,300);


  //explicitly add colors to the myColors array
  myColors[0] = color(166,203,108);
  myColors[1] = color(249,221,86);
  myColors[2] = color(255,158,64);
  myColors[3] = color(0,0,0,75);

  //use a loop to randomly seed ypos, speed, and col
  for(int i=num-1; i>=0; i--) {
    ypos[i] = random(0,height);
    speed[i] = random(-3,3);
    col[i] = floor(random(0,4));
    mySize[i] = floor(random(10,70));
  }
  noStroke();
  smooth();
}

void draw() {
  background(255);

  for(int i=0; i<num-1; i++) {
    //use the int from col[] to choose the fill from myColors[]
    fill(myColors[col[i]]);
    //draw the ellipse using ypos[]
    ellipse(width/num * i + width/num, ypos[i], mySize[i], mySize[i]);
    //update ypos[] with speed[]
    ypos[i] = ypos[i] + speed[i];
    //if the circles go off the screen, reset them
    if(ypos[i] > height + mySize[i]/2) ypos[i] = -mySize[i]/2;
    if(ypos[i] < -mySize[i]/2) ypos[i] = height - +mySize[i]/2;
  }
}


