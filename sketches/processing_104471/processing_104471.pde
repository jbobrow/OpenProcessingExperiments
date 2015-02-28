
Maxim maxim;
AudioPlayer player;
AudioPlayer playerBreak;
AudioPlayer playerPress;
int BLOCKWIDTH = 64;
int PADDING = 24;
int[] seqX = new int[8];
int[] seqY = new int[8];
boolean seqActive = false;
boolean mouseActive = false;
boolean replayOn = true;
int startTime;
int bracketDigit = 1;
int currentStep = 0;
int currentLevel = 0;
int currentSys = 0;
int remaining = 30;
int warnAlpha = 255;
int[] startAlpha = {0,0,0};
int warnPos = 0;
PFont fontA;
PFont fontDefault;
int replayPos = 0;
int[][] seqLength = { {3,3,3,4,4}, {3,4,4,5,6}, {4,4,5,6,6}, {5,6,6,7,7} };
int[] allowableBlocks = {10,15,15,20};
int[][] sysBG = { {140,140,140}, {0,189,255}, {255, 175, 226}, {0, 0, 0} };
int[] currentBG = {140, 140, 140};
boolean gameOver = false;
boolean gameOverAnim = false;
boolean introOn = true;
boolean systemRecover = false;
boolean startScreen = true;
boolean winCondition = false;

class Block {
    int gridX, gridY;
    boolean blockUsed = false;
    boolean blockBreak = false;
    boolean blockActive = true;
    int[] currentColor = new int[4];
    int[] targetColor = new int[4];
    int m = 0;
    int alp = 255;
    
    Block(int gx, int gy) {
        gridX = gx;
        gridY = gy;
        currentColor[0] = 255;
        currentColor[1] = 255;
        currentColor[2] = 255;
        currentColor[3] = 255;
        targetColor[0] = 255;
        targetColor[1] = 255;
        targetColor[2] = 255;
        targetColor[3] = 255;
    }
    
    int positionX() {
        return 28 + (gridX) * BLOCKWIDTH + (PADDING * gridX);
    }
    
    int positionY() {
        return 180 + (gridY) * BLOCKWIDTH + (PADDING * gridY);
    }
    
    void handleHit(int x, int y) {
        // Handle things we want to do if the unit is hit
        if ((positionX() < x) && (x < positionX() + BLOCKWIDTH) && 
            (positionY() < y) && (y < positionY() + BLOCKWIDTH)) {
            makePretty();
            checkStep();
            //blockUsed = !blockUsed;
            //println("Block used = " + blockUsed);
        }
    }
    void checkStep() {
      if ((gridX == seqX[currentStep]) && (gridY == seqY[currentStep])){
        println("Correct Step" + currentStep);
        blocks[seqX[currentStep]][seqY[currentStep]].blockUsed = false;
        playerPress.cue(0);
        playerPress.play();
        if (currentStep == seqLength[currentSys][currentLevel] - 1) {
          currentLevel ++;
          replayOn = true;
          println("Level Correct, currentLevel =" + currentLevel);
          if (currentLevel == 5) {
            currentSys ++;
            currentLevel = 0;
            println("new system" + currentSys + " New Level" + currentLevel);
            systemRecover = true;
            if (currentSys == 4){
              winCondition = true;
              currentSys = 0;
            } 
          }
          levelSequence();
          startTime = millis();
          seqActive = true;
          currentStep = 0;
        } else {
          currentStep++;
        }
      } else {
        for (int i = currentStep; i < seqLength[currentSys][currentLevel]; i++) {
          blocks[seqX[i]][seqY[i]].blockBreak = true;
          blocks[seqX[i]][seqY[i]].blockActive = false;
          remaining--;
        }
        playerBreak.cue(0);
        playerBreak.play();
        levelSequence();
        startTime = millis();
        currentStep = 0;
        seqActive = true;
        replayOn = true;
        if (remaining < allowableBlocks[currentSys]) {
          seqActive = false;
          replayOn = false;
        }
      }
    }
    
    void makePretty() {
        targetColor[0] = 250;
        targetColor[1] = 250;
        targetColor[2] = 5;
        targetColor[3] = 255;
    }
    
    void recoverAnimation(){
      if (m < 32){
        quad(positionX() + 32 - m, positionY(), 
        positionX() + 32 - m, positionY() + BLOCKWIDTH,
        positionX() + BLOCKWIDTH - 32 + m, positionY() + BLOCKWIDTH -32 + m,
        positionX() + BLOCKWIDTH - 32 + m, positionY() + 32 - m);
        m++;
      } else {
        m = 0;
        blockUsed = false;
        blockBreak = false;
        blockActive = true;
        systemRecover = false;
        remaining++;
      }
    }
      
    
    void breakAnimation() {
      noStroke();
      if (m<32){
        quad(positionX() + m, positionY(), 
        positionX() + m, positionY() + BLOCKWIDTH,
        positionX() + BLOCKWIDTH - m, positionY() + BLOCKWIDTH - m,
        positionX() + BLOCKWIDTH - m, positionY() + m);
      }
      if (m<=10) {
        for (int i = 0; i <= int(m/2); i++) {
          strokeWeight(1);
          stroke(250,250,5,255);
          line(positionX(), positionY() + i * BLOCKWIDTH/5, positionX() + i * BLOCKWIDTH/5, positionY());
        }
        m++;
      } else if (m < 20) {
          for (int i = 0; i < 5; i++) {
            strokeWeight(1);
            stroke(250,250,5,255);
            line(positionX(), positionY() + i * BLOCKWIDTH/5, positionX() + i * BLOCKWIDTH/5, positionY());
          }
          for (int i = 0; i <= int((m-10)/2); i++) {
            strokeWeight(1);
            stroke(250,250,5,255);
            line(positionX() + i* BLOCKWIDTH/5, positionY() + BLOCKWIDTH, positionX() + BLOCKWIDTH, positionY() + i * BLOCKWIDTH/5);
          }
          m++;
      } else if (m < 40) {
          for (int i = 0; i < 5; i++) {
              strokeWeight(1);
              stroke(250,250,5,alp);
              line(positionX(), positionY() + i * BLOCKWIDTH/5, positionX() + i * BLOCKWIDTH/5, positionY());
            }
            for (int i = 0; i < 5; i++) {
              strokeWeight(1);
              stroke(250,250,5,alp);
              line(positionX() + i* BLOCKWIDTH/5, positionY() + BLOCKWIDTH, positionX() + BLOCKWIDTH, positionY() + i * BLOCKWIDTH/5);
            }
            m++;
            alp = alp - (255/20); 
          } else {
            m = 0;
            alp = 255;
            blockBreak = false;
            if (remaining < allowableBlocks[currentSys]) {
            gameOver = true;
            mouseActive = false;
            startTime = millis();
        }
      }
    }
      
    
    void updateColors() {
        int increment = 30;
        for (int i = 0; i < 4; i++) {
            if (abs(currentColor[i] - targetColor[i]) < increment) {
                currentColor[i] = targetColor[i];
                targetColor[i] = 255;
            } else if (currentColor[i] < targetColor[i]) {
                currentColor[i] = currentColor[i] + increment;
            } else if (currentColor[i] > targetColor[i]) {
                currentColor[i] = currentColor[i] - increment;
            }
        }
    }
    
