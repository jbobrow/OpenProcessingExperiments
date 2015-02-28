
/*
 bouncing ball
 
 */
int num=500;
// declare global variables
float[] xspeed, yspeed;
float[] xpos, ypos, wdth, ht;

//initialize sketch
void setup() {


  size(1000, 1000);
  background(0);
  xpos=new float[num];
  ypos=new float[num];
  xspeed=new float[num];
  yspeed=new float[num];
  wdth=new float[num];
  ht=new float [num];
  for(int i=0; i<num; i++) {
    xpos [i]=random(width); 
    ypos [i]=random(height);
    xspeed[i]=random(3); 
    yspeed[i]=random(3); 
    wdth[i]=random(20); 
    ht[i]=wdth[i];
  }
  //ball speed
  //xspeed = 3;
  //yspeed =1;


  //ball size
  //wdth = 20;
  //ht = 20;

  // turn off shape stroke rendering
  noStroke();

  //initial ball placement
  //xpos = width/2;
  //ypos = height/2;

  //frameRate(30);
}

// begin animation loop
void draw() {

  //update background
  background(0);
  for(int i=0; i<num; i++) {

    //draw ball
    ellipse(xpos[i], ypos[i], wdth[i], ht[i]);

    //upgrade position values
    xpos[i]+=xspeed[i];
    ypos[i]+=yspeed[i];


    //ball collission with sketch window edges


    if (xpos[i]>=width || xpos[i]<=0) {
      xspeed[i]*=-1;
    }
    if (ypos[i]>=height || ypos[i]<=0) {
      yspeed[i]*=-1;
    }
  }
}


