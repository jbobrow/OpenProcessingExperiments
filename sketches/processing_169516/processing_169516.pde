
import java.util.*;

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

/**
 * <h2>Spook Manor</h2>
 * <p>In this game you take the part of an inexperienced 
 * newspaper photographer sent by the paper's editor to 
 * a haunted house called Spook Manor. The camera has 
 * limited battery life and capacity, so it won't last 
 * more than 5 minutes or hold more than 20 photographs,
 * but it does have a zoom lens and a picture review mode
 * so you can delete unwanted pictures. Beware though 
 * this mode also uses the battery.</p>
 * <p> When the battery has run out or if you switch the
 * camera off your pictures will be laid out for the 
 * editor to see. </p>
 * 
 * <p>Sound effects - original sounds available at 
 * http://www.freesound.org and then edited with Audacity </p>
 * <p>Haunted house image - original source unknown 'layered'
 * by me using GIMP</p>
 *
 * @author Peter Lager 2014
 *
 */

String path = "spookmanor/";
PImage intro, house0, house1, trees, windows, sky, skymask;
float sceneAlpha = 0;

final int INTRO = 0;
final int PLAY = 1;
final int FINALE = 2;
// Sound effects
Minim minim;
Sound nighttime, shutter;
Sound[] storm  = new Sound[6];
int nextThunder;
// Ghosts and ghost paths
PImage[] ghosts  = new PImage[6];
GhostPathList[] gpList;
// Camera and scene
Camera cam;
PGraphics scene;
// Game play stuff
int gameState;
int gameStarted;
// Finale text
String finaleInst = "Press <R> to return to Spook Manor OR <I> for the Introduction";


public void setup() {
  size(748, 500);
  // Load sound effects
  minim = new Minim(this);
  storm[0] = new Sound(minim.loadSample(path + "storm0.mp3", 1024), false);
  storm[1] = new Sound(minim.loadSample(path + "storm1.mp3", 1024), false);
  storm[2] = new Sound(minim.loadSample(path + "storm2.mp3", 1024), false);
  storm[3] = new Sound(minim.loadSample(path + "storm3.mp3", 1024), false);
  storm[4] = new Sound(minim.loadSample(path + "storm4.mp3", 1024), false);
  storm[5] = new Sound(minim.loadSample(path + "storm5.mp3", 1024), false);
  nighttime = new Sound(minim.loadFile(path + "nightsound.mp3"), true);
  shutter = new Sound(minim.loadSample(path + "shutter.mp3"), false);
  // Load images
  intro = loadImage(path + "houseintro.jpg");
  house0 = loadImage(path + "house0.png");
  house1 = loadImage(path + "house1.png");
  windows = loadImage(path + "windows.png");
  trees = loadImage(path + "trees.png");
  sky = loadImage(path + "sky.jpg");
  skymask = loadImage(path + "skymask.png");
  // Load ghost images
  ghosts[0] = loadImage(path + "pumpkin.png");
  ghosts[1] = loadImage(path + "ghost1.png");
  ghosts[2] = loadImage(path + "ghost2.png");
  ghosts[3] = loadImage(path + "ghost3.png");
  ghosts[4] = loadImage(path + "ghost4.png");
  ghosts[5] = loadImage(path + "ghost5.png");
  // Create a buffer for the scene
  scene = createGraphics(748, 500);
  // Create the Pentax camera
  cam = new Camera();
  // Create the lists to store ghost paths by scene Z level
  gpList = new GhostPathList[4];
  for (int i = 0; i < gpList.length; i++)
    gpList[i] = new GhostPathList();
  // Read in the ghost paths from a text file
  readGhostPaths(path + "anims.txt");
  // Start with the introduction
  changeStateTo(INTRO);
}


public void keyTyped() {
  if ((gameState == FINALE) && key == 'r' || key == 'R') 
    changeStateTo(PLAY);
  if ((gameState == FINALE) && key == 'i' || key == 'I') 
    changeStateTo(INTRO);
  if (gameState == PLAY && key == ' ') {
    cam.takePhoto();
  }
}