    void bracketShow() {
      noFill();
      strokeWeight(1);
      //stroke(250,250,5,255);
      stroke(255);
      line(positionX() - 10, positionY() - 10, positionX() + 10, positionY() - 10);
      line(positionX() - 10, positionY() + BLOCKWIDTH + 10, positionX() + 10, positionY()+ BLOCKWIDTH + 10);
      line(positionX() - 10, positionY() - 10, positionX() - 10, positionY() + BLOCKWIDTH + 10);
      line(positionX() + BLOCKWIDTH + 10, positionY() - 10, positionX() + BLOCKWIDTH - 10, positionY() - 10);
      line(positionX() + BLOCKWIDTH + 10, positionY() + BLOCKWIDTH + 10, positionX() + BLOCKWIDTH - 10, positionY()+ BLOCKWIDTH + 10);
      line(positionX() + BLOCKWIDTH + 10, positionY() - 10, positionX() + BLOCKWIDTH + 10, positionY()+ BLOCKWIDTH + 10);
      textFont(fontDefault,12);
      text("0" + bracketDigit, positionX() + BLOCKWIDTH + 10, positionY()+ BLOCKWIDTH + 10);
    }
    
    void draw() {
      updateColors();
        noStroke();
        fill(currentColor[0], currentColor[1], currentColor[2],
            currentColor[3]);
        rect(positionX(),
            positionY(),
            BLOCKWIDTH,
            BLOCKWIDTH); 
    }
}

Block[][] blocks = new Block[10][3];

void setup() {  // this is run once.   
    maxim = new Maxim(this);
    player = maxim.loadFile("bgMusic.wav");
    player.setLooping(true);
    player.cue(0);
    player.play();
    playerPress = maxim.loadFile("selectSound.wav");
    playerPress.setLooping(false);
    playerBreak = maxim.loadFile("breakSound.wav");
    playerBreak.setLooping(false);
  
    fontDefault = loadFont("LucidaSans-24.vlw");
    fontA = loadFont("Quer-24.vlw");
    // set the background color
    background(140);
    
    // canvas size (Integers only, please.)
    size(1200, 600); 
      
    // smooth edges
    smooth();
    
    // limit the number of frames per second
    frameRate(30);
    
    // set the width of the line. 
    strokeWeight(6);
      
    // Instantiate the blocks
    for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 3; j++) {
            blocks[i][j] = new Block(i, j);
        }
    }
} 

void gameOverAnimation() {
  if (millis() - startTime <= 5000){
      int goWidth = int(random(64, 256));
      fill(255,255,255,int(255*(millis()-startTime)/5000));
      rect(int(random(0,1200)),int(random(0,600)), goWidth, goWidth);
    } else  if (millis() - startTime < 7000){
      int goWidth = int(random(64, 256));
      fill(255);
      rect(int(random(0,1200)),int(random(0,600)), goWidth, goWidth);
      fill(255,255,255,int(255*(millis()-startTime-5000)/2000));
      rect(0,0,1200,600);
      fill(0);
      rect(0, 285, 4*(millis() - startTime - 5000), 30);
      fill(255);
      textAlign(LEFT, BOTTOM);
      textFont(fontA,30);     
      text("system.break", 800, 320);
    } else if (millis() - startTime < 9000){
      background(255);
      for (int i = 0; i < 7; i++){
        stroke(0);
        line(0, (i + 1) * 100, (i + 1) * 100, 0);
      }
      fill(255);
      noStroke();
      rect(0, 0, 1200, 600 - int(600*(millis() - startTime - 7000)/375));
      fill(0);
      rect(0, 285, 1200, 30);
      fill(255);
      textAlign(LEFT, BOTTOM);
      textFont(fontA,30);
      text("system.break", 800, 320);
      fill(0);
      //textFont(fontA,50);
      //text("retry?", 800, 550);
    }
}

void startAnimation() {
  for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 3; j++) {
          blocks[i][j].draw();
    }
  }
  smooth();
  if (millis() > 8000){
    startAlpha[0] += 3;
    if (startAlpha[0] > 255){
      startAlpha[0] = 255;
    }
  }
  if (millis() > 9500){
    startAlpha[1] += 3;
    if (startAlpha[1] > 255){
      startAlpha[1] = 255;
    }
  }
  if (millis() > 14000){
    startAlpha[2] += 3;
    if (startAlpha[2] > 255){
      startAlpha[2] = 255;
    }
  }
    fill(255,startAlpha[0]);
    textFont(fontA,16);
    textAlign(RIGHT, BOTTOM);
    text("fragile", 1000, 480);
    fill(255,startAlpha[1]);
    textFont(fontA,16);
    textAlign(LEFT, BOTTOM);
    text("_systems", 1000, 480);
    fill(255,startAlpha[2]);
    textFont(fontA,16);
    textAlign(RIGHT, TOP);
    text("click to begin", 1084, 510);
    rect(1084,510,18,18);
}

void gameWinAnimation(){
  fill(255, startAlpha[0]);
  rect(0,0,width,height);
  fill(0, startAlpha[1]);
  textFont(fontA,16);
  textAlign(LEFT, BOTTOM);
  text("systems_complete", 800, 480);
  startAlpha[0] += 3;
  if (startAlpha[0] > 255) {
    startAlpha[0] = 255;
  }
  if (millis() - startTime > 4000) {
    startAlpha[1] += 3;
    if (startAlpha[1] > 255) {
      startAlpha[1] = 255;
    }
  }
  
}

void draw() {  // this is run repeatedly.  
  if (startScreen == true){
    startAnimation();
  } else if ((gameOver == false) && (winCondition == false)){
    background(currentBG[0], currentBG[1], currentBG[2]);
    backgroundUpdate();
    remaningHud();
    replayButton();
    systemDisplay();  
    if (seqActive == true){
      showSequence();
    }
    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 3; j++) {
        if (blocks[i][j].blockActive == true){
          blocks[i][j].draw();
          } else if (blocks[i][j].blockBreak == true){
            blocks[i][j].breakAnimation();
        }
      }
    }
    if (systemRecover == true) {
      for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 3; j++) {
          if (blocks[i][j].blockActive == false){
            blocks[i][j].recoverAnimation();
          }
        }
      }
    }
  }
  if (gameOver == true){
    gameOverAnimation();
  }
  if (winCondition == true){
    gameWinAnimation();
  }
}

