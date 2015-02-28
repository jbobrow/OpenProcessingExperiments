
/**
 * This sketch demonstrates how to play a file with Minim. <br />
 * It's also a good example of how to draw waveforms using the sample buffers of an AudioSource.
 */

import ddf.minim.*;
//import controlP5.*;

Minim minim;
AudioPlayer mainSample;
AudioPlayer kicks;
AudioPlayer snares;
AudioPlayer hats;
AudioPlayer percussion;

Hero myHero = new Hero(50, 50, 2);

Item kicks01;
Item snares01;
Item hats01;
Item percussion01;


void setup()
{
  size(512, 200, P3D);

  minim = new Minim(this);
  // load a file, give the AudioPlayer buffers that are 2048 samples long
  mainSample = minim.loadFile("mainSample.wav", 1024);
  kicks = minim.loadFile("kicks.wav", 1024);
  snares = minim.loadFile("snares.wav", 1024);
  hats = minim.loadFile("hats.wav", 1024);
  percussion = minim.loadFile("percussion.wav", 1024);

  // play the files
  mainSample.loop();
  kicks.loop();
  snares.loop();
  hats.loop();
  percussion.loop();
  
  // mute the files
  kicks.mute();
  snares.mute();
  hats.mute();
  percussion.mute();
  
  // assign values to items
  kicks01 = new Item(kicks, 200, 150);
  snares01 = new Item(snares, 110, 50);
  hats01 = new Item(hats, 400, 100);
  percussion01 = new Item(percussion, 20, 150);
  
  
}

void draw()
{
  background(0);
  noStroke();

  
  displayHeroAndItems();
  
  


  // draw the waveforms
  // the values returned by left.get() and right.get() will be between -1 and 1,
  // so we need to scale them up to see the waveform
  // note that if the file is MONO, left.get() and right.get() will return the same value
  //  for (int i = 0; i < drums.bufferSize() - 1; i++)
  //  {
  //    float x1 = map(i, 0, drums.bufferSize(), 0, width);
  //    float x2 = map(i+1, 0, drums.bufferSize(), 0, width);
  //    line(x1, 50 + drums.left.get(i)*50, x2, 50 + drums.left.get(i+1)*50);
  //    line(x1, 150 + drums.right.get(i)*50, x2, 150 + drums.right.get(i+1)*50);
  //  }
}

void stop()
{
  // always close Minim audio classes when you are done with them
  // TO DO: for loop cycling through array of AudioPlayer objects
  mainSample.close();
  kicks.close();
  snares.close();
  hats.close();
  percussion.close();
  // always stop Minim before exiting
  minim.stop();

  super.stop();
}

void displayHeroAndItems() {
  // TO DO: for loop through arrays of each class
  myHero.display();
  kicks01.display();
  snares01.display();
  hats01.display();
  percussion01.display();
  
  myHero.moveHero();
}

void keyPressed() {


  // 'a' controls the drums
  if (key == 'a') {
    if (mainSample.isMuted()) {
      mainSample.unmute();
    } 
    else { 
      mainSample.mute();
    }
  }

  // 's' controls the bass
  // TO DO: Only activate when icon is collected
  if (key == 's') {
    if (kicks.isMuted()) {
      kicks.unmute();
    } 
    else { 
      kicks.mute();
    }
  }

  // 'd' controls the hats
  if (key == 'd') {
    if (hats.isMuted()) {
      hats.unmute();
    } 
    else { 
      hats.mute();
    }
  }

  // 'f' controls the snare
  if (key == 'f') {
    if (snares.isMuted()) {
      snares.unmute();
    } 
    else { 
      snares.mute();
    }
  }
}

// Define class for Hero

class Hero {

  boolean hasMainSample = true;
  boolean hasKicks = false;
  boolean hasSnares = false;
  boolean hasHats = false;
  boolean hasPercussion = false;
  boolean inventory[] = { 
    hasMainSample, hasKicks, hasSnares, hasHats
  };

  float xpos;
  float ypos;
  float speed;
  float heroWidth = 20;
  float heroHeight = 20;

  Hero (float tempX, float tempY, float tempSpeed) {

    speed = tempSpeed;
    xpos = tempX;
    ypos = tempY;
  }

  void display() {
    if (xpos < heroWidth/2) {
      xpos = heroWidth/2;
    }
    if (xpos > width - heroWidth/2) {
      xpos = width - heroWidth/2;
    }
    if (ypos < heroHeight/2) {
      ypos = heroHeight/2;
    }
    if (ypos > height - heroHeight/2) {
      ypos = height - heroHeight/2;
    }

    fill(255);
    ellipse(xpos, ypos, heroWidth, heroHeight);
  }

  void addTrack(AudioPlayer pickedUp) {
    // TO DO
    // if dist(Hero.xpos, Hero.ypos, Object.xpos, Object.ypos) { add item to inventory }
    if (pickedUp == kicks) { 
      hasKicks = true;
      kicks.unmute();
    }
    if (pickedUp == snares) { 
      hasSnares = true;
      snares.unmute();
    }
    if (pickedUp == hats) { 
      hasHats = true;
      hats.unmute();
    }
    if (pickedUp == percussion) { 
      hasPercussion = true;
      percussion.unmute();
    }
    println("You have picked up: " + pickedUp);
  }

  void moveHero() {

    if (keyPressed) {
      if (keyCode == UP) { 
        myHero.ypos -= myHero.speed;
      }
      if (keyCode == DOWN) { 
        myHero.ypos += myHero.speed;
      }
      if (keyCode == LEFT) { 
        myHero.xpos -= myHero.speed;
      }
      if (keyCode == RIGHT) { 
        myHero.xpos += myHero.speed;
      }
    }
  }
}


class Enemy {
  // Define class for generic Enemy
}

class Item {
  // Define class for collectibles
  // Attributes determine the type of collectible (drums, bass, etc.)

  boolean isCollected = false;
  float xpos;
  float ypos;
  float itemWidth = 10;
  float itemHeight = 10;
  
  AudioPlayer trackType;

  Item(AudioPlayer tempTrackType, int tempX, int tempY) {
    trackType = tempTrackType;
    xpos = tempX;
    ypos = tempY;
  }
  
  void checkIfCollected() {
    if (dist(myHero.xpos, myHero.ypos, xpos, ypos) <= myHero.heroWidth/2 || dist(myHero.xpos, myHero.ypos, xpos, ypos) <= myHero.heroHeight/2) {
      isCollected = true;
      myHero.addTrack(trackType);
    }
  }




  // Show the Item
  void display() {
    // Only show the item if it hasn't been picked up
    checkIfCollected();
    if (isCollected == false) {
      fill(255);
      rectMode(CENTER);
      rect(xpos, ypos, itemWidth, itemHeight);
    }
  }
}

class Environment {
  // Define class for collectibles
  // Attributes determine the type of collectible (drums, bass, etc.)
}