// Creates the scene image to be displayed in PLAY state
void updateScene() {
  // Get the loudest storm sound and calculate the colour used
  // to tint the clouds
  float alpha = 0;
  for (Sound s : storm) alpha = max(alpha, s.getLevel());
  int col = color(255, 255, 200, 250 * alpha);
  // Start drawing
  scene.beginDraw();
  scene.background(255);
  scene.imageMode(CORNER);
  scene.noStroke();
  // Draw sky
  scene.image(sky, 0, 0);
  // Lightening on clouds
  scene.fill(col);
  scene.rect(0, 0, scene.width, scene.height);
  // Sky mask
  scene.image(skymask, 0, 0);
  //##########################
  // Behind window sprites  
  updateSpectre(gpList[0]);
  updateSpectre(gpList[1]);
  //##########################
  scene.image(windows, 0, 0);
  scene.image(house0, 0, 0);
  //##########################
  // Front entrance sprites
  updateSpectre(gpList[2]);
  //##########################
  scene.image(house1, 0, 0);
  //##########################
  // Behind tree sprites
  updateSpectre(gpList[3]);
  //##########################
  scene.image(trees, 0, 0);
  scene.endDraw();
}

// Update the ghost position. If the ghost has finished its
// path then change it.
void updateSpectre(GhostPathList al) {  
  if (al.hasAnims()) {
    GhostPath a = al.curr;
    scene.image(ghosts[a.entity], a.cx - 20, a.cy);
    a.update();
    if (a.isDone()) {
      al.changeAnimation();
    }
  }
}

// Main draw method
public void draw() {
  switch(gameState) {
  case INTRO:
    drawINTRO();
    break;
  case PLAY:
    drawPLAY();
    break;
  case FINALE:
    drawFINALE();
    break;
  }
}

// Draw the introduction scene
void drawINTRO() {
  image(intro, 0, 0);
}

// Draw the play game scene
void drawPLAY() {
  makeThunder();
  updateScene();
  pushMatrix();
  image(scene, 0, 0);
  stroke(255);
  strokeWeight(1);
  noFill();
  cam.display();
  popMatrix();
  if (cam.powerLeft() <= 0) {
    nighttime.stop();
    gameState = FINALE;
  }
}

// Draw the finale scene
void drawFINALE() {
  background(0, 148, 0);
  noStroke();
  fill(48);
  rect(0, 0, width, 445);
  fill(240);
  for (int i = 0; i < cam.photos.size (); i++) {
    int x = 24 + (i%5) * 145;
    int y = 25 + (i/5) * 105;
    rect(x - 4, y - 4, 128, 98);
    image(cam.photos.get(i), x, y);
  }
  text(finaleInst, (width - textWidth(finaleInst))/2, height - 10);
}

public void mouseClicked() {
  if (gameState == INTRO && mouseX > 616 && mouseX <=682 && mouseY > 422 && mouseY < 470)
    changeStateTo(PLAY);
}

// Read in the ghost paths from a text file
void readGhostPaths(String fname) {
  List<Waypoint> points = new ArrayList<Waypoint>();
  String[] lines = loadStrings(fname);
  int ln = 0;
  while (ln < lines.length) {
    String info = lines[ln++];
    points.clear();
    while (!lines[ln].startsWith ("#")) {
      points.add(new Waypoint(lines[ln++]));
    }
    ln++;
    GhostPath a = new GhostPath(info, points);
    if (a.sceneZ >= 0 && a.sceneZ < gpList.length)
      gpList[a.sceneZ].add(a);
  }
}

// If we are ready start another thunder roll
void makeThunder() {
  if (millis() > nextThunder) {
    int n = (int) random(0, storm.length);
    nextThunder = millis() + storm[n].length() - 2100;
    storm[n].play();
  }
}

