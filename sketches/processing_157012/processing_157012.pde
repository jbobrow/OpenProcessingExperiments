
//letters bouncing

PImage img;
int numObj=20;

float[] bubbleH = new float[numObj];
float[] bubbleW = new float[numObj];
float[] posX = new float[numObj];
float[] posY  = new float[numObj];
float[] hue = new float[numObj];
float[] speedX = new float[numObj];
float[] speedY= new float[numObj];
Boolean[] isMoving = new Boolean[numObj];

float gravity;

void setup() {
  size(600, 600);
  colorMode(HSB);
  img = loadImage("pop.png");

  for (int i=0; i<numObj; i++) {
    bubbleW[i] = bubbleH[i]=random(30, 120);
    posX[i] = random(width);
    posY[i] = random(height-100);
    hue[i]=random(120, 173);
    speedY[i]=0;
    speedX[i]=0;
    isMoving[i]= false;
  }
  //hasGravity = false;
  gravity = -0.02;
}

void draw() {
  background(255);

  for (int i=0; i<numObj; i++) {
    float distance = dist(mouseX, mouseY, posX[i], posY[i]);
    //println(distance);

    noStroke();
    if (distance<bubbleH[i]/2 && !isMoving[i]) {
      fill(hue[i], 150, 255, 40);
      isMoving[i]=true;
      speedX[i]=(mouseX-pmouseX)/100;
      // hasGravity=true;
    } else {
      fill(hue[i], 255, 255, 40);
      //    hasGravity=false;
    }

    strokeWeight(2);
    stroke(255);
    ellipse(posX[i], posY[i], bubbleW[i], bubbleH[i]);
    //println(bubbleW[i]);


    if (isMoving[i]) {
      posX[i]=posX[i]+speedX[i];
      posY[i]=posY[i]+speedY[i];
      speedY[i]=speedY[i]+gravity;
    }

    if (posX[i]>width) {
      posX[i]=width;
      speedX[i]=speedX[i]*-0.8;
    }

    if (posX[i]<0) {
      posX[i]=0;
      speedX[i]=speedX[i]*-0.8;
    }

    if (posY[i]>height-bubbleH[i]/2) {
      posY[i]=height-bubbleH[i]/2;
      speedY[i]=speedY[i]*-0.8;
      if (abs(speedY[i])<3) {
        speedY[i]=0;
      }
    }

    float myDist = dist(posX[i], posY[i], mouseX, mouseY);
    float bubW = bubbleW[i];
    //println(bubbleW[i]);
    if (mousePressed) { 
      if (myDist < bubW) {
        bubbleW[i]=bubbleW[i]-bubbleW[i];
        bubbleH[i]=bubbleH[i]-bubbleH[i];
        
        image(img,posX[i],posY[i]);
        
        
//        println(bubbleW[i]);
      }
    }


    //    for (int j=0; j<numObj; j++) {
    //
    //      if (i !=j) {
    //        if (dist(posX[i], posY[i], posX[j], posY[j])< (size[i]+size[j])/2) {
    //          posX[i]=posX[i]-speedX[i]*2;
    //          posY[i]=posY[i]-speedY[i]*2;
    //          speedX[i]=speedX[i]*-0.8;
    //          speedY[i]=speedY[i]*-0.8;
    //
    //          posX[j]=posX[j]-speedX[j]*2;
    //          posY[j]=posY[j]-speedY[j]*2;
    //          speedX[j]=speedX[j]*-0.8;
    //          speedY[j]=speedY[j]*-0.8;
    //        }
    //      }
    //    }


    //  if (hasGravity) {
    //    posY[i]=posY[i]+speedY[i];
    //    speedY[i]=speedY[i]+gravity;
    //  }
  }
}
void delay(int delay)
{
  int time = millis();
  while(millis() - time <= delay);
}



