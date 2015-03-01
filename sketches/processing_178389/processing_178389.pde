
//The AdVeNtUrEs of the Stick Men
//
//input options:
//s to save screenshot
//left arrow to slow down walking speed for man 1, right arrow to speed it up
//up arrow to slow down walking speed for man 2, down arrow to speed it up
//h/y to change the hat type for man 1/2
//j/u to change the main hat colour for man 1/2
//k/i to change the secondary hat colour (when it exists) for man 1/2
//mouse click to change scenery

//create some colour palettes
int numCloudColours0=7;
color cloudColours0[]= {
  #5c4d7e, #725f9d, #8062c3, #7461a0, #665c7b, #3e3947, #4c4755
};
int numCloudColours1=7;
color cloudColours1[]= {
  #DDDDDD, #CCCCCC, #BBBBBB, #AAAAAA, #999999, #888888, #777777
};
int numCloudColours2=7;
color cloudColours2[]= {
  #CCCCCC, #BBBBBB, #AAAAAA, #999999, #888888, #777777, #666666
};
int numCloudColours3=7;
color cloudColours3[]= {
  #FFFFFF, #EEEEEE, #DDDDDD, #CCCCCC, #BBBBBB, #AAAAAA, #999999
};
int numRainbowColours = 14;
color rainbowColours[] = {
  #000000, #FFFFFF, #FF0000, #FF7F00, #FFFF00, #80FF00, #00FF00, #00FF7F, #00FFFF, #0080FF, #0000FF, #7f00FF, #FF00FF, #FF0080
};

//parameter for printing numbered screenshots
int shotNumber=1;

//number of background scenes and starting scene
int scene=0;
int nscenes=4;

//parameters for the clouds
int speedFac=1;
int cloudDirection=1;
float cloudSpeed=5;
int nclouds=7;
float cloudPosX[]= {
  20.0, 150.0, 260.0, 430.0, 650.0, 47.0, 500.0
};
float cloudPosY[]= {
  20.0, 140.0, 70.0, 190.0, 120.0, 35.0, 205.0
};
float cloudSize[]= {
  150.0, 80.0, 200.0, 170.0, 55.0, 95.0, 135.0
};

//parameters for stick man including speed, shape etc.
int numberOfMen=2;
float manPositionX[]= {
  380, 280
};
float manPositionY[]= {
  530, 540
};
float walkingSpeed[]= {
  0.08, 0.08
};
float scale=0.7;
float thighLength=45.0*scale;
float shinLength=45.0*scale;
float lowerArmLength=25.0*scale;
float upperArmLength=30.0*scale;
float handLength=8.0*scale;
float backLength=90.0*scale;
float headLength=70.0*scale;
float footLength=10.0*scale;
float backAngle=PI/24.0;
float shinAngleLeft[]={-89.0*PI/210.0,-89.0*PI/210.0};
float thighAngleLeft[]={-PI/3.5,-PI/3.5};
float shinAngleRight[]={-PI/30.0,-PI/30.0};
float thighAngleRight[]={PI/2.5,PI/2.5};
float lowerArmAngleLeft[]={-PI/4,-PI/4};
float upperArmAngleLeft[]={-PI/3.5,-PI/3.5};
float lowerArmAngleRight[]={2.4626017,2.4626017};
float upperArmAngleRight[]={0.23122093*PI,0.23122093*PI};
int thighSignLeft[]={-1,-1};
int shinSignLeft[]={-1,-1};
int thighSignRight[]={1,1};
int shinSignRight[]={1,1};
int upperArmSignLeft[]={1,1};
int lowerArmSignLeft[]={1,1};
int upperArmSignRight[]={-1,-1};
int lowerArmSignRight[]={-1,-1};

//global variables for images
/* @pjs preload="louvre_background.png,louvre_foreground.png,erfurt_background.png,erfurt_foreground.png"; */
/* "pjs preload="house_background.png,house_foreground.png,mountains_background.png,mountains_foreground.png"; */
PImage backgroundImage0, foregroundImage0, backgroundImage1, foregroundImage1;
PImage backgroundImage2, foregroundImage2, backgroundImage3, foregroundImage3;