// State changer
void changeStateTo(int state) {
  // Leaving current state actions
  switch(gameState) {
  case INTRO:
    break;
  case PLAY:
    nighttime.stop();
    break;
  case FINALE:
    break;
  }
  // Change state
  gameState = state;
  // New state starting actions
  switch(gameState) {
  case INTRO:
    cursor(ARROW);
    break;
  case PLAY:
    textSize(12);
    cam.reset();
    nighttime.play();
    nextThunder = millis() + 1000;
    gameStarted = millis();
    noCursor();
    break;
  case FINALE:
    textSize(14);
    cursor(HAND);
    break;
  }
}

/**
 * A list of ghost paths for a particular scene Z level
 */
class GhostPathList {
  List<GhostPath>  anims = new ArrayList<GhostPath>();
  GhostPath curr = new GhostPath();

  void add(GhostPath a) {
    anims.add(a);
  }

  void changeAnimation() {
    if (anims.size() == 1)
      curr = anims.get(0);
    else {
      GhostPath a = curr;
      do {
        curr = anims.get((int) random(0, anims.size()));
      } 
      while (a == curr);
    }
    curr.start();
  }

  boolean hasAnims() {
    return !anims.isEmpty();
  }
}

/**
 * Represents a path to be followed by a ghost
 */
class GhostPath {
  final int sceneZ;
  final int entity;
  final Waypoint[] waypoints;

  int startedAt, elapsedTime, pn;
  int cx, cy;

  boolean running = false;


  GhostPath() {
    sceneZ = 0;
    entity = 1;
    waypoints = null;
    cx = cy = -1000;
  }

  GhostPath(String info, List<Waypoint> points) {
    String[] bits = split(info, " ");
    sceneZ = Integer.parseInt(bits[0]);
    entity = Integer.parseInt(bits[1]);
    waypoints = points.toArray(new Waypoint[points.size()]);
  }

  void start() {
    startedAt = millis();
    elapsedTime = 0;
    pn = 1;
    cx = waypoints[0].x;
    cy = waypoints[0].y;
    running = true;
  }

  void update() {
    if (running) {
      elapsedTime = millis() - startedAt;
      if (elapsedTime > waypoints[pn].t) 
        pn++;
      // See if we have reached the end of the animation
      if (pn >= waypoints.length) {
        cx = waypoints[pn-1].x;
        cy = waypoints[pn-1].y;
        running = false;
      } else {
        cx = round(map(elapsedTime, waypoints[pn-1].t, waypoints[pn].t, waypoints[pn-1].x, waypoints[pn].x));
        cy = round(map(elapsedTime, waypoints[pn-1].t, waypoints[pn].t, waypoints[pn-1].y, waypoints[pn].y));
      }
    }
  }

  boolean isDone() {
    return !running;
  }

  public String toString() {
    String s = "Level   " + sceneZ + "\n";
    s += "Entity  " + entity + "\n";
    for (Waypoint wp : waypoints)
      s += "  " + wp.toString() + "\n";
    s+= "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~";
    return s;
  }
}

/**
 * Position and time expected along a ghost path
 */
class Waypoint {
  public final int x;
  public final int y;
  public final int t;

  Waypoint(String wp) {
    String[] s = split(wp, " ");
    x = Integer.parseInt(s[0]);
    y = Integer.parseInt(s[1]);
    t = Integer.parseInt(s[2]);
  }

  public String toString() {
    return "[" + x + ", " + y + "]   " + t;
  }
}

/**
 * Wrapper for AudioPlayer and AudioSource objects from
 * the Minim library
 */
class Sound {
  final int UNKNOWN = 0;
  final int PLAYER = 1;
  final int SAMPLE = 2;

  final AudioSource source;
  final int type;
  int started;
  final boolean loop;
  float peak;

  Sound(AudioSource source, boolean loop) {
    this.source = source;
    this.loop = loop;
    if (source instanceof AudioPlayer)
      type = PLAYER;
    else if (source instanceof AudioSample)
      type = SAMPLE;
    else
      type = UNKNOWN;
  }

  float getLevel() {
    return source.left.level();
  }