void backgroundUpdate(){
  for (int i = 0; i < 3; i++){
    //println("CurrentBG" + i + " = " + currentBG[i]);
    if (abs(currentBG[i] - sysBG[currentSys][i]) < 1){
      currentBG[i] = sysBG[currentSys][i];
    } else if (currentBG[i] < sysBG[currentSys][i]){
      currentBG[i] += 1;
    } else if (currentBG[i] > sysBG[currentSys][i]){
      currentBG[i] -= 1;
    }
    //println("CurrentBG" + i + " = " + currentBG[i]);
  }
}

void levelSequence() {
  mouseActive = false;
  for (int i = 0; i < seqLength[currentSys][currentLevel]; i++) {
    while (true) {
        seqX[i] = int(random(0,10));
        seqY[i] = int(random(0,3));
        if (blocks[seqX[i]][seqY[i]].blockUsed == false) {
            blocks[seqX[i]][seqY[i]].blockUsed = true;
            break;
        }
    }
    
    //println("X" + i + "=" + seqX[i]);
    //println("Y" + i + "=" + seqY[i]);
    //println(blocks[seqX[i]][seqY[i]].blockUsed + "this block is used");
  }
}

void showSequence() {
  if (millis() - startTime < 500) {
  } else if (millis() - startTime < 1500) {
    bracketDigit = 1;
    blocks[seqX[0]][seqY[0]].bracketShow();
  } else if (millis() - startTime < 2500) {
    bracketDigit = 2;
    blocks[seqX[1]][seqY[1]].bracketShow();
  } else if (millis() - startTime < 3500) {
    bracketDigit = 3;
    blocks[seqX[2]][seqY[2]].bracketShow();
  } else if ((millis() - startTime < 4500) && (seqLength[currentSys][currentLevel] > 3)) {
    bracketDigit = 4;
    blocks[seqX[3]][seqY[3]].bracketShow();
  } else if ((millis() - startTime < 5500) && (seqLength[currentSys][currentLevel] > 4)) {
    bracketDigit = 5;
    blocks[seqX[4]][seqY[4]].bracketShow();
  } else if ((millis() - startTime < 6500) && (seqLength[currentSys][currentLevel] > 5)) {
    bracketDigit = 6;
    blocks[seqX[5]][seqY[5]].bracketShow();
  } else if ((millis() - startTime < 7500) && (seqLength[currentSys][currentLevel] > 6)) {
    bracketDigit = 7;
    blocks[seqX[6]][seqY[6]].bracketShow();
  } else if ((millis() - startTime < 8500) && (seqLength[currentSys][currentLevel] > 7)) {
    bracketDigit = 8;
    blocks[seqX[7]][seqY[7]].bracketShow();
  } else {
    seqActive = false;
    mouseActive = true;
  }
}

void systemDisplay(){
  textFont(fontA,30);
  textAlign(RIGHT, BOTTOM);
  text("system", 1150, 540);
  textFont(fontA,50);
  textAlign(RIGHT, TOP);
  text("0" + (currentSys + 1), 1150, 540);
  textAlign(LEFT, BOTTOM);  
}
  
void replayButton(){
  if (replayOn == true) {
    fill(90);
    rect(replayPos - 115,60,115,30);
    fill(255);
    textFont(fontA,8);
    text("replay string", replayPos - 110, 80);
    replayPos += 10;
  }else{
    fill(90);
    rect(replayPos - 115,60,115,30);
    fill(255);
    textFont(fontA,8);
    text("replay string", replayPos - 110, 80);
    replayPos -= 10;
  }
    
  if (replayPos > 115) {
    replayPos = 115;
  }
  if (replayPos < 0) {
    replayPos = 0;
  }
}
    
    

void remaningHud() {
  if (remaining - allowableBlocks[currentSys] < 4) {
    noStroke();
    fill(255,255,5,200 + 50*sin(.01*millis()));
    rect(0,0,175 + warnPos,50);
    quad(175 + warnPos,0,175 + warnPos,50,200 + warnPos,25,200 + warnPos,0);
    fill(0);
    textFont(fontA,16);
    textAlign(RIGHT);
    text("_syst.break imminent", 150 + warnPos, 30);
    warnPos += 80;
    if (warnPos > 375) {
      warnPos = 375;
    }
  }
  fill(90);
  rect(0,0,175,50);
  quad(175,0,175,50,200,25,200,0);
  fill(255,255,255,255);
  textFont(fontA,16);
  textAlign(RIGHT);
  text(remaining, 60, 30);
  textAlign(LEFT);
  textSize(10);
  text("/" + allowableBlocks[currentSys] + " minimum", 60, 35);
}

void mouseClicked() {
  if (startScreen == true){    
    if((mouseX > 1084) && (mouseX < 1102) && (mouseY > 510) && (mouseY < 528)) {
      startScreen = false;
      levelSequence();
      startTime = millis();
      seqActive = true;
      startAlpha[0] = 0;
      startAlpha[1] = 0;
      startAlpha[2] = 0;
    }
  }
  if (mouseActive == true){
    if ((mouseX < 115) && (mouseY < 90) && (mouseY > 60) && (replayOn == true)) {
      startTime = millis();
      seqActive = true;
      replayOn = false;
    } 
    systemRecover = false;
  // Run through all the blocks, and call handleHit(mouseX, mouseY) on each
      for (int i = 0; i < 10; i++) {
          for (int j = 0; j < 3; j++) {
              blocks[i][j].handleHit(mouseX, mouseY);
          }
       }
    }
}


//The MIT License (MIT)

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.



import java.util.ArrayList;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.BufferedInputStream;
import java.net.MalformedURLException;
import java.net.URL;
import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.DataLine;
import javax.sound.sampled.LineUnavailableException;
import javax.sound.sampled.SourceDataLine;

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

//import android.content.res.Resources;
// import android.app.Activity; 
// import android.os.Bundle; 
// import android.media.*;
// import android.media.audiofx.Visualizer;
// import android.content.res.AssetFileDescriptor;
// import android.hardware.*;


public class Maxim {

    private float sampleRate;

