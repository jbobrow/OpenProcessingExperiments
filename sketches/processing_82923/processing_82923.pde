
float [] xPos = new float[0]; 
float [] yPos = new float[0]; 
float [] xVel = new float[0]; 
float [] yVel = new float[0]; 
float [] parSize = new float[0];
float gravity;
float ePosY = 350;
float ePosX = 635;
float ellipseD = 580;
PImage Snowman;
float xVelNum = 1;
int sliderA=11;int sliderB=60;int slider=11;

float [] rectX = {
  611, 587, 553, 563, 577, 542,704,715,726,737,750
};
float []rectY = {
  232, 280, 357, 364, 372, 352,377,370,362,356,351
};
float []rectW = {
  70, 120, 10, 10, 10, 10,10,10,10,10,10
};
float []rectH = {
  50, 10, 10, 10, 10, 10,10,10,10,10,10
};


void setup() {
  size(1020, 720);
  Snowman = loadImage("Snowman3.jpg");
}

void draw() { 
  noStroke();
  image(Snowman, 0, 0);
  //background(0);
  fill(255, 255, 255, 20);
  gravity = sliderB*0.002;
  //gravity = mouseY/100;
  xPos = append(xPos, random(ePosX-100, ePosX+100));
  yPos = append(yPos, ePosY-240 );
  xVel = append(xVel, random(-xVelNum, xVelNum));
  yVel = append(yVel, random(-1, 1));
  parSize = append(parSize, random(2, slider));

  for (int i = 0; i<xPos.length;i++) { 
    ellipse(xPos[i], yPos[i], parSize[i], parSize[i]);
    xPos[i]+=xVel[i];
    yPos[i]+=yVel[i];
    //parSize[i]*=-sliderA;
    yVel[i]+=gravity;

    if (dist(xPos[i], yPos[i], ePosX, ePosY)>287-parSize[i]) {
      xVel[i]*=-sliderA*0.01; 
      yVel[i]*=-sliderA*0.01;
    }
    
    if (dist(xPos[i],yPos[i],ePosX,ePosY)>300){
      xPos[i]=ePosX-190;
      yPos[i]=ePosY-160;
    }
    
      for (int ii=0;ii<rectX.length;ii++) {
      if ((yPos[i]>rectY[ii])&&
        (yPos[i]<rectY[ii]+rectH[ii])&&
        (xPos[i]>rectX[ii])&&
        (xPos[i]<rectX[ii]+rectW[ii])
        ) {
        yVel[i]*=-0.1;
      }
     fill(240,0);
      rect(rectX[ii], rectY[ii], rectW[ii], rectH[ii]);
      fill(240, 25);
    }    
     if((mousePressed)&&
     (dist(mouseX, mouseY, ePosX, ePosY)<287)){
     xPos[i]=mouseX;
     yPos[i]=mouseY; 
      }
  }
  if (xPos.length>800) {
    xPos = subset(xPos, 1) ;
    yPos = subset(yPos, 1) ;
    xVel = subset(xVel, 1) ;
    yVel = subset(yVel, 1) ;
    parSize = subset(parSize, 1);
  }    
  fill(255, 0);
  ellipse(ePosX, ePosY, ellipseD, ellipseD);
//Slider
  fill(0,23);
  rect(10,20,100,10);
  fill(255);
  rect(slider,20,10,10);
  if((mousePressed)&&
  (mouseY>10)&&
  (mouseY<30)){
  slider = constrain(mouseX,10,110);
  }
  text("Snow Size",50,10);
  text(slider-10,20,10);
   //SliderA
  fill(0,23);
  rect(10,50,100,10);
  fill(255);
  rect(sliderA,50,10,10);
  if((mousePressed)&&
  (mouseY>50)&&
  (mouseY<60)){
  sliderA = constrain(mouseX,10,110);
  }
  text("Snow Bounce",50,42);
  text(sliderA-10,10,42);
   //SliderB
  fill(0,23);
  rect(10,80,100,10);
  fill(255);
  rect(sliderB,80,10,10);
  if((mousePressed)&&
  (mouseY>80)&&
  (mouseY<90)){
  sliderB = constrain(mouseX,10,110);
  }
  text("Gravity",50,78);
  text(sliderB-60,10,78);

 // println("X " + mouseX + " Y " + mouseY);
  
}