  void play() {
    switch(type) {
    case SAMPLE:
      ((AudioSample)source).trigger();
      started = millis();
      break;
    case PLAYER:
      AudioPlayer player = (AudioPlayer) source;
      if (!player.isPlaying()) {
        player.rewind();
        if (loop)
          player.loop();
        else
          player.play();
      }
      break;
    case UNKNOWN:
      println("Can't play this");
    }
  }

  boolean isPlaying() {
    switch(type) {
    case SAMPLE:
      return (millis() - started) < length();
    case PLAYER:
      return ((AudioPlayer)source).isPlaying();
    default:
      return false;
    }
  }

  int length() {
    switch(type) {
    case SAMPLE:
      return ((AudioSample)source).length();
    case PLAYER:
      return ((AudioPlayer)source).length();
    default:
      return 0;
    }
  }

  void stop() {
    switch(type) {
    case SAMPLE:
      ((AudioSample)source).stop();
    case PLAYER:
      ((AudioPlayer)source).pause();
    }
  }
}

/**
 * The Pentax camera object
 */
public class Camera {
  // Constants
  final int MAX_POWER = 300000; // 5 minutes
  final int MOVE = 101;
  final int ADJUST = 102;
  // Camera position and mouse offset
  int px = 0, py = 0; // Top left corner of camera
  int offX, offY; // offset to mouse position
  PImage body;
  PImage mask;
  PGraphics viewer;
  // Photographs
  List<PImage> photos = new ArrayList<PImage>();
  // Viewer variables
  int cvWidth = 120, cvHeight = 90;
  float mag = 1.3f;     // zoom level
  float k = -0.000014f;  // very slight fish eye effect;

  int mode = MOVE;
  // ADJUST mode stuff
  boolean reviewPhotos = false;
  int reviewPhotoNbr = -1;
  int control = 0;

  int lastPhotoTime;
  int powerUsed = 0;

  Camera() {
    body = loadImage(path + "camera.png");
    mask = loadImage(path + "cameramask.png");
    viewer = createGraphics(cvWidth, cvHeight);
    registerMethod("mouseEvent", this);
  }

  // Reset the camera back to it starting state
  void reset() {
    offX = 174;
    offY = 70;
    px = mouseX - offX;
    py = mouseY - offY;
    mode = MOVE;
    powerUsed = 0;
    lastPhotoTime = millis() - 10000;
    photos.clear();
  }

  void display() {
    updateViewer(px + 80, py + 75);
    pushMatrix();
    translate(px, py);
    image(body, 0, 0);
    if (cam.reviewPhotos) {
      image(cam.photos.get(reviewPhotoNbr), 20, 30);
      //image(cam.getReviewPhoto(), 20,30);
      noStroke(); 
      fill(0, 255, 0);
      String s = "< " + (reviewPhotoNbr + 1) + " of " + photos.size() + " >";
      text(s, 30, 110);
    } else {
      image(viewer, 20, 30);
      drawZoomGuage();
    }
    drawPowerGuage();
    drawCapacityGuage();
    popMatrix();
  }

  void drawCapacityGuage() {
    int n = 0;
    noStroke();
    for (int r = 0; r < 4; r++)
      for (int  c = 0; c < 5; c++) {
        int f = (n++ < photos.size()) ? color(250) : color(64) ;
        fill(f);
        rect(180 + c * 8, 42 + r * 6, 4, 3);
      }
  }

  void drawPowerGuage() {
    float p = ((float) powerLeft()) / MAX_POWER;
    int pl = powerLeft();
    noStroke();
    fill(96);
    rect(155, 34, 6, 46);
    if (pl < 60000)
      fill(200, 0, 0);
    else if (pl < 120000)
      fill(200, 180, 0);
    else
      fill(0, 200, 0);
    int h = 2 + round(46 * p);
    rect(155, 80 - h, 6, h);
  }


