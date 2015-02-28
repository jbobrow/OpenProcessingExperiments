
import penner.easing.*;
import gifAnimation.*;
import ddf.minim.*;
float diamG = 1.3;

AudioPlayer player;
Minim minim;



//Check the distance between two vectors
float checkDist(PVector a, PVector b) {
  float tempX, tempY, distOut;

  tempX = a.x - b.x;
  tempY = a.y - b.y;

  tempX = pow(tempX, 2);
  tempY = pow(tempY, 2);

  distOut = tempX + tempY;
  return sqrt(distOut);
}

//Get slope as normalized vector
PVector slope(PVector a, PVector b) {
  //a is CircCenter
  //b is MousePos

  PVector tempVec = PVector.sub(b, a);
  tempVec.normalize();

  return tempVec;
}

public class fogShape {
  PShape object;
  float diameter = diamG;
  PVector center, center_;
  float hOffset, target, time = 0;
  float tempC, lameRando;
  float fStep = 50;
  float duration = 140;
  float sWidth, sHeight;

  fogShape(PShape objectIn, float cXIn, float cYIn, float wIn, float hIn) {
    object = objectIn;
    center = new PVector(cXIn, cYIn);
    center_ = new PVector(cXIn, cYIn);
    target = center_.y + 50;
    tempC = cYIn;
    sWidth = wIn;
    sHeight = hIn;
  } 

  void drawObject(boolean Above) {
    float step = .12;
    PVector shapeToMouse, tempVec;
    float distance = 1;

    //Get offset value
    waveTranslate(center);

    //Set center we use to original center + offset
    center = new PVector(center_.x, hOffset);

    imageMode(CORNER);
    tint(255, 255, 255, 255);
    image(bg, 0, 0);
    shape(object, center.x, center.y, sWidth, sHeight);
    tint(255, 50);
    image(bg, 0, 0);
    PVector mouseVec = new PVector(mouseX, mouseY);
    shapeToMouse = slope(center, mouseVec);



    for (int x = 0; x < 10; x++) {
      tempVec = new PVector(shapeToMouse.x, shapeToMouse.y);
      tempVec.mult(diameter+(step*x));
      tempVec = PVector.add(center, tempVec);
      if (!transitioning) {
        shape(object, tempVec.x, tempVec.y, sWidth, sHeight);
        tint(255, 150);
        image(bg, 0, 0);
      }
      step += checkDist(center, mouseVec) * (x *.00005);
    }
  }

  void waveTranslate(PVector pos) {


    hOffset = Cubic.easeInOut(time, tempC, fStep, duration);


    if (time < duration - 10) {
      time ++;
    }
    else {
      fStep *= -1;
      fStep += random(-10, 10);
      duration = 120 + random(-30, 30);
      if (duration < 80 || duration > 180) {
        duration = 120;
      }
      tempC = center.y;
      time = 0;
    }
  }
}

public class uGif {
  int index, count = 0;

  PImage[] frames;
  uGif(PImage[] fIn) {
    frames = fIn;
  }

  void drawFrame() {
    tint(255, 100);
    image(frames[index], 0, fShip.hOffset + shScaleH/2.51, 800, height + 100);
    count ++;
    if (count> 30) {
      index ++;
      if (index > 9) {
        index = 0;
      }
      count = 0;
    }
  }
}


float shScaleH, shScaleW;
float tDur = 150;
float tTime = 0;
float waveOffset;
int count = 0;

PShape ship;
PImage bg, water;
PVector prevM;

boolean above = true;
boolean transitioning = false;

fogShape fShip;
uGif initGif;

void checkMPos() {


  //Going doooown
  if (above && !transitioning) {
    if (prevM.x == mouseX && prevM.y ==mouseY) {
      count ++;
    }
    else {
      count = 0;
    }
    if (count >35) {
      if (mouseY> fShip.hOffset + shScaleH/2.51) {
        above = false;
        transitioning = true;
      }
      count = 0;
    }
  }


  //Going uuuuuup (ostensibly)
  if (!above && ! transitioning) {

    if (prevM.x == mouseX && prevM.y ==mouseY) {
      println("HEY2");
      count ++;
    }
    else {
      count = 0;
    }
    if (count >35) {
      if (mouseY< fShip.hOffset + shScaleH/2.51 - 400) {
        above = true;
        transitioning = true;
      }
      count = 0;
    }
  }
}

void stopP()
{
  player.close();
  minim.stop();
  
}

void setup() {
  size(690, 700); 
  noStroke();

  bg = loadImage("bgA.png");
  water = loadImage("water.png");
  ship = loadShape("ship.svg");

  shapeMode(CENTER);
  rectMode(CENTER);

  tint(255, 255, 255, 100);

  prevM = new PVector(mouseX, mouseY);

  shScaleW = ship.width/3;
  shScaleH = ship.height/3;

  fShip = new fogShape(ship, width/2, height/2, shScaleW, shScaleH );
  initGif = new uGif(Gif.getPImages(this, "ocean.gif"));

  minim = new Minim(this);
  player = minim.loadFile("waves.mp3", 2048);
  player.play();
}

void draw() {
  background(0);

  checkMPos();

  if (above && !transitioning) {
    fShip.drawObject(above);
   
    tint(255, 255);
    image(water, 0, fShip.hOffset + shScaleH/2.51, 800, height + 100);
    initGif.drawFrame();

    prevM = new PVector(mouseX, mouseY);
  }

  else if (!above && transitioning) {
    translate(0, Sine.easeOut(tTime, 0, -400, tDur));

    fShip.drawObject(above);  

    tint(255, 255);
    image(water, 0, fShip.hOffset + shScaleH/2.51, 800, height + 100);
    initGif.drawFrame();
    if (tTime < tDur) {
      tTime++;
    }
    else {
      tTime = 0;

      transitioning = false;
      
      stopP();
      player = minim.loadFile("underwater.mp3", 2048);
      player.play();
    }
  }
  else if (!above && !transitioning) {
    translate(0, -400);

    fShip.drawObject(above);  

    tint(255, 255);
    image(water, 0, fShip.hOffset + shScaleH/2.51, 800, height + 100);
    initGif.drawFrame();
    prevM = new PVector(mouseX, mouseY);
  }

  else if (above && transitioning) {
    translate(0, Sine.easeOut(tTime, -400, 400, tDur));

    fShip.drawObject(above);  

    tint(255, 255);
    image(water, 0, fShip.hOffset + shScaleH/2.51, 800, height + 100);
    initGif.drawFrame();
    if (tTime < tDur) {
      tTime++;
    }
    else {
      tTime = 0;

      transitioning = false;

      stopP();
      player = minim.loadFile("waves.mp3", 2048);
      player.play();
    }
    prevM = new PVector(mouseX, mouseY);
  }
}