//variables for hats
int numHatTypes=5;
int hatType[]= {
  0, 0
};
int hatColour[]= {
  0, 0
};
int hatColour2[]= {
  0, 0
};

//Create setup code block
void setup() {
  size(800, 600);

  //slow down the refresh rate a bit
  frameRate(10);

  //load background images
  backgroundImage0 = loadImage("louvre_background.png");
  foregroundImage0 = loadImage("louvre_foreground.png");
  backgroundImage1 = loadImage("erfurt_background.png");
  foregroundImage1 = loadImage("erfurt_foreground.png");
  backgroundImage2= loadImage("mountains_background.png");
  foregroundImage2 = loadImage("mountains_foreground.png");
  backgroundImage3 = loadImage("house_background.png");
  foregroundImage3 = loadImage("house_foreground.png");
}

void draw() {
  //draw background image
  if (scene==0) {
    image(backgroundImage0, 0, 0, width, height);
  } else if (scene==1) {
    image(backgroundImage1, 0, 0, width, height);
  } else if (scene==2) {
    image(backgroundImage2, 0, 0, width, height);
  } else if (scene==3) {
    image(backgroundImage3, 0, 0, width, height);
  }

  //draw the (moving) clouds
  drawClouds(nclouds);

  //draw the foregound image (backgrounds without sky)
  if (scene==0) {
    image(foregroundImage0, 0, 0, width, height);
  } else if (scene==1) {
    image(foregroundImage1, 0, 0, width, height);
  } else if (scene==2) {
    image(foregroundImage2, 0, 0, width, height);
  } else if (scene==3) {
    image(foregroundImage3, 0, 0, width, height);
  }

  //draw stick men - called two times so that it's fully visible when it loops around the screen
  for (int i=0; i<numberOfMen; i++) {
    drawMan(i);
    drawMan(i);
    drawHat(i);

    //call another function here to update angles of stick men
    //could potentially have more other functions for other actions e.g. jumping in the future
    walkMan(i);
  }
}

//define the key functions:
//s to save screenshot
//left arrow to slow down walking speed for man 1, right arrow to speed it up
//up arrow to slow down walking speed for man 2, down arrow to speed it up
//h/y to change the hat type for man 1/2
//j/u to change the main hat colour for man 1/2
//k/i to change the secondary hat colour (when it exists) for man 1/2
void keyPressed() {
  if (key == 'S' || key == 's') {
    saveFrame("screenshot"+shotNumber+".png");
    shotNumber++;
  } else if (keyCode == RIGHT) {
    if (walkingSpeed[0] < 0.45) walkingSpeed[0]*=1.01;
  } else if (keyCode == LEFT) {
    if (walkingSpeed[0] > 0.06) walkingSpeed[0]*=0.99;
  } else if (keyCode == UP) {
    if (walkingSpeed[1] < 0.45) walkingSpeed[1]*=1.01;
  } else if (keyCode == DOWN) {
    if (walkingSpeed[1] > 0.06) walkingSpeed[1]*=0.99;
  } else if (key == 'H' || key=='h') {
    hatType[0]++;
    hatType[0]=hatType[0]%numHatTypes;
  } else if (key == 'J' || key == 'j') {
    hatColour[0]++;
    hatColour[0]=hatColour[0]%numRainbowColours;
  } else if (key =='K' || key == 'k') {
    hatColour2[0]++;
    hatColour2[0]=hatColour2[0]%2;
  } else if (key == 'Y' || key=='y') {
    hatType[1]++;
    hatType[1]=hatType[1]%numHatTypes;
  } else if (key == 'U' || key == 'u') {
    hatColour[1]++;
    hatColour[1]=hatColour[1]%numRainbowColours;
  } else if (key =='I' || key == 'i') {
    hatColour2[1]++;
    hatColour2[1]=hatColour2[1]%2;
  }
}

//change the background when the mouse is clicked
void mouseClicked() {
  scene=(scene+1)%nscenes;
}