    public final float[] mtof = {
  0f, 8.661957f, 9.177024f, 9.722718f, 10.3f, 10.913383f, 11.562325f, 12.25f, 12.978271f, 13.75f, 14.567617f, 15.433853f, 16.351599f, 17.323914f, 18.354048f, 19.445436f, 20.601723f, 21.826765f, 23.124651f, 24.5f, 25.956543f, 27.5f, 29.135235f, 30.867706f, 32.703197f, 34.647827f, 36.708096f, 38.890873f, 41.203445f, 43.65353f, 46.249302f, 49.f, 51.913086f, 55.f, 58.27047f, 61.735413f, 65.406395f, 69.295654f, 73.416191f, 77.781746f, 82.406891f, 87.30706f, 92.498604f, 97.998856f, 103.826172f, 110.f, 116.540939f, 123.470825f, 130.81279f, 138.591309f, 146.832382f, 155.563492f, 164.813782f, 174.61412f, 184.997208f, 195.997711f, 207.652344f, 220.f, 233.081879f, 246.94165f, 261.62558f, 277.182617f, 293.664764f, 311.126984f, 329.627563f, 349.228241f, 369.994415f, 391.995422f, 415.304688f, 440.f, 466.163757f, 493.883301f, 523.25116f, 554.365234f, 587.329529f, 622.253967f, 659.255127f, 698.456482f, 739.988831f, 783.990845f, 830.609375f, 880.f, 932.327515f, 987.766602f, 1046.502319f, 1108.730469f, 1174.659058f, 1244.507935f, 1318.510254f, 1396.912964f, 1479.977661f, 1567.981689f, 1661.21875f, 1760.f, 1864.655029f, 1975.533203f, 2093.004639f, 2217.460938f, 2349.318115f, 2489.015869f, 2637.020508f, 2793.825928f, 2959.955322f, 3135.963379f, 3322.4375f, 3520.f, 3729.31f, 3951.066406f, 4186.009277f, 4434.921875f, 4698.63623f, 4978.031738f, 5274.041016f, 5587.651855f, 5919.910645f, 6271.926758f, 6644.875f, 7040.f, 7458.620117f, 7902.132812f, 8372.018555f, 8869.84375f, 9397.272461f, 9956.063477f, 10548.082031f, 11175.303711f, 11839.821289f, 12543.853516f, 13289.75f
    };

    private AudioThread audioThread;
    private PApplet processing;

    public Maxim (PApplet processing) {
  this.processing = processing;
  sampleRate = 44100f;
  audioThread = new AudioThread(sampleRate, 4096, false);
  audioThread.start();
      
    }

    public float[] getPowerSpectrum() {
  return audioThread.getPowerSpectrum();
    }

    /** 
     *  load the sent file into an audio player and return it. Use
     *  this if your audio file is not too long want precision control
     *  over looping and play head position
     * @param String filename - the file to load
     * @return AudioPlayer - an audio player which can play the file
     */
    public AudioPlayer loadFile(String filename) {
  // this will load the complete audio file into memory
  AudioPlayer ap = new AudioPlayer(filename, sampleRate, processing);
  audioThread.addAudioGenerator(ap);
  // now we need to tell the audiothread
  // to ask the audioplayer for samples
  return ap;
    }

    /**
     * Create a wavetable player object with a wavetable of the sent
     * size. Small wavetables (<128) make for a 'nastier' sound!
     * 
     */
    public WavetableSynth createWavetableSynth(int size) {
  // this will load the complete audio file into memory
  WavetableSynth ap = new WavetableSynth(size, sampleRate);
  audioThread.addAudioGenerator(ap);
  // now we need to tell the audiothread
  // to ask the audioplayer for samples
  return ap;
    }
    // /**
    //  * Create an AudioStreamPlayer which can stream audio from the
    //  * internet as well as local files.  Does not provide precise
    //  * control over looping and playhead like AudioPlayer does.  Use this for
    //  * longer audio files and audio from the internet.
    //  */
    // public AudioStreamPlayer createAudioStreamPlayer(String url) {
    //     AudioStreamPlayer asp = new AudioStreamPlayer(url);
    //     return asp;
    // }
}




/**
 * This class can play audio files and includes an fx chain 
 */
public class AudioPlayer implements Synth, AudioGenerator {
    private FXChain fxChain;
    private boolean isPlaying;
    private boolean isLooping;
    private boolean analysing;
    private FFT fft;
    private int fftInd;
    private float[] fftFrame;
    private float[] powerSpectrum;

    //private float startTimeSecs;
    //private float speed;
    private int length;
    private short[] audioData;
    private float startPos;
    private float readHead;
    private float dReadHead;
    private float sampleRate;
    private float masterVolume;

    float x1, x2, y1, y2, x3, y3;

    public AudioPlayer(float sampleRate) {
  fxChain = new FXChain(sampleRate);
  this.sampleRate = sampleRate;
    }

    public AudioPlayer (String filename, float sampleRate, PApplet processing) {
  //super(filename);
  this(sampleRate);
  try {
      // how long is the file in bytes?
      //long byteCount = getAssets().openFd(filename).getLength();
      File f = new File(processing.dataPath(filename));
      long byteCount = f.length();
      //System.out.println("bytes in "+filename+" "+byteCount);

      // check the format of the audio file first!
      // only accept mono 16 bit wavs
      //InputStream is = getAssets().open(filename); 
      BufferedInputStream bis = new BufferedInputStream(new FileInputStream(f));

      // chop!!

      int bitDepth;
      int channels;
      boolean isPCM;
      // allows us to read up to 4 bytes at a time 
      byte[] byteBuff = new byte[4];

      // skip 20 bytes to get file format
      // (1 byte)
      bis.skip(20);
      bis.read(byteBuff, 0, 2); // read 2 so we are at 22 now
      isPCM = ((short)byteBuff[0]) == 1 ? true:false; 
      //System.out.println("File isPCM "+isPCM);

      // skip 22 bytes to get # channels
      // (1 byte)
      bis.read(byteBuff, 0, 2);// read 2 so we are at 24 now
      channels = (short)byteBuff[0];
      //System.out.println("#channels "+channels+" "+byteBuff[0]);
      // skip 24 bytes to get sampleRate
      // (32 bit int)
      bis.read(byteBuff, 0, 4); // read 4 so now we are at 28
      sampleRate = bytesToInt(byteBuff, 4);
      //System.out.println("Sample rate "+sampleRate);
      // skip 34 bytes to get bits per sample
      // (1 byte)
      bis.skip(6); // we were at 28...
      bis.read(byteBuff, 0, 2);// read 2 so we are at 36 now
      bitDepth = (short)byteBuff[0];
      //System.out.println("bit depth "+bitDepth);
      // convert to word count...
      bitDepth /= 8;
      // now start processing the raw data
      // data starts at byte 36
      int sampleCount = (int) ((byteCount - 36) / (bitDepth * channels));
      audioData = new short[sampleCount];
      int skip = (channels -1) * bitDepth;
      int sample = 0;
      // skip a few sample as it sounds like shit
      bis.skip(bitDepth * 4);
      while (bis.available () >= (bitDepth+skip)) {
    bis.read(byteBuff, 0, bitDepth);// read 2 so we are at 36 now
    //int val = bytesToInt(byteBuff, bitDepth);
    // resample to 16 bit by casting to a short
    audioData[sample] = (short) bytesToInt(byteBuff, bitDepth);
    bis.skip(skip);
    sample ++;
      }

      float secs = (float)sample / (float)sampleRate;
      //System.out.println("Read "+sample+" samples expected "+sampleCount+" time "+secs+" secs ");      
      bis.close();


      // unchop
      readHead = 0;
      startPos = 0;
      // default to 1 sample shift per tick
      dReadHead = 1;
      isPlaying = false;
      isLooping = true;
      masterVolume = 1;
  } 
  catch (FileNotFoundException e) {

      e.printStackTrace();
  }
  catch (IOException e) {
      e.printStackTrace();
  }
    }

