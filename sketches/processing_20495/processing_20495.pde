
int num = 10;
float[] radius = new float[num];
float mySize = 50;
float[] ypos = new float[num];
float[] speed = new float[num];
color[] myColors = new color[4];
int[] col = new int[num];
 
void setup() {
 
  size(300,300);
  frameRate(20);
  //explicitly add colors to the myColors array
  myColors[0] = color(200,40,35,75);
  myColors[1] = color(65,185,54,75);
  myColors[2] = color(255,217,0,75);
  myColors[3] = color(0,168,255,75);
 
  //use a loop to randomly seed ypos, speed, and col
  for(int i=num-1; i>=0; i--) {
    ypos[i] = random(0,height);
    speed[i] = random(-5,5);
    col[i] = floor(random(0,4));
    radius[i] = random(5,100);
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
    ellipse(width/num * i + width/num, ypos[i], radius[i], radius[i]);
    //update ypos[] with speed[]
    ypos[i] = ypos[i] + speed[i];
    radius[i] = radius[i]+2;
     
    //if the circles go off the screen, reset them
    if(ypos[i] > height + mySize/2) ypos[i] = -mySize/2;
    if(ypos[i] < -mySize/2) ypos[i] = height - +mySize/2;
    if(radius[i] > 400) radius[i] = 5;
    if(radius[i] > 100) fill(myColors[col[i]]);
  }
}