//draw moving clouds
void drawClouds(int nclouds) {
  //loop over the number of clouds
  for (int i=0; i<nclouds; i++) {
    //use slightly different colour palettes depending on the background scene to better match the aesthetics
    if (scene==0) {
      fill(cloudColours0[i]);
      stroke(cloudColours0[i]);
    } else if (scene==1) {
      fill(cloudColours1[i]);
      stroke(cloudColours1[i]);
    } else if (scene==2) {
      fill(cloudColours2[i]);
      stroke(cloudColours2[i]);
    } else if (scene==3) {
      fill(cloudColours3[i]);
      stroke(cloudColours3[i]);
    }
    //coordinates are fetched from global variables
    float xs=cloudSize[i];
    float ys=xs/2;
    float xr=cloudPosX[i];
    float yr=cloudPosY[i];

    //draw a basic cloud shape using translate() to get the correct position
    translate(xr, yr);
    beginShape();
    vertex(0, 0);
    bezierVertex(0.0, -ys/2, xs/2, -ys/2, xs/2, 0.0);
    vertex(xs/2, 0);
    bezierVertex(xs/2, -ys/2, xs, -ys/2, xs, 0.0);
    vertex(xs, 0);
    bezierVertex(xs+ys/2, 0.0, xs+ys/2, ys, xs, ys);
    vertex(xs, ys);
    bezierVertex(xs, ys+ys/2, xs-xs/2, ys+ys/2, xs-xs/2, ys);
    vertex(xs/2, ys);
    bezierVertex(xs/2, ys+ys/2, 0.0, ys+ys/2, 0.0, ys);
    vertex(0, ys);
    bezierVertex(-ys/2, ys, -ys/2, 0.0, 0.0, 0.0);
    vertex(0, 0);
    endShape();
    translate(-xr, -yr);

    //move the clouds to the right including a bit of random noise to make things more interesting
    cloudPosX[i]=(cloudPosX[i]+cloudDirection*random(0.85, 1.15)*cloudSpeed)%(width+10);
    cloudPosY[i]+=random(-1, 1)*0.5;
    //vary the cloud size a bit to give the impression of cloud evolution
    float maxv, minv;
    if (cloudSize[i]<250.0) {
      maxv=1.0;
    } else {
      maxv=0.0;
    }
    if (cloudSize[i]>50.0) {
      minv=-1.0;
    } else {
      minv=0.0;
    }
    cloudSize[i]*=(random(minv, maxv)*0.05+1.0);
  }
}