    public void setAnalysing(boolean analysing_) {
  this.analysing = analysing_;
  if (analysing) {// initialise the fft
      fft = new FFT();
      fftInd = 0;
      fftFrame = new float[1024];
      powerSpectrum = new float[fftFrame.length/2];
  }
    }

    public float getAveragePower() {
  if (analysing) {
      // calc the average
      float sum = 0;
      for (int i=0;i<powerSpectrum.length;i++){
    sum += powerSpectrum[i];
      }
      sum /= powerSpectrum.length;
      return sum;
  }
  else {
      System.out.println("call setAnalysing to enable power analysis");
      return 0;
  }
    }
    public float[] getPowerSpectrum() {
  if (analysing) {
      return powerSpectrum;
  }
  else {
      System.out.println("call setAnalysing to enable power analysis");
      return null;
  }
    }

    /** 
     *convert the sent byte array into an int. Assumes little endian byte ordering. 
     *@param bytes - the byte array containing the data
     *@param wordSizeBytes - the number of bytes to read from bytes array
     *@return int - the byte array as an int
     */
    private int bytesToInt(byte[] bytes, int wordSizeBytes) {
  int val = 0;
  for (int i=wordSizeBytes-1; i>=0; i--) {
      val <<= 8;
      val |= (int)bytes[i] & 0xFF;
  }
  return val;
    }

    /**
     * Test if this audioplayer is playing right now
     * @return true if it is playing, false otherwise
     */
    public boolean isPlaying() {
  return isPlaying;
    }

    /**
     * Set the loop mode for this audio player
     * @param looping 
     */
    public void setLooping(boolean looping) {
  isLooping = looping;
    }

    /**
     * Move the start pointer of the audio player to the sent time in ms
     * @param timeMs - the time in ms
     */
    public void cue(int timeMs) {
  //startPos = ((timeMs / 1000) * sampleRate) % audioData.length;
  //readHead = startPos;
  //System.out.println("AudioPlayer Cueing to "+timeMs);
  if (timeMs >= 0) {// ignore crazy values
      readHead = (((float)timeMs / 1000f) * sampleRate) % audioData.length;
      //System.out.println("Read head went to "+readHead);
  }
    }

    /**
     *  Set the playback speed,
     * @param speed - playback speed where 1 is normal speed, 2 is double speed
     */
    public void speed(float speed) {
  //System.out.println("setting speed to "+speed);
  dReadHead = speed;
    }

    /**
     * Set the master volume of the AudioPlayer
     */

    public void volume(float volume) {
  masterVolume = volume;
    }

    /**
     * Get the length of the audio file in samples
     * @return int - the  length of the audio file in samples
     */
    public int getLength() {
  return audioData.length;
    }
    /**
     * Get the length of the sound in ms, suitable for sending to 'cue'
     */
    public float getLengthMs() {
  return ((float) audioData.length / sampleRate * 1000f);
    }

    /**
     * Start playing the sound. 
     */
    public void play() {
  isPlaying = true;
    }

    /**
     * Stop playing the sound
     */
    public void stop() {
  isPlaying = false;
    }

    /**
     * implementation of the AudioGenerator interface
     */
    public short getSample() {
  if (!isPlaying) {
      return 0;
  }
  else {
      short sample;
      readHead += dReadHead;
      if (readHead > (audioData.length - 1)) {// got to the end
    //% (float)audioData.length;
    if (isLooping) {// back to the start for loop mode
        readHead = readHead % (float)audioData.length;
    }
    else {
        readHead = 0;
        isPlaying = false;
    }
      }

      // linear interpolation here
      // declaring these at the top...
      // easy to understand version...
      //      float x1, x2, y1, y2, x3, y3;
      x1 = floor(readHead);
      x2 = x1 + 1;
      y1 = audioData[(int)x1];
      y2 = audioData[(int) (x2 % audioData.length)];
      x3 = readHead;
      // calc 
      y3 =  y1 + ((x3 - x1) * (y2 - y1));
      y3 *= masterVolume;
      sample = fxChain.getSample((short) y3);
      if (analysing) {
    // accumulate samples for the fft
    fftFrame[fftInd] = (float)sample / 32768f;
    fftInd ++;
    if (fftInd == fftFrame.length - 1) {// got a frame
        powerSpectrum = fft.process(fftFrame, true);
        fftInd = 0;
    }
      }

      //return sample;
      return (short)y3;
  }
    }

    public void setAudioData(short[] audioData) {
  this.audioData = audioData;
    }

    public short[] getAudioData() {
  return audioData;
    }

    public void setDReadHead(float dReadHead) {
  this.dReadHead = dReadHead;
    }

    ///
    //the synth interface
    // 

    public void ramp(float val, float timeMs) {
  fxChain.ramp(val, timeMs);
    } 



    public void setDelayTime(float delayMs) {
  fxChain.setDelayTime( delayMs);
    }

    public void setDelayFeedback(float fb) {
  fxChain.setDelayFeedback(fb);
    }

    public void setFilter(float cutoff, float resonance) {
  fxChain.setFilter( cutoff, resonance);
    }
}

/**
 * This class can play wavetables and includes an fx chain
 */
public class WavetableSynth extends AudioPlayer {

    private short[] sine;
    private short[] saw;
    private short[] wavetable;
    private float sampleRate;

    public WavetableSynth(int size, float sampleRate) {
  super(sampleRate);
  sine = new short[size];
  for (float i = 0; i < sine.length; i++) {
      float phase;
      phase = TWO_PI / size * i;
      sine[(int)i] = (short) (sin(phase) * 32768);
  }
  saw = new short[size];
  for (float i = 0; i<saw.length; i++) {
      saw[(int)i] = (short) (i / (float)saw.length *32768);
  }

  this.sampleRate = sampleRate;
  setAudioData(sine);
  setLooping(true);
    }

    public void setFrequency(float freq) {
  if (freq > 0) {
      //System.out.println("freq freq "+freq);
      setDReadHead((float)getAudioData().length / sampleRate * freq);
  }
    }

    public void loadWaveForm(float[] wavetable_) {
  if (wavetable == null || wavetable_.length != wavetable.length) {
      // only reallocate if there is a change in length
      wavetable = new short[wavetable_.length];
  }
  for (int i=0;i<wavetable.length;i++) {
      wavetable[i] = (short) (wavetable_[i] * 32768);
  }
  setAudioData(wavetable);
    }
}

public interface Synth {
    public void volume(float volume);
    public void ramp(float val, float timeMs);  
    public void setDelayTime(float delayMs);  
    public void setDelayFeedback(float fb);  
    public void setFilter(float cutoff, float resonance);
    public void setAnalysing(boolean analysing);
    public float getAveragePower();
    public float[] getPowerSpectrum();
}

