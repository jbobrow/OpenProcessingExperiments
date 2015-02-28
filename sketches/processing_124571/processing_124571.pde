
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

PImage img;
color [] imageColors;
int pos;
int canvasSize = 800;
float[] r = new float[canvasSize*canvasSize];
float[] g = new float[canvasSize*canvasSize];
float[] b = new float[canvasSize*canvasSize];
float rn, gn, bn;
int maxRadius = 10; //Maximum adius of the blob
int radius;
int playerResolution = 200; //Number of iterations to wait before playingn a sound
int walker = 0;
int soundCount = 10; //Number of sounds
int currentSound = 0;
float randomWhite = 0.01; //Chance of the blob turning white
float randomBlack = 0.01; //Chance of the blob turning black
int savedTime;
int currentLength = 0; //The length of the current audio file 
int playTime = 0; //Duration since last file played

Minim minim;
AudioSnippet player;

void setup() {
  size(canvasSize, canvasSize);
  background(0);
  smooth();
  img = loadImage( int(random(1, 5)) + ".jpg");
 
  img.loadPixels();
 
  imageColors = new color[img.pixels.length];
 
  // search each line and row of the image
  for (int x=0; x < img.width; x++) {
    for (int y=0; y < img.height; y++) {
      int loc = x + y*img.width;
      r[loc] = red (img.pixels [loc]);
      g[loc] = green (img.pixels [loc]);
      b[loc] = blue (img.pixels [loc]);
      
//      imageColors[loc] = color(r, g, b);
    }
  }
 
  img.updatePixels();
  
  image(img, 0, 0);
  
  savedTime = millis();
}

void draw() {
  radius = int(random(1, maxRadius));
  pos = int(random(canvasSize * radius + radius, (canvasSize - radius)* canvasSize - radius));

  loadPixels(); 

  rn = 0;
  gn = 0;
  bn = 0;
  
//  rn = (r[pos-size-1] + r[pos-size] + r[pos-size+1] + r[pos-1] + r[pos] + r[pos+1] + r[pos+size-1] + r[pos+size] + r[pos-size+1])/9;
//  gn = (g[pos-size-1] + g[pos-size] + g[pos-size+1] + g[pos-1] + g[pos] + g[pos+1] + g[pos+size-1] + g[pos+size] + g[pos-size+1])/9;
//  bn = (b[pos-size-1] + b[pos-size] + b[pos-size+1] + b[pos-1] + b[pos] + b[pos+1] + b[pos+size-1] + b[pos+size] + b[pos-size+1])/9;

  for (int i = -1 * radius; i <= radius; i++) {
    for (int j = -1 * radius; j <= radius; j++) {
      rn = rn + r[pos + i * canvasSize + j];
    }
  }
  for (int i = -1 * radius; i <= radius; i++) {
    for (int j = -1 * radius; j <= radius; j++) {
      gn = gn + g[pos + i * canvasSize + j];
    }
  }
  for (int i = -1 * radius; i <= radius; i++) {
    for (int j = -1 * radius; j <= radius; j++) {
      bn = bn + b[pos + i * canvasSize + j];
    }
  } 

  rn = rn/((2*radius + 1)*(2*radius + 1));
  gn = gn/((2*radius + 1)*(2*radius + 1));
  bn = bn/((2*radius + 1)*(2*radius + 1));

  float poll = random(0, 1);
//  println ("Random poll: " + poll);
  if (poll < randomWhite) {
    rn = 255;
    gn = 255;
    bn = 255;
//    println("Printing a white blob. (" + poll + ")");
  }
  poll = random(0, 1);
//  println ("Random poll: " + poll);
  if (poll < randomBlack) {
    rn = 0;
    gn = 0;
    bn = 0;
//    println("Printing a black blob. (" + poll + ")");
  }  
  
  for (int i = -1 * radius; i <= radius; i++) {
    for (int j = -1 * radius; j <= radius; j++) {
      r[pos + i * canvasSize + j] = rn;
    }
  }

  for (int i = -1 * radius; i <= radius; i++) {
    for (int j = -1 * radius; j <= radius; j++) {
      g[pos + i * canvasSize + j] = gn;
    }
  }

  for (int i = -1 * radius; i <= radius; i++) {
    for (int j = -1 * radius; j <= radius; j++) {
      b[pos + i * canvasSize + j] = bn;
    }
  }

  for (int i = -1 * radius; i <= radius; i++) {
    for (int j = -1 * radius; j <= radius; j++) {
      pixels[pos + i * canvasSize + j] = color(rn, gn, bn);
    }
  }

  if (walker == 0) {
    walker = 0;
    int audioID = 1 + round((soundCount -1)*(rn + gn + bn) / 755);

    if (currentSound != audioID) {
      println(playTime + " " + currentLength);

      playTime = (millis() - savedTime);

      if (playTime + 10000 > currentLength) {
        minim = new Minim(this);
        player = minim.loadSnippet(audioID + ".mp3");
        player.play();
  
        println("Playing audio file " + audioID);
        println("Time passed: " + playTime/1000 + " seconds.");
  
        savedTime = millis(); 
        currentSound = audioID;
        currentLength = player.length();
        
        println("Audio file length: " + currentLength);
      }
    }
  }
  walker = walker + 1;
  if (walker == playerResolution) {
    walker = 0;
  }

  updatePixels();
}

