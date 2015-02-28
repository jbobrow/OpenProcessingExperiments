
int ball=20;

float[] xPos= new float[ball];  //X PO\osition
float[] yPos=new float[ball];  //Y Position
float[] speed=new float[ball];  //speed on x
float[] radius=new float[ball];  //radius
float[] speedy= new float[ball];   //speed on y
float gravity; //set number for gravity
boolean picswitch;
boolean herewego;
PImage furby;
PImage elmo;

void setup() {
  size(600, 600);
  picswitch=true;
  furby=loadImage("furby.jpg");
  elmo=loadImage("elmo.jpg");
  elmo.resize(50, 50);
  herewego=true;

  if (picswitch==true) {
    for (int i=0;i<ball;i++) {
      xPos[i]=int(random(500)); //initial x postion
      yPos[i]=int(random(500));  // initial y position
      radius[i]=int(random(50)); //defined radius
      speed[i]=int(random(0, 10));  //random speed for x
      speedy[i]=int(random(0, 10));  //random speed for y
      gravity=.9; //set number for gravity
      fill(random(0, 255), random(0, 255), random(0, 255));
      ellipse(xPos[i], yPos[i], radius[i], radius[i]);
      //      furby.resize(50, 50);
    }
  }

  //  if (picswitch==false) {
  //    for (int i=0;i<ball;i++) {
  //      xPos[i]=int(random(500)); //initial x postion
  //      yPos[i]=int(random(500));  // initial y position
  //      radius[i]=int(random(50)); //defined radius
  //      speed[i]=int(random(0, 10));  //random speed for x
  //      speedy[i]=int(random(0, 10));  //random speed for y
  //      gravity=.9; //set number for gravity
  //      fill(random(0, 255), random(0, 255), random(0, 255));
  //      image(elmo, xPos[i], yPos[i]);
  //      elmo.resize(50, 50);
  //    }
  //  }
}

void draw() {
  background(255);
  if (picswitch==true) {
    for (int i=0;i<ball;i++) {
      //  fill(random(0,255),random(0,255),random(0,255));
      ellipse(xPos[i], yPos[i], radius[i], radius[i]);
      xPos[i]=xPos[i]+speed[i];

//      if (herewego==true) {
//        speedy[i]=speedy[i]+gravity;
//      }
//
//      if (herewego==false) {
//        speedy[i]=speedy[i]-gravity;
//      }

      if (xPos[i]>=width-radius[i]/2) {    //ball bounces off right wall
        speed[i]=speed[i]*-1;
      }
      if (xPos[i]<=0+radius[i]/2) {  //ball bounces off left wall
        speed[i]=speed[i]*-1;
      }
//      speedy[i]=speedy[i]+gravity;
      yPos[i]=yPos[i]+speedy[i];    //ball bounces off bottom
      if (yPos[i]>=height-radius[i]/2) {
        speedy[i]=speedy[i]*-0.95;
      }
      if (yPos[i]<=0+radius[i]/2) {   //ball bounces off top
        speedy[i]=speedy[i]*-1;
      }
      if ((yPos[i]>=height-radius[i]/2)&&(speedy[i]<=0)) {
        yPos[i]=height-radius[i]/2;
        xPos[i]-=speed[i];
      }

      if (yPos[i]>=height-radius[i]/2) {
        speed[i]=speed[i]*0.9;
      }
    }
    for (int i=0;i<ball;i++) {
      for (int j=(i+1);j<ball;j++) { 
          float distance=dist(xPos[i], yPos[i], xPos[j], yPos[j]);
          if (distance<=(radius[i]/2+radius[j]/2)) {
            speed[i]=speed[i]*-1;
            speedy[i]=speedy[i]*-1;
            speed[j]=speed[j]*-1;
            speedy[j]=speedy[j]*-1;
            xPos[i] += speed[i];
            yPos[i] += speedy[i];
          }
        
      }
    }
   
  }

  if (picswitch==false) { 
    for (int i=0;i<ball;i++) {
      //  fill(random(0,255),random(0,255),random(0,255));
      image(elmo, xPos[i], yPos[i]);
      xPos[i]=xPos[i]+speed[i];

      if (xPos[i]>=width-100/2) {    //ball bounces off right wall
        speed[i]=speed[i]*-1;
      }
      if (xPos[i]<=0+100/2) {  //ball bounces off left wall
        speed[i]=speed[i]*-1;
      }

      if (herewego==true) {
        speedy[i]=speedy[i]+gravity;
      }

      if (herewego==false) {
        speedy[i]=speedy[i]-gravity;
      }

      yPos[i]=yPos[i]+speedy[i];    //ball bounces off bottom
      if (yPos[i]>=height-100/2) {
        speedy[i]=speedy[i]*-0.95;
      }
      if (yPos[i]<=0+100/2) {   //ball bounces off top
        speedy[i]=speedy[i]*-0.95;
      }

      if (yPos[i]<=0) {
        yPos[i]=0;
      }


      if ((yPos[i]>=height-100/2)&&(speedy[i]<=0)) {
        yPos[i]=height-100/2;
        xPos[i]-=speed[i];
      }

      if (yPos[i]>=height-100/2) {
        speed[i]=speed[i]*0.9;
      }
      if (mouseX<xPos[i]-100 && mouseX>xPos[i]+100) {
        fill(255, 0, 0);
      }
      if (xPos[i]+50>=width) {
        xPos[i]=width-50;
      }

      if (xPos[i]<=0) {
        xPos[i]=0;
      }
    }
  }
  //  if (keyPressed==true) {
  //    picswitch=!picswitch;
  //  }

  if (keyPressed) {
    if (keyCode==UP) {
      herewego=!herewego;
    }
  }
}

void mouseClicked() {
  for (int i=0;i<ball;i++) {
    if (mouseX<width) {
      speed[i]=int(random(-20, 20));
      speedy[i]=int(random(0, 30));
    }
  }
}



