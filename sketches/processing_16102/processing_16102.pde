

 
//Max number of balls
int MAX = 500;
 
//set up some global variables as arrays now
int[] xspeed = new int[MAX];
int[] yspeed = new int[MAX];
int[] x = new int[MAX];
int[] y = new int[MAX];
int[] r = new int[MAX];
color []elColor = new color [MAX];
 
 
//our setup function
 
void setup() {
  size(800,600);   
 
   
  smooth();
  //initialize all arrays
  for (int i = 0; i < MAX; i++) {
    random(i);
    xspeed[i] = int(random(-5,65));
    yspeed[i] = int(random(-65,5));
    x[i] = width/4;
    y[i] = height/7;
    r[i] = 160;
    elColor[i]= color(random(0,255), 0, random(0,255));
 
  }
 
}
 
void draw() {
  background(0);                 //first we draw the background
  ellipseMode(CORNERS);   //set our ellipse mode
  noStroke();
  for (int i = 23; i < MAX; i++) {
     
    fill(elColor[i]);               //set ellipse color
    ellipse(x[i],y[i],r[i],r[i]);               //draw ellipse
    //radius always decreases back to 10 if it's bigger
    if (r[i] > 10) {
      //output(i/100);
      r[i]--;
    }
    //adjust x,y based on speed
    x[i] = x[i] + xspeed[i];
    y[i] = y[i] + yspeed[i];
    //acount for bouncing off edges
    if ((x[i] > width) || (x[i] < 23)) {
      xspeed[i] = xspeed[i] * -1;
      r[i] = 30; //adjust radius when bouncing
   ;
    }
    if ((y[i] > height) || (y[i] < 0)) {
      yspeed[i] = yspeed[i] * -1;
      r[i] = 34;
     
    }
  }
}