public class AudioThread extends Thread
{
    private int minSize;
    //private AudioTrack track;
    private short[] bufferS;
    private byte[] bOutput;
    private ArrayList audioGens;
    private boolean running;

    private FFT fft;
    private float[] fftFrame;
    private SourceDataLine sourceDataLine;
    private int blockSize;

    public AudioThread(float samplingRate, int blockSize) {
  this(samplingRate, blockSize, false);
    }

    public AudioThread(float samplingRate, int blockSize, boolean enableFFT)
    {
  this.blockSize = blockSize;
  audioGens = new ArrayList();
  // we'll do our dsp in shorts
  bufferS = new short[blockSize];
  // but we'll convert to bytes when sending to the sound card
  bOutput = new byte[blockSize * 2];
  AudioFormat audioFormat = new AudioFormat(samplingRate, 16, 1, true, false);
  DataLine.Info dataLineInfo = new DataLine.Info(SourceDataLine.class, audioFormat);
      
  sourceDataLine = null;
  // here we try to initialise the audio system. try catch is exception handling, i.e. 
  // dealing with things not working as expected
  try {
      sourceDataLine = (SourceDataLine) AudioSystem.getLine(dataLineInfo);
      sourceDataLine.open(audioFormat, bOutput.length);
      sourceDataLine.start();
      running = true;
  } catch (LineUnavailableException lue) {
      // it went wrong!
      lue.printStackTrace(System.err);
      System.out.println("Could not initialise audio. check above stack trace for more info");
      //System.exit(1);
  }


  if (enableFFT) {
      try {
    fft = new FFT();
      }
      catch(Exception e) {
    System.out.println("Error setting up the audio analyzer");
    e.printStackTrace();
      }
  }
    }

    // overidden from Thread
    public void run() {
  running = true;
  while (running) {
      //System.out.println("AudioThread : ags  "+audioGens.size());
      for (int i=0;i<bufferS.length;i++) {
    // we add up using a 32bit int
    // to prevent clipping
    int val = 0;
    if (audioGens.size() > 0) {
        for (int j=0;j<audioGens.size(); j++) {
      AudioGenerator ag = (AudioGenerator)audioGens.get(j);
      val += ag.getSample();
        }
        val /= audioGens.size();
    }
    bufferS[i] = (short) val;
      }
      // send it to the audio device!
      sourceDataLine.write(shortsToBytes(bufferS, bOutput), 0, bOutput.length);
  }
    }
  
    public void addAudioGenerator(AudioGenerator ag) {
  audioGens.add(ag);
    }

    /**
     * converts an array of 16 bit samples to bytes
     * in little-endian (low-byte, high-byte) format.
     */
    private byte[] shortsToBytes(short[] sData, byte[] bData) {
  int index = 0;
  short sval;
  for (int i = 0; i < sData.length; i++) {
      //short sval = (short) (fData[j][i] * ShortMaxValueAsFloat);
      sval = sData[i];
      bData[index++] = (byte) (sval & 0x00FF);
      bData[index++] = (byte) ((sval & 0xFF00) >> 8);
  }
  return bData;
    }

    /**
     * Returns a recent snapshot of the power spectrum 
     */
    public float[] getPowerSpectrum() {
  // process the last buffer that was calculated
  if (fftFrame == null) {
      fftFrame = new float[bufferS.length];
  }
  for (int i=0;i<fftFrame.length;i++) {
      fftFrame[i] = ((float) bufferS[i] / 32768f);
  }
  return fft.process(fftFrame, true);
  //return powerSpectrum;
    }
}

/**
 * Implement this interface so the AudioThread can request samples from you
 */
public interface AudioGenerator {
    /** AudioThread calls this when it wants a sample */
    short getSample();
}


public class FXChain  {
    private float currentAmp;
    private float dAmp;
    private float targetAmp;
    private boolean goingUp;
    private Filter filter;

    private float[] dLine;   

    private float sampleRate;

    public FXChain(float sampleRate_) {
  sampleRate = sampleRate_;
  currentAmp = 1;
  dAmp = 0;
  // filter = new MickFilter(sampleRate);
  filter = new RLPF(sampleRate);

  //filter.setFilter(0.1, 0.1);
    }

    public void ramp(float val, float timeMs) {
  // calc the dAmp;
  // - change per ms
  targetAmp = val;
  dAmp = (targetAmp - currentAmp) / (timeMs / 1000 * sampleRate);
  if (targetAmp > currentAmp) {
      goingUp = true;
  }
  else {
      goingUp = false;
  }
    }


    public void setDelayTime(float delayMs) {
    }

    public void setDelayFeedback(float fb) {
    }

    public void volume(float volume) {
    }


    public short getSample(short input) {
  float in;
  in = (float) input / 32768;// -1 to 1

  in =  filter.applyFilter(in);
  if (goingUp && currentAmp < targetAmp) {
      currentAmp += dAmp;
  }
  else if (!goingUp && currentAmp > targetAmp) {
      currentAmp += dAmp;
  }  

  if (currentAmp > 1) {
      currentAmp = 1;
  }
  if (currentAmp < 0) {
      currentAmp = 0;
  }  
  in *= currentAmp;  
  return (short) (in * 32768);
    }

    public void setFilter(float f, float r) {
  filter.setFilter(f, r);
    }
}


// /**
//  * Represents an audio source is streamed as opposed to being completely loaded (as WavSource is)
//  */
// public class AudioStreamPlayer {
//   /** a class from the android API*/
//   private MediaPlayer mediaPlayer;
//   /** a class from the android API*/
//   private Visualizer viz; 
//   private byte[] waveformBuffer;
//   private byte[] fftBuffer;
//   private byte[] powerSpectrum;

//   /**
//    * create a stream source from the sent url 
//    */
//   public AudioStreamPlayer(String url) {
//       try {
//     mediaPlayer = new MediaPlayer();
//     //mp.setAuxEffectSendLevel(1);
//     mediaPlayer.setLooping(true);

//     // try to parse the URL... if that fails, we assume it
//     // is a local file in the assets folder
//     try {
//         URL uRL = new URL(url);
//         mediaPlayer.setDataSource(url);
//     }
//     catch (MalformedURLException eek) {
//         // couldn't parse the url, assume its a local file
//         AssetFileDescriptor afd = getAssets().openFd(url);
//         //mp.setDataSource(afd.getFileDescriptor(),afd.getStartOffset(),afd.getLength());
//         mediaPlayer.setDataSource(afd.getFileDescriptor());
//         afd.close();
//     }

//     mediaPlayer.prepare();
//     //mediaPlayer.start();
//     //System.out.println("Created audio with id "+mediaPlayer.getAudioSessionId());
//     viz = new Visualizer(mediaPlayer.getAudioSessionId());
//     viz.setEnabled(true);
//     waveformBuffer = new byte[viz.getCaptureSize()];
//     fftBuffer = new byte[viz.getCaptureSize()/2];
//     powerSpectrum = new byte[viz.getCaptureSize()/2];
//       }
//       catch (Exception e) {
//     System.out.println("StreamSource could not be initialised. Check url... "+url+ " and that you have added the permission INTERNET, RECORD_AUDIO and MODIFY_AUDIO_SETTINGS to the manifest,");
//     e.printStackTrace();
//       }
//   }