  void drawZoomGuage() {
    if (control == 1 || control == 2) {
      mag += ((control == 1) ? -1 : 1) * 0.005f;
      mag = constrain(mag, 0.8f, 2.2f);
      noStroke(); 
      fill(255); 
      rect(40, 40, 80 * (mag-0.8f) / 1.4f, 8);
      stroke(255); 
      strokeWeight(2); 
      noFill();
      rect(40, 40, 80, 8);
    }
  }

  void updateViewer(int x, int y) {
    if (!paused()) {
      int w2 = cvWidth/2;
      int h2 = cvHeight/2;
      viewer.beginDraw();
      for (int vd = - h2; vd < h2; vd++) {
        for (int ud = - w2; ud < w2; ud++) {
          float f = mag + k * (ud*ud + vd*vd);
          int u = floor(ud/f) + x;
          int v = floor(vd/f) + y;
          if (u >= 0 && u < scene.width && v >=0 && v < scene.height)
            viewer.set(ud + w2, vd + h2, scene.get(u, v));
          else 
            viewer.set(ud + w2, vd + h2, color(10));
        }
      }
      viewer.endDraw();
    }
  }

  void takePhoto() {
    if (gameState != PLAY || mode != MOVE) return;
    if (powerLeft() > 5000) {
      if (photos.size() < 20 && !paused()) {
        shutter.play();
        lastPhotoTime = millis();
        photos.add(viewer.get());
        powerUsed += 8000;
      }
    }
  }

  boolean paused() {
    return (millis() - lastPhotoTime) < 700;
  }

  // Calculate an return the power left in milliseconds
  int powerLeft() {
    return MAX_POWER - millis() + gameStarted - powerUsed;
  }

  // Use the camera mask image to see which control mouse is over
  int getControl(int x, int y) {
    int control = 0;
    if (x >= 0 && x < mask.width && y >= 0 && y < mask.height)
      control = mask.get(x, y) & 255;
    if (control >= 1 && control <= 7)
      cursor(HAND);
    else
      cursor(CROSS);
    return control;
  }

  public void mouseEvent(MouseEvent event) {
    if (gameState != PLAY) return;
    int mx = event.getX();
    int my = event.getY();
    if (event.isShiftDown()) {
      mode = ADJUST;
    } else {
      mode = MOVE;
      reviewPhotos = false;
      reviewPhotoNbr = -1;
    }
    switch(event.getAction()) {
    case MouseEvent.PRESS:
      if (mode == ADJUST)
        control = getControl(offX, offY);
      break;
    case MouseEvent.CLICK:
      if (mode == ADJUST) {
        if (control ==  7) {
          reviewPhotos = false;
          changeStateTo(FINALE);
        } else if (control == 3 && photos.size() > 0) {
          reviewPhotos = !reviewPhotos;
          if (reviewPhotos) {
            reviewPhotoNbr = photos.size()-1;
            powerUsed += 2000;
          }
        }
        if (reviewPhotos) {
          switch(control) {
          case 4:
            if (reviewPhotoNbr > 0) reviewPhotoNbr--;
            powerUsed += 2000;
            break;
          case 5:
            if (reviewPhotoNbr < photos.size() - 1) reviewPhotoNbr++;
            powerUsed += 2000;
            break;
          case 6:
            photos.remove(reviewPhotoNbr);
            reviewPhotoNbr--;
            if (reviewPhotoNbr < 0)
              reviewPhotos = false;
            powerUsed += 4000;
            break;
          }
        }
      }
      break;
    case MouseEvent.RELEASE:
      if (control < 3 || control > 7) {
        reviewPhotos = false;
        control = 0;
      }
      break;
    case MouseEvent.MOVE:
      if (mode == MOVE) {
        px = mx - offX;
        py = my - offY;
        noCursor();
      } else {
        offX = mx - px;
        offY = my - py;
        getControl(offX, offY);
      }
      break;
    case MouseEvent.DRAG:
      if (mode == MOVE) {
        px = mx - offX;
        py = my - offY;
        noCursor();
      } else {
        offX = mx - px;
        offY = my - py;
        getControl(offX, offY);
      }
      break;
    }
  }
}


