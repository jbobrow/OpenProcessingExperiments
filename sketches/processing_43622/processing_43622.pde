
//initiate arrays for dervish positions and frames
int[] xpos = new int[25];
int[] ypos = new int[25];
PImage[] dervish = new PImage[25];
//dervish dims
int w = 219;
int h = 185;

//background visual effect variables
float cir1X;
float cir1Y;
float cir2X;
float cir2Y;
float cirW;


void setup() {
  size(600,600);

//load all the images into their slots and set x and y to zero
  
  for (int i = 0; i < xpos.length; i++) {
    xpos[i]=0;
    ypos[i]=0;
    dervish[0] = loadImage("derv14.gif");
    dervish[1] = loadImage("derv13.gif");
    dervish[2] = loadImage("derv12.gif");
    dervish[3] = loadImage("derv11.gif");
    dervish[4] = loadImage("derv10.gif");
    dervish[5] = loadImage("derv9.gif");
    dervish[6] = loadImage("derv8.gif");
    dervish[7] = loadImage("derv7.gif");
    dervish[8] = loadImage("derv6.gif");
    dervish[9] = loadImage("derv5.gif");
    dervish[10] = loadImage("derv4.gif");
    dervish[11] = loadImage("derv3.gif");
    dervish[12] = loadImage("derv2.gif");
    dervish[13] = loadImage("derv1.gif");
    dervish[14] = dervish[0];
    dervish[15] = dervish[1];
    dervish[16] = dervish[2];
    dervish[17] = dervish[3];
    dervish[18] = dervish[4];
    dervish[19] = dervish[5];
    dervish[20] = dervish[6];
    dervish[21] = dervish[7];
    dervish[22] = dervish[8];
    dervish[23] = dervish[9];
    dervish[24] = dervish[10];
  }
}

void draw() {
  noCursor();
  frameRate(20);
  background(225,70,0);
  
//drawing circles that make the BG effect
  smooth();
  noFill();
  strokeWeight(80);
  ellipseMode(CENTER);
//loop makes a bunch of em 
  for (cirW=80; cirW<width+400; cirW = cirW+150) {
    cir1X = mouseX;
    cir1Y = mouseY;
    
//circle 2 does the opposite of circle 1 as if the grid started in the center
    if (cir1X < (width/2)) {
      cir2X = cir1X + (((width/2) - cir1X)*2);
    }else{
      cir2X = cir1X - ((cir1X - (width/2))*2);
    }
    if (cir1Y < (height/2)) {
      cir2Y = cir1Y + (((height/2) - cir1Y)*2);
    }else{
      cir2Y = cir1Y - ((cir1Y - (height/2))*2);
    }    
    
//map the circles to keep the effect tight    
    float mx1 = map(cir1X,0,width,250,350);
    float my1 = map(cir1Y,0,height,250,350);
    float mx2 = map(cir2X,0,width,250,350);
    float my2 = map(cir2Y,0,height,250,350);
    
//draw circles    
    stroke(255,240,0);
    ellipse(mx1,my1,cirW,cirW);
    stroke(225,70,0);
    ellipse(mx2,my2,cirW,cirW);
      
    
  }


//drawing "dervish dragon"  
//initiate array of positions  (i still don't quite understand how this array works)
  for (int i = 0; i < xpos.length-1; i++) {
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
  }
  
  xpos[xpos.length-1] = mouseX;
  ypos[ypos.length-1] = mouseY;

//draw each "frame" of animation in sequence, corresponding with mouse movement  
  for (int i=0; i < xpos.length; i++) {
    imageMode(CENTER);
    image(dervish[i],xpos[i],ypos[i],w,h);
  }
}