//   public void play() {
//       mediaPlayer.start();
//   }

//   public int getLengthMs() {
//       return mediaPlayer.getDuration();
//   }

//   public void cue(float timeMs) {
//       if (timeMs >= 0 && timeMs < getLengthMs()) {// ignore crazy values
//     mediaPlayer.seekTo((int)timeMs);
//       }
//   }

//   /**
//    * Returns a recent snapshot of the power spectrum as 8 bit values
//    */
//   public byte[] getPowerSpectrum() {
//       // calculate the spectrum
//       viz.getFft(fftBuffer);
//       short real, imag;
//       for (int i=2;i<fftBuffer.length;i+=2) {
//     real = (short) fftBuffer[i];
//     imag = (short) fftBuffer[i+1];
//     powerSpectrum[i/2] = (byte) ((real * real)  + (imag * imag));
//       }
//       return powerSpectrum;
//   }

//   /**
//    * Returns a recent snapshot of the waveform being played 
//    */
//   public byte[] getWaveForm() {
//       // retrieve the waveform
//       viz.getWaveForm(waveformBuffer);
//       return waveformBuffer;
//   }
// } 

/**
 * Use this class to retrieve data about the movement of the device
 */
public class Accelerometer  {
    //private SensorManager sensorManager;
    //private Sensor accelerometer;
    private float[] values;

    public Accelerometer() {
  //sensorManager = (SensorManager)getSystemService(SENSOR_SERVICE);
  //accelerometer = sensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
  //sensorManager.registerListener(this, accelerometer, SensorManager.SENSOR_DELAY_NORMAL);
  values = new float[3];
  System.out.println("Java accelerometer will generate values of zero!");
    }

    public float[] getValues() {
  return values;
    }

    public float getX() {
  return values[0];
    }

    public float getY() {
  return values[1];
    }

    public float getZ() {
  return values[2];
    }

}

public interface Filter {
    public void setFilter(float f, float r);
    public float applyFilter(float in);
}

/** https://github.com/supercollider/supercollider/blob/master/server/plugins/FilterUGens.cpp */

public class RLPF implements Filter {
    float a0, b1, b2, y1, y2;
    float freq;
    float reson;
    float sampleRate;
    boolean changed;

    public RLPF(float sampleRate_) {
  this.sampleRate = sampleRate_;
  reset();
  this.setFilter(sampleRate / 4, 0.01f);
    }
    private void reset() {
  a0 = 0.f;
  b1 = 0.f;
  b2 = 0.f;
  y1 = 0.f;
  y2 = 0.f;
    }
    /** f is in the range 0-sampleRate/2 */
    public void setFilter(float f, float r) {
  // constrain 
  // limit to 0-1 
  f = constrain(f, 0, sampleRate/4);
  r = constrain(r, 0, 1);
  // invert so high r -> high resonance!
  r = 1-r;
  // remap to appropriate ranges
  f = map(f, 0f, sampleRate/4, 30f, sampleRate / 4);
  r = map(r, 0f, 1f, 0.005f, 2f);

  System.out.println("rlpf: f "+f+" r "+r);

  this.freq = f * TWO_PI / sampleRate;
  this.reson = r;
  changed = true;
    }

    public float applyFilter(float in) {
  float y0;
  if (changed) {
      float D = tan(freq * reson * 0.5f);
      float C = ((1.f-D)/(1.f+D));
      float cosf = cos(freq);
      b1 = (1.f + C) * cosf;
      b2 = -C;
      a0 = (1.f + C - b1) * .25f;
      changed = false;
  }
  y0 = a0 * in + b1 * y1 + b2 * y2;
  y2 = y1;
  y1 = y0;
  if (Float.isNaN(y0)) {
      reset();
  }
  return y0;
    }
}

/** https://github.com/micknoise/Maximilian/blob/master/maximilian.cpp */

class MickFilter implements Filter {

    private float f, res;
    private float cutoff, z, c, x, y, out;
    private float sampleRate;

    MickFilter(float sampleRate) {
  this.sampleRate = sampleRate;
    }

    public void setFilter(float f, float r) {
  f = constrain(f, 0, 1);
  res = constrain(r, 0, 1);
  f = map(f, 0, 1, 25, sampleRate / 4);
  r = map(r, 0, 1, 1, 25);
  this.f = f;
  this.res = r;    

  //System.out.println("mickF: f "+f+" r "+r);
    }
    public float applyFilter(float in) {
  return lores(in, f, res);
    }

    public float lores(float input, float cutoff1, float resonance) {
  //cutoff=cutoff1*0.5;
  //if (cutoff<10) cutoff=10;
  //if (cutoff>(sampleRate*0.5)) cutoff=(sampleRate*0.5);
  //if (resonance<1.) resonance = 1.;

  //if (resonance>2.4) resonance = 2.4;
  z=cos(TWO_PI*cutoff/sampleRate);
  c=2-2*z;
  float r=(sqrt(2.0f)*sqrt(-pow((z-1.0f), 3.0f))+resonance*(z-1))/(resonance*(z-1));
  x=x+(input-y)*c;
  y=y+x;
  x=x*r;
  out=y;
  return out;
    }
}


/*
 * This file is part of Beads. See http://www.beadsproject.net for all information.
 * CREDIT: This class uses portions of code taken from MPEG7AudioEnc. See readme/CREDITS.txt.
 */

/**
 * FFT performs a Fast Fourier Transform and forwards the complex data to any listeners. 
 * The complex data is a float of the form float[2][frameSize], with real and imaginary 
 * parts stored respectively.
 * 
 * @beads.category analysis
 */
public class FFT {

    /** The real part. */
    protected float[] fftReal;

    /** The imaginary part. */
    protected float[] fftImag;

    private float[] dataCopy = null;
    private float[][] features;
    private float[] powers;
    private int numFeatures;

    /**
     * Instantiates a new FFT.
     */
    public FFT() {
  features = new float[2][];
    }

    /* (non-Javadoc)
     * @see com.olliebown.beads.core.UGen#calculateBuffer()
     */
    public float[] process(float[] data, boolean direction) {
  if (powers == null) powers = new float[data.length/2];
  if (dataCopy==null || dataCopy.length!=data.length)
      dataCopy = new float[data.length];
  System.arraycopy(data, 0, dataCopy, 0, data.length);

  fft(dataCopy, dataCopy.length, direction);
  numFeatures = dataCopy.length;
  fftReal = calculateReal(dataCopy, dataCopy.length);
  fftImag = calculateImaginary(dataCopy, dataCopy.length);
  features[0] = fftReal;
  features[1] = fftImag;
  // now calc the powers
  return specToPowers(fftReal, fftImag, powers);
    }

