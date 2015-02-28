
int num = 10;
float[] mySize = new float[num];
float[] ypos = new float[num];
float[] speed = new float[num];
float[] rate = new float[num];
color[] myColors = new color[4];
int[] col = new int[num];


void setup() {

  size(300,300);

  //explicitly add colors to the myColors array
  myColors[0] = color(200,40,35,75);
  myColors[1] = color(65,185,54,75);
  myColors[2] = color(255,217,0,75);
  myColors[3] = color(0,168,255,75);

  //use a loop to randomly seed ypos, speed, and col
  for(int i=num-1; i>=0; i--) {
    mySize[i]=random(5,20);
    ypos[i] = random(0,height);
    speed[i] = random(-2,2);
    rate[i] = random(0.1,1);
    col[i] = floor(random(0,4));
  }
  noStroke();
  smooth();
}

void draw() {
  background(220);
  
  for(int i=0; i<num-1; i++) {
    //use the int from col[] to choose the fill from myColors[]
    fill(myColors[col[i]]);
    //draw the ellipse using ypos[]
    ellipse(width/num * i + width/num, ypos[i], mySize[i], mySize[i]);
    ellipse(width/num * i + width/num, ypos[i], 2*mySize[i]/3, 2*mySize[i]/3);
    ellipse(width/num * i + width/num, ypos[i], mySize[i]/3, mySize[i]/3);
    //update ypos[] with speed[]
    ypos[i] = ypos[i] + speed[i];
    mySize[i] = mySize[i] + rate[i];

    
    //if the circles go off the screen, reset them
    if(ypos[i] > height + mySize[i]/2) ypos[i] = 0;
    if(ypos[i] < -mySize[i]/2) ypos[i] = height;
    if(mySize[i]>100) mySize[i] = mySize[i]-rate[i];
  }
}