//draw different types of hats
void drawHat(int man) {
  //check the current colour
  fill(rainbowColours[hatColour[man]]);
  stroke(#000000);
  strokeWeight(3);
  
  //set the coordinates position based on the stick man's position
  float x=manPositionX[man]+0.15*headLength;
  float y=manPositionY[man]-backLength-headLength;
  
  //simple bobble hat
  if (hatType[man]==1) {
    //size/shape parameters
    float hatWidth=headLength*0.45;
    float hatHeight=hatWidth*0.45;
    float hatCurve=0.3*hatWidth;
    //shift the shape to the correct location
    translate(x, y);
    //draw the main part of the hat
    beginShape();
    vertex(-hatWidth, 0);
    vertex(hatWidth, 0);
    bezierVertex(hatWidth+hatCurve, 0, hatWidth+hatCurve, hatHeight, hatWidth, hatHeight);
    vertex(-hatWidth, hatHeight);
    bezierVertex(-hatWidth-hatCurve, hatHeight, -hatWidth-hatCurve, 0, -hatWidth, 0);
    vertex(-hatWidth, 0);
    vertex(-hatWidth+hatWidth/6, 0);
    bezierVertex(-hatWidth+hatWidth/6, -2*hatHeight, hatWidth-hatWidth/6, -2*hatHeight, hatWidth-hatWidth/6, 0);
    vertex(hatWidth-hatWidth/6, 0);
    endShape();
    //get the second hat colour for the bobble
    fill(rainbowColours[hatColour2[man]]);
    ellipse(0, -2*hatHeight*0.85, hatWidth*0.4, hatWidth*0.4);
    //return to previous coordinates
    translate(-x, -y);
  }
  
  //top hat
  else if (hatType[man]==2) {
    //size/shape parameters
    float hatWidth=headLength*0.45;
    float hatHeight=hatWidth*0.45;
    float hatCurve=0.3*hatWidth;
    //shift the shape to the correct location
    translate(x, y);
    beginShape();
    vertex(-hatWidth, 0);
    vertex(hatWidth, 0);
    bezierVertex(hatWidth+hatCurve, 0, hatWidth+hatCurve, hatHeight, hatWidth, hatHeight);
    vertex(-hatWidth, hatHeight);
    bezierVertex(-hatWidth-hatCurve, hatHeight, -hatWidth-hatCurve, 0, -hatWidth, 0);
    vertex(-hatWidth, 0);
    vertex(-hatWidth+hatWidth/6, 0);
    vertex(-hatWidth+hatWidth/6, -3*hatHeight);
    vertex(hatWidth-hatWidth/6, -3*hatHeight);
    vertex(hatWidth-hatWidth/6, 0);
    endShape();
    //return to previous coordinates
    translate(-x, -y);
  }
  
  //Santa hat
  else if (hatType[man]==3) {
    //size/shape parameters
    float hatWidth=headLength*0.45;
    float hatHeight=hatWidth*0.45;
    float hatCurve=0.3*hatWidth;
    //shift the shape to the correct location
    translate(x, y);
    beginShape();
    vertex(-hatWidth+hatWidth/6, 0);
    bezierVertex(-hatWidth+hatWidth/6, 0, -hatWidth/5, -3*hatHeight, hatWidth/2, -3*hatHeight);
    vertex(hatWidth/2, -3*hatHeight);
    bezierVertex(hatWidth/2, -3*hatHeight, 0, 0, hatWidth-hatWidth/6, 0);
    vertex(hatWidth-hatWidth/6, 0);
    endShape();
    //get the second hat colour for the bobble and bottom strip
    fill(rainbowColours[hatColour2[man]]);
    beginShape();
    vertex(-hatWidth, 0);
    vertex(hatWidth, 0);
    bezierVertex(hatWidth+hatCurve, 0, hatWidth+hatCurve, hatHeight, hatWidth, hatHeight);
    vertex(-hatWidth, hatHeight);
    bezierVertex(-hatWidth-hatCurve, hatHeight, -hatWidth-hatCurve, 0, -hatWidth, 0);
    vertex(-hatWidth, 0);
    endShape();
    ellipse(hatWidth/2, -3*hatHeight, hatWidth*0.4, hatWidth*0.4);
    //return to previous coordinates
    translate(-x, -y);
  }
  
  //baseball cap
  else if (hatType[man]==4) {
    //size/shape parameters
    float hatWidth=headLength*0.45;
    float hatHeight=hatWidth*0.3;
    float hatCurve=0.18*hatWidth;
    y+=hatHeight*0.5;
    //shift the shape to the correct location
    translate(x, y);
    beginShape();
    vertex(-hatWidth, 0);
    vertex(hatWidth, 0);
    bezierVertex(hatWidth+hatCurve, 0, 1.5*hatWidth+hatCurve, hatHeight, 1.5*hatWidth, hatHeight);
    vertex(-hatWidth, hatHeight);
    bezierVertex(-hatWidth-hatCurve, hatHeight, -hatWidth-hatCurve, 0, -hatWidth, 0);
    vertex(-hatWidth, 0);
    vertex(-hatWidth, 0);
    bezierVertex(-hatWidth, -3*hatHeight, hatWidth, -3*hatHeight, hatWidth, 0);
    vertex(hatWidth, 0);
    endShape();
    //return to previous coordinates
    translate(-x, -y);
  }
}

//draw stick man
void drawMan(int man) {
  //set the thickness and approximate skin tone
  strokeWeight(6);  
  stroke(#000000);
  fill(#EEBB99);
  
  //left leg and foot
  //initialize some variables
  float[] xls = new float[3];
  float[] yls = new float[3];
  float[] xlt = new float[3];
  float[] ylt = new float[3];
  float[] xlf = new float[3];
  float[] ylf = new float[3];
  xlt[1]=manPositionX[man];
  ylt[1]=manPositionY[man];
  boolean leftFootOnGround=false;  
  //the current angles from the global parameters are used to calculate the start and ending line points
  drawLeg(shinAngleLeft[man], thighAngleLeft[man], shinLength, thighLength, footLength, leftFootOnGround, xlt, ylt, xls, yls, xlf, ylf);
  //draw the thigh, shin and foot using calculated start/end points
  line(xlt[1], ylt[1], xlt[2], ylt[2]);
  line(xls[1], yls[1], xls[2], yls[2]);
  line(xlf[1], ylf[1], xlf[2], ylf[2]);

  //right leg and foot
 //initialize some variables 
  float[] xrs = new float[3];
  float[] yrs = new float[3];
  float[] xrt = new float[3];
  float[] yrt = new float[3];
  float[] xrf = new float[3];
  float[] yrf = new float[3];
  xrt[1]=manPositionX[man];
  yrt[1]=manPositionY[man];
  boolean rightFootOnGround=false;
  //the current angles from the global parameters are used to calculate the start and ending line points
  drawLeg(shinAngleRight[man], thighAngleRight[man], shinLength, thighLength, footLength, rightFootOnGround, xrt, yrt, xrs, yrs, xrf, yrf);
  //draw the thigh, shin and foot using calculated start/end points
  line(xrt[1], yrt[1], xrt[2], yrt[2]);
  line(xrs[1], yrs[1], xrs[2], yrs[2]);
  line(xrf[1], yrf[1], xrf[2], yrf[2]);

  //body
  //this is more straightforward than the legs, as the body angle doesn't change
  float[] xb = new float[3];
  float[] yb = new float[3];
  xb[2]=xlt[1];
  yb[2]=ylt[1];
  xb[1]=xb[2]+backLength*sin(backAngle);
  yb[1]=yb[2]-backLength*cos(backAngle);
  line(xb[1], yb[1], xb[2], yb[2]);

  //head
  //this is also more straightforward
  float xh, yh;
  xh=xb[1];
  yh=yb[1]-headLength/2;
  ellipse(xh, yh, headLength, headLength); 

  //left arm and hand
  //initialize some variables
  float[] xlla = new float[3];
  float[] ylla = new float[3];
  float[] xlua = new float[3];
  float[] ylua = new float[3];
  float[] xlh = new float[3];
  float[] ylh = new float[3];
  xlua[1]=xb[1]+(xb[2]-xb[1])*0.2;
  ylua[1]=yb[1]+(yb[2]-yb[1])*0.2;
  //the current angles from the global parameters are used to calculate the start and ending line points
  drawArm(lowerArmAngleLeft[man], upperArmAngleLeft[man], lowerArmLength, upperArmLength, handLength, xlua, ylua, xlla, ylla, xlh, ylh);
  //draw the upper arm, lower arm and hand using calculated start/end points
  line(xlua[1], ylua[1], xlua[2], ylua[2]);
  line(xlla[1], ylla[1], xlla[2], ylla[2]);
  line(xlh[1], ylh[1], xlh[2], ylh[2]);

  //right arm and hand
  //initialize some variables
  float[] xrla = new float[3];
  float[] yrla = new float[3];
  float[] xrua = new float[3];
  float[] yrua = new float[3];
  float[] xrh = new float[3];
  float[] yrh = new float[3];
  xrua[1]=xb[1]+(xb[2]-xb[1])*0.2;
  yrua[1]=yb[1]+(yb[2]-yb[1])*0.2; 
  //the current angles from the global parameters are used to calculate the start and ending line points
  drawArm(lowerArmAngleRight[man], upperArmAngleRight[man], lowerArmLength, upperArmLength, handLength, xrua, yrua, xrla, yrla, xrh, yrh);
  //draw the upper arm, lower arm and hand using calculated start/end points
  line(xrua[1], yrua[1], xrua[2], yrua[2]);
  line(xrla[1], yrla[1], xrla[2], yrla[2]);
  line(xrh[1], yrh[1], xrh[2], yrh[2]);
}

//routine to calculate the starting and ending points of the upper and lower arm and hand
//this is based on the length, current angles and position of the stick man
void drawArm(float lowerArmAngle, float upperArmAngle, float lowerArmLength, float upperArmLength, float handLength, float xua[], float yua[], float xla[], float yla[], float xh[], float yh[]) {
  xua[2]=xua[1]+upperArmLength*sin(upperArmAngle);
  yua[2]=yua[1]+upperArmLength*cos(upperArmAngle);
  xla[1]=xua[2];
  yla[1]=yua[2];
  xla[2]=xla[1]+lowerArmLength*sin(lowerArmAngle);
  yla[2]=yla[1]+lowerArmLength*cos(lowerArmAngle);  
  xh[1]=xla[2];
  yh[1]=yla[2];
  xh[2]=xh[1]+handLength*cos(lowerArmAngle);
  yh[2]=yh[1]-handLength*sin(lowerArmAngle);
}

//routine to calculate the starting and ending points of the shin, thigh and foot
//this is based on the length, current angles and position of the stick man
void drawLeg(float shinAngle, float thighAngle, float shinLength, float thighLength, float footLength, boolean footOnGround, float xt[], float yt[], float xs[], float ys[], float xf[], float yf[]) {
  xt[2]=xt[1]+thighLength*sin(thighAngle);
  yt[2]=yt[1]+thighLength*cos(thighAngle);
  xs[1]=xt[2];
  ys[1]=yt[2];
  xs[2]=xs[1]+shinLength*sin(shinAngle);
  ys[2]=ys[1]+shinLength*cos(shinAngle);  
  xf[1]=xs[2];
  yf[1]=ys[2];
  if (footOnGround) {
    xf[2]=xf[1]+footLength;
    yf[2]=yf[1];
  } else {
    xf[2]=xf[1]+footLength*cos(shinAngle);
    yf[2]=yf[1]-footLength*sin(shinAngle);
  }
}

//make the stick man walk
//this is the most complicated function, and could still be improved further to make it more 'realistic'
//if it seems a bit cryptic it's because the parameters were found by hand based on drawings
void walkMan(int man) {
  //add a tolerance to allow for speeds which don't exactly fit between the upper and lower limits
  //otherwise the limbs get out of synch
  float tol=walkingSpeed[man]*0.02;
  //shift the overall x position, checking to see if it looped round to the other side
  manPositionX[man]+=(walkingSpeed[man]*40.0);
  manPositionX[man]=int(manPositionX[man])%width;
  
  //left side of body
  //change the arm and leg angles using the walking speed
  thighAngleLeft[man]+=thighSignLeft[man]*walkingSpeed[man];
  shinAngleLeft[man]+=shinSignLeft[man]*walkingSpeed[man]*0.5;
  upperArmAngleLeft[man]+=upperArmSignLeft[man]*walkingSpeed[man]*0.7;
  lowerArmAngleLeft[man]+=lowerArmSignLeft[man]*walkingSpeed[man]*1.4;
  //check to see if the legs have reached the peak point in either direction and flip the sign when this occurs
  if (thighAngleLeft[man] > PI/2.5-tol) {
    thighSignLeft[man]=-1;
    shinSignLeft[man]=-1;
    upperArmSignLeft[man]=-1;
    lowerArmSignLeft[man]=-1;
  }
  if (thighAngleLeft[man] < -PI/3.5+tol) {
    thighSignLeft[man]=1;
    shinSignLeft[man]=1;
    upperArmSignLeft[man]=1;
    lowerArmSignLeft[man]=1;
  }

  //right side of body
  //change the arm and leg angles using the walking speed
  thighAngleRight[man]+=thighSignRight[man]*walkingSpeed[man];
  shinAngleRight[man]+=shinSignRight[man]*walkingSpeed[man]*0.5;
  upperArmAngleRight[man]+=upperArmSignRight[man]*walkingSpeed[man]*0.7;
  lowerArmAngleRight[man]+=lowerArmSignRight[man]*walkingSpeed[man]*1.4;
  //check to see if the legs have reached the peak point in either direction and flip the sign when this occurs
  if (thighAngleRight[man] > PI/2.5-tol) {
    thighSignRight[man]=-1;
    shinSignRight[man]=-1;
    upperArmSignRight[man]=-1;
    lowerArmSignRight[man]=-1;
  }
  if (thighAngleRight[man] < -PI/3.5+tol) {
    thighSignRight[man]=1;
    shinSignRight[man]=1;
    upperArmSignRight[man]=1;
    lowerArmSignRight[man]=1;
  }
}



