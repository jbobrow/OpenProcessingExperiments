
int num = 16;
float mySize = 50;


float[] ypos = new float[num];
float[] speed = new float[num];
float[] length = new float[num];

color[] coolColors = new color[4];
int[] col = new int[num];

void setup() {
frameRate(3);

  size(400,400);


  //explicitly add colors to the myColors array
  coolColors[0] = color(7,191,240,100);
  coolColors[1] = color(196,7,240,100);
  coolColors[2] = color(240,7,65,100);
  coolColors[3] = color(7,240,109,100);

  //use a loop to randomly seed ypos, speed, and col
  
  for(int i=num-1; i>=0; i--) {
    ypos[i] = random(0,height);
    speed[i] = random(-4,20);
    col[i] = floor(random(0,4));

  
  }
stroke (255);

  smooth();
}

void draw() {
   background(255);
float x = (random(5,100));

  for(int i=0; i<num-1; i++) {
    //use the int from col[] to choose the fill from myColors[]
    fill(coolColors[col[i]]);
    //draw the ellipse using ypos[]
    rect(width/num * i+ width/num, ypos[i], x, x + mySize);
    //update ypos[] with speed[]
    ypos[i] = ypos[i] + speed[i];
    
    //if the circles go off the screen, reset them
    if(ypos[i] > height + mySize) ypos[i] = -mySize/2;
    if(ypos[i] < -mySize/2) ypos[i] = height - +mySize/2;

  }
}


