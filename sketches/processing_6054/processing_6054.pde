
class Robot {
  float bodyX = 90.0;
  float bodyY = 151.0;
  float bodyWidth = 86.0;
  float bodyHeight = 176.0;

  float coloroffset; // change the color of r2
  float targetX; //easing variables
  float targetY; 
  float easing = 0.05; // Numbers 0.0 to 1.0

  float rx = random(-2,2); // ear
  float ry = random(-2,2); // motor 1
  float rt = random(-2,2); // motor 2
  float rh = random(-2,2); // motor 3
  float heartY = -50; 
  float heartSpeed = random(5,10); // this is how you add different speeds (times)
  float heartoffset = random(1000,6000); // heart time and speed random, 6000 = seconds sab.
//  float fireshootY = -50;

  PImage heart; 
  PImage visor1;
  PImage lazer;
  PImage nogun;
//  PImage fireshoot;
  // constructor
  Robot (float e, float cOff) { 

    visor1 = loadImage("visor1.png");
    lazer = loadImage("lazer.png");
    nogun = loadImage("nogun.png");
    heart = loadImage("heart.png");
//    fireshoot = loadImage("fireshoot.png");
    easing = e;
    coloroffset = cOff;

  }
  // methods || functions

  void update(float x, float y){

    float targetX = x;
    float targetY = y;
    bodyX += (targetX - bodyX) * easing;
    bodyY += (targetY - bodyY) * easing;

    drawB(); // ellipse body
    drawH(bodyX, bodyY); // ellipse head
    drawV(bodyX, bodyY); // visor rect
    drawE(bodyX, bodyY); // ellipse ear
    drawMm(bodyX,bodyY); // ellipse motor1
    drawMmm(bodyX,bodyY); // ellipse motor2
    drawMmmm(bodyX,bodyY); // ellipse motor2

  }

  void drawHeart(){ // body

    if (millis() >= heartoffset){  // heart speed

      heartY = heartY - heartSpeed;
      if (heartY <= -500){
        heartY = -100;                 //

      } 
      image(heart,bodyX,bodyY+heartY);  // actual heart

    }

  }

  void drawB(){ // body

    fill(coloroffset - mouseX, mouseY,255);
    stroke(0);
    strokeWeight(5);
    ellipse (bodyX,bodyY,bodyWidth,bodyHeight);

  }

  void drawH(float bodyX, float bodyY){ // head

    fill(255);
    stroke(0);
    strokeWeight(5);
    ellipse (bodyX - 3, bodyY - 59, bodyWidth + 64, bodyHeight - 51);

  }

  void drawE(float bodyX, float bodyY){ // ear

    fill(255);
    stroke(0);
    strokeWeight(4);
    float rx = random(-2,2);
    ellipse(bodyX - 65 + rx, bodyY - 59, bodyWidth - 62, bodyHeight - 151);

  }

  void drawV(float bodyX, float bodyY){ // visor

    fill(0);
    rect(bodyX - 38, bodyY-69, bodyWidth +34, bodyHeight - 134);

  }
  void drawMm(float bodyX, float bodyY){ // motor1
    frameRate(40);

    fill(0);
    strokeWeight(2);
    float ry = random(-2,2);
    ellipse(bodyX -1 + ry ,bodyY +95 ,26,4);

  }

  void drawMmm(float bodyX, float bodyY){ // motor2
    frameRate(40);
    fill(0);
    strokeWeight(2);
    ellipse(bodyX -1 + rt,bodyY +101 ,20,4);
    float rh = random(-2,2);

  }

  void drawMmmm(float bodyX, float bodyY){ // motor3
    frameRate(40);

    fill(0);
    strokeWeight(2);
    float rh = random(-2,2);
    ellipse(bodyX -1 +rh ,bodyY +107 ,14,4);


    // visor change
    if(vector == true) {
      image(visor1, bodyX - 38, bodyY-69, bodyWidth +34, bodyHeight - 134);
      image(lazer ,bodyX -31 , bodyY + 7, bodyWidth - 18, bodyHeight - 138);

    }

    if(vector == false) {
      drawHeart ();
      image(nogun ,bodyX -31 , bodyY + 7, bodyWidth - 58, bodyHeight - 108);

    }
  }
}