    public float[] specToPowers(float[] real, float[] imag, float[] powers) {
  float re, im;
  double pow;
  for (int i=0;i<powers.length;i++) {
      //real = spectrum[i][j].re();
      //imag = spectrum[i][j].im();
      re = real[i];
      im = imag[i];
      powers[i] = (re*re + im * im);
      powers[i] = (float) Math.sqrt(powers[i]) / 10;
      // convert to dB
      pow = (double) powers[i];
      powers[i] = (float)(10 *  Math.log10(pow * pow)); // (-100 - 100)
      powers[i] = (powers[i] + 100) * 0.005f; // 0-1
  }
  return powers;
    }

    /**
     * The frequency corresponding to a specific bin 
     * 
     * @param samplingFrequency The Sampling Frequency of the AudioContext
     * @param blockSize The size of the block analysed
     * @param binNumber 
     */
    public  float binFrequency(float samplingFrequency, int blockSize, float binNumber)
    {    
  return binNumber*samplingFrequency/blockSize;
    }

    /**
     * Returns the average bin number corresponding to a particular frequency.
     * Note: This function returns a float. Take the Math.round() of the returned value to get an integral bin number. 
     * 
     * @param samplingFrequency The Sampling Frequency of the AudioContext
     * @param blockSize The size of the fft block
     * @param freq  The frequency
     */

    public  float binNumber(float samplingFrequency, int blockSize, float freq)
    {
  return blockSize*freq/samplingFrequency;
    }

    /** The nyquist frequency for this samplingFrequency 
     * 
     * @params samplingFrequency the sample
     */
    public  float nyquist(float samplingFrequency)
    {
  return samplingFrequency/2;
    }

    /*
     * All of the code below this line is taken from Holger Crysandt's MPEG7AudioEnc project.
     * See http://mpeg7audioenc.sourceforge.net/copyright.html for license and copyright.
     */

    /**
     * Gets the real part from the complex spectrum.
     * 
     * @param spectrum
     *            complex spectrum.
     * @param length 
     *       length of data to use.
     * 
     * @return real part of given length of complex spectrum.
     */
    protected  float[] calculateReal(float[] spectrum, int length) {
  float[] real = new float[length];
  real[0] = spectrum[0];
  real[real.length/2] = spectrum[1];
  for (int i=1, j=real.length-1; i<j; ++i, --j)
      real[j] = real[i] = spectrum[2*i];
  return real;
    }

    /**
     * Gets the imaginary part from the complex spectrum.
     * 
     * @param spectrum
     *            complex spectrum.
     * @param length 
     *       length of data to use.
     * 
     * @return imaginary part of given length of complex spectrum.
     */
    protected  float[] calculateImaginary(float[] spectrum, int length) {
  float[] imag = new float[length];
  for (int i=1, j=imag.length-1; i<j; ++i, --j)
      imag[i] = -(imag[j] = spectrum[2*i+1]);
  return imag;
    }

    /**
     * Perform FFT on data with given length, regular or inverse.
     * 
     * @param data the data
     * @param n the length
     * @param isign true for regular, false for inverse.
     */
    protected  void fft(float[] data, int n, boolean isign) {
  float c1 = 0.5f; 
  float c2, h1r, h1i, h2r, h2i;
  double wr, wi, wpr, wpi, wtemp;
  double theta = 3.141592653589793/(n>>1);
  if (isign) {
      c2 = -.5f;
      four1(data, n>>1, true);
  } 
  else {
      c2 = .5f;
      theta = -theta;
  }
  wtemp = Math.sin(.5*theta);
  wpr = -2.*wtemp*wtemp;
  wpi = Math.sin(theta);
  wr = 1. + wpr;
  wi = wpi;
  int np3 = n + 3;
  for (int i=2,imax = n >> 2, i1, i2, i3, i4; i <= imax; ++i) {
      /** @TODO this can be optimized */
      i4 = 1 + (i3 = np3 - (i2 = 1 + (i1 = i + i - 1)));
      --i4; 
      --i2; 
      --i3; 
      --i1; 
      h1i =  c1*(data[i2] - data[i4]);
      h2r = -c2*(data[i2] + data[i4]);
      h1r =  c1*(data[i1] + data[i3]);
      h2i =  c2*(data[i1] - data[i3]);
      data[i1] = (float) ( h1r + wr*h2r - wi*h2i);
      data[i2] = (float) ( h1i + wr*h2i + wi*h2r);
      data[i3] = (float) ( h1r - wr*h2r + wi*h2i);
      data[i4] = (float) (-h1i + wr*h2i + wi*h2r);
      wr = (wtemp=wr)*wpr - wi*wpi + wr;
      wi = wi*wpr + wtemp*wpi + wi;
  }
  if (isign) {
      float tmp = data[0]; 
      data[0] += data[1];
      data[1] = tmp - data[1];
  } 
  else {
      float tmp = data[0];
      data[0] = c1 * (tmp + data[1]);
      data[1] = c1 * (tmp - data[1]);
      four1(data, n>>1, false);
  }
    }

    /**
     * four1 algorithm.
     * 
     * @param data
     *            the data.
     * @param nn
     *            the nn.
     * @param isign
     *            regular or inverse.
     */
    private  void four1(float data[], int nn, boolean isign) {
  int n, mmax, istep;
  double wtemp, wr, wpr, wpi, wi, theta;
  float tempr, tempi;

  n = nn << 1;        
  for (int i = 1, j = 1; i < n; i += 2) {
      if (j > i) {
    // SWAP(data[j], data[i]);
    float swap = data[j-1];
    data[j-1] = data[i-1];
    data[i-1] = swap;
    // SWAP(data[j+1], data[i+1]);
    swap = data[j];
    data[j] = data[i]; 
    data[i] = swap;
      }      
      int m = n >> 1;
      while (m >= 2 && j > m) {
    j -= m;
    m >>= 1;
      }
      j += m;
  }
  mmax = 2;
  while (n > mmax) {
      istep = mmax << 1;
      theta = 6.28318530717959 / mmax;
      if (!isign)
    theta = -theta;
      wtemp = Math.sin(0.5 * theta);
      wpr = -2.0 * wtemp * wtemp;
      wpi = Math.sin(theta);
      wr = 1.0;
      wi = 0.0;
      for (int m = 1; m < mmax; m += 2) {
    for (int i = m; i <= n; i += istep) {
        int j = i + mmax;
        tempr = (float) (wr * data[j-1] - wi * data[j]);  
        tempi = (float) (wr * data[j]   + wi * data[j-1]);  
        data[j-1] = data[i-1] - tempr;
        data[j]   = data[i] - tempi;
        data[i-1] += tempr;
        data[i]   += tempi;
    }
    wr = (wtemp = wr) * wpr - wi * wpi + wr;
    wi = wi * wpr + wtemp * wpi + wi;
      }
      mmax = istep;
  }
    }
}




