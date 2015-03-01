
import ddf.minim.*;

// this sketch shows a modern version of babel tower. The artist statement is on the web 

PImage mouthPic;
PImage babelPic;
PImage atomicPic;

// frameRate
int fR = 30;

// foodItem
int maxFoodItems = 6;
String[] foodItemNames = {"frites.png", "hamburger.png", "makis.png", "pilon.png", "pizza.png", "sushis.png"};
PImage[] foodItemPic = new PImage[maxFoodItems];
float[] fIX = new float[maxFoodItems]; // location on screen 
float[] fIY = new float[maxFoodItems]; 
float[] fISX = new float[maxFoodItems]; // speed
float[] fISY = new float[maxFoodItems]; 
float[] fISize = new float[maxFoodItems];

// beams from mouth to babel tower
int maxBeams = 15;
float[] beamX = new float[maxBeams];
float[] beamY = new float[maxBeams];
float[] beamWidth = new float[maxBeams];
int[] beamLife = new int[maxBeams];

int sceneW = 1200;
int sceneH = 1000;

float babelSize = 1.0;

Minim minim;
AudioSample thunder1, thunder2, mmm;
AudioSample atomic;

void setup() {
  size(800,667); //sceneW * 1 / 2, sceneH * 1 / 2);
  // loading pictures
  mouthPic = loadImage("bouche.png");
  babelPic = loadImage("babel.png");
  for(int i = 0; i < maxFoodItems; i++){
    foodItemPic[i] = loadImage(foodItemNames[i]);
    fISize[i] = 0.0;
  }
  atomicPic = loadImage("atomic.jpg");
  // setting beam life
  for (int i = 0; i < maxBeams; i++) {
    beamLife[i] = 0;
  }

  // initialise smoothness and speed
  frameRate(fR);
  
  // load sound samples
  minim = new Minim(this);
  thunder1 = minim.loadSample("th1.mp3"); 
  thunder1.setGain(-0);
  thunder2 = minim.loadSample("th2.mp3"); 
  thunder2.setGain(-0);
  mmm = minim.loadSample("mmm.mp3");
  atomic = minim.loadSample("atomic.mp3");
}

void draw() {
  // explosion and no more if babel tower is to big
  if( babelSize >= 26.0){
    background(random(255), random(255), random(255));
    if(random(1.0) > .7) {
      imageMode(CENTER);
      image(atomicPic, width / 2, height / 2);
    }
    fill(0); 
    if(babelSize > 126) text("click to restart", mouseX, mouseY);
    if(mousePressed && babelSize > 126) babelSize = 1.0;
    if(babelSize == 27.0) atomic.trigger(); // play explosion sample once
    babelSize += 1.0;
    return; // don't draw anything else
  }
  // normal stuff
  background(255);
  colorMode(HSB, 100, 100, 100);
  fill(frameCount % 100, 50, frameCount % 25 + 75);
  textAlign(CENTER);
  text("type 3 to make it smoother and faster,\n type 1 to make it slower and less smooth,\n click to feed this mouth", mouseX, mouseY + 20);
  colorMode(RGB, 255);
  // general scale
  pushMatrix();
  scale(.6666667);
  noFill();
  stroke(0);
  strokeWeight(3);
  rect(0, 0, 1200, 1000);
  // set mouth center
  float mouthX = 250;
  float mouthY = 236;

  // draw pulsing mouth 
  pushMatrix();
  //float mouthScale = pow(sin((frameCount%150)/150.0*2*PI+PI/6),2)*.25+.5;
  float mouthScale = pow(sin(frameCount/150.0*2*PI+PI/6), 2)*.25+.5;
  scale(mouthScale);
  imageMode(CENTER);
  image(mouthPic, mouthX, mouthY);
  popMatrix();

  // compute mouth center
  mouthX = mouthX * mouthScale;
  mouthY = mouthY * mouthScale;
  // draw beams 
  for (int i = 0; i < maxBeams; i++) {
    if (beamLife[i] <= 0) { // this beam is dead, let see if we pop it up
      if (random(1.0) > .991) {
        beamX[i] = sceneW + random(-sceneW / 5, sceneW / 5);
        beamY[i] = sceneH + random(-sceneH / 2, sceneH / 2);
        beamWidth[i] = sceneH / 75 + random(sceneH / 75);
        beamLife[i] = (int)random(frameRate*3.0);
        if (random(1.0)>.97) thunder1.trigger();
        if (random(1.0)>.97) thunder2.trigger();
      }
    } else { // this beam is visible let draw it and let this life getting down
      fill(128);
      noStroke();
      pushMatrix();
      translate(mouthX, mouthY);
      rotate(PI/5);
      triangle(0, 0, 
               sceneW * 1.2, beamY[i] - sceneH + beamWidth[i], 
               sceneW * 1.2, beamY[i] - sceneH - beamWidth[i]);
      popMatrix();
      beamLife[i]--;
    }
  }

  // food items
  for(int i = 0; i < maxFoodItems; i++){
    if(fISize[i] <= 0.0){ // if foodItem is invisible we set new one
      if(random(1.0) > .999 || mousePressed){
        fIX[i] = mouseX / .5; fIY[i] = mouseY / .5;
        fISX[i] = random(-100.0, 100.0); fISY[i] = random(-100.0, 100.0);
        fISize[i] = 1.0;
      }
    }
    else{ // if it is visible we make it life
      // going to the mouth
      float dX = mouthX - fIX[i], dY = mouthY - fIY[i];
      fISX[i] += dX * .01 - fISX[i] * .1; // acceleration toward mouth and reduction of speed to make the   
      fISY[i] += dY * .01 - fISY[i] * .1; // food going into mouth and avoid orbital effect
      fIX[i] += fISX[i]; fIY[i] += fISY[i];
      // size is proportional with the distance to the mouth
      fISize[i] = (abs(mouthX - fIX[i]) + abs(mouthY - fIY[i])) / 1000.0;
      // displaying it
      pushMatrix();
      translate(fIX[i], fIY[i]);
      scale(fISize[i]*2.0);
      imageMode(CENTER);
      image(foodItemPic[i], 0, 0);
      popMatrix();
      // if size is lesser than .1 then make it die
      if(fISize[i] < .05){ 
         fISize[i] = 0.0;
         mmm.trigger();
         babelSize += 1;
      };
      
    }
  }

  // draw babel tower
  pushMatrix();
  //translate(1002, 772);
  translate(sceneW, sceneH);
  translate(-babelPic.width * babelSize * .1, -babelPic.height * babelSize * .1);
  //rotate((frameCount%170)/170.0*2*PI);
  scale(babelSize*.1);
  imageMode(CORNER);
  image(babelPic, 0, 0);
  popMatrix();
  popMatrix();
}

void keyPressed(){
  if(key == '1' && fR > 5) fR--; if(key == '3' && fR < 60) fR++;
  frameRate(fR);
}

