
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/14359*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/* Tweaked by Nigel Davison*/
import geomerative.*;

ImgProc imgProc = new ImgProc();
RFont font;

String inp = "", lastText;
String zin = "Student-Hub. Napier.Uni Academic.Skills Careers&Futures Council-Tax Counselling";//altered the text here to display Student Hub. Napier

int fontSize = 60;//changed font size
int currWord = 0;//this selects which word displays first

int[] currFrame;
int[] prevFrame;
int[] tempFrame;
String[] words = split(zin, " ");

boolean newtext = true, auto = true, pauze = false;

ArrayList seekers, coords;

void setup() {
  size(1024,500);//changed screen size
  noCursor();
  stroke(0,0,0);//tried to add a stroke to the font but this does not seem to work
  strokeWeight(2);
  RG.init(this);
  font = new RFont("segoeuil.ttf", fontSize, RFont.CENTER);//changed font by including a font in the data folder and naming it here
  seekers = new ArrayList();
  coords = new ArrayList();

  //noCursor();
  cursor();
  fill(0);
  frameRate(30);//adjusts the frame rate of the animation


  //imgProc
  currFrame = new int[width*height];
  prevFrame = new int[width*height];
  tempFrame = new int[width*height];
  for(int i=0; i<width*height; i++) {
    currFrame[i] = color(0);
    prevFrame[i] = color(0);
    tempFrame[i] = color(0);
  }
}

void draw() {
  
  imgProc.blur(prevFrame, tempFrame, width, height);
  arraycopy(tempFrame, currFrame);

  if((frameCount == 1) && auto) {
    inp = words[currWord];
  }

  RGroup grp = font.toGroup(inp);
  RCommand.setSegmentLength(1);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  RPoint[] pnts = grp.getPoints();

  if(pnts != null) {
    if(newtext) {
      coords = new ArrayList();
    }
    if(pnts.length > 0) {
      update(pnts.length, pnts, 4);
    }
    if(newtext) {
      newtext = false;
    }

    //add seekers if there are more points than seekers
    checkSeekerCount(pnts.length);

    if(auto) {
      if(arrived() == 100) {
        pauze = true;
      }
      if(arrived() == 0 && pauze && seekers.size() == 0){
        println("nieuw");
        if(currWord < words.length-1) {
          currWord++;
          inp = words[currWord];
        }
        else {
          currWord = 0;
          inp = words[currWord];
        }
        pauze = false;
      }
      
    }
  }
  else {
    seekers = new ArrayList();
  }
  if(inp != lastText) {
    newtext = true;
  }
  lastText = inp;
  imgProc.drawPixelArray(currFrame, 0, 0, width, height);  
  arraycopy(currFrame, prevFrame);
}






// Arrive
// Credits: Daniel Shiffman <http://www.shiffman.net>

class Boid {

  PVector loc, vel, acc;
  float r, maxforce, maxspeed;
  boolean arrived;
  int c;

  Boid(PVector l, float ms, float mf, int c, boolean arrived) {
    //acc = new PVector(0,0);
    //vel = new PVector(0,0);
    acc = new PVector(mouseX,mouseY);//Changed the greyed out code above to this to add mouse control
    vel = new PVector(mouseX,mouseY);
    loc = l.get();
    r = 1.0;
    maxspeed = ms;
    maxforce = mf;
    this.c=c;
    this.arrived = arrived;
  }

  // Method to update location
  void update() {
    // Update velocity
    vel.add(acc);
    // Limit speed
    vel.limit(maxspeed);
    loc.add(vel);
    // Reset accelertion to 0 each cycle
    acc.mult(0);
  }

  void arrive(PVector target) {
    acc.add(steer(target,true));
  }

  // A method that calculates a steering vector towards a target
  // Takes a second argument, if true, it slows down as it approaches the target
  PVector steer(PVector target, boolean slowdown) {
    PVector steer;  // The steering vector
    PVector desired = PVector.sub(target,loc);  // A vector pointing from the location to the target
    float d = desired.mag(); // Distance from the target is the magnitude of the vector
    // If the distance is greater than 0, calc steering (otherwise return zero vector)
    if (d > 0) {
      // Normalize desired
      desired.normalize();
      // Two options for desired vector magnitude (1 -- based on distance, 2 -- maxspeed)
      if ((slowdown) && (d < 100.0f)) desired.mult(maxspeed*(d/100.0f)); // This damping is somewhat arbitrary
      else desired.mult(maxspeed);
      // Steering = Desired minus Velocity
      steer = PVector.sub(desired,vel);
      steer.limit(maxforce);  // Limit to maximum steering force
    } 
    else {
      //steer = new PVector(0,0);
      steer = new PVector(mouseX,mouseX);//added mouse control
    }
    return steer;
  }
}

class Point {
  float x, y, z;
  boolean arrived;

  Point(float x, float y, boolean arrived) {
    this.arrived = arrived;
    this.x = x;
    this.y = y;
  }
}

// ImgProc by Marcin Ignac
// http://www.marcinignac.com/

public class ImgProc {

  void ImgProc() {
  }

  void drawPixelArray(int[] src, int dx, int dy, int w, int h) {  
    loadPixels();
    int x;
    int y;
    for(int i=0; i<w*h; i++) {
      x = dx + i % w;
      y = dy + i / w;
      pixels[x  + y * w] = src[i];
    }
    updatePixels();
  }

  void blur(int[] src, int[] dst, int w, int h) {
    int c;
    int r;
    int g;
    int b;

    for(int y=1; y<h-1; y++) {
      for(int x=1; x<w-1; x++) {      
        r = 0;
        g = 0;
        b = 0;
        for(int yb=-1; yb<=1; yb++) {
          for(int xb=-1; xb<=1; xb++) {
            c = src[(x+xb)+(y-yb)*w];      
            r += (c >> 16) & 0xFF;
            g += (c >> 8) & 0xFF;
            b += (c) & 0xFF;
          }
        }      
        r /= 9;
        g /= 9;
        b /= 9;
        //dst[x + y*w] = 0xFF050000 | (r << 16) | (g << 8) | b; // changing *w to *h changes the sketch completely
        dst[x + y*w] = 0xFF050000 | (r << 16) | (g << 8) | b;//changed FF000000 to FF100000 which generated red blob in background
      }
    }
  }
}

float arrived() {
  float arrived = 0;
  if(coords != null) {
    for(int i = 0; i < seekers.size(); i++) {
      Boid seeker = (Boid) seekers.get(i);
      if(seeker.arrived == true) {
        arrived++;
      }
    }
    return (arrived/coords.size())*100;
  }
  else {
    return 0;
  }
}

void checkSeekerCount(int count) {
  if(count > 1) {
    if((seekers.size() < count) && (!pauze)) {
      for(int y = 0; y < 15; y++) {
        //int px = (int) random(width);
        //int py = (int) random(height);
        int px = (int) random(mouseX);//Changed the greyed out code above to have mouse control, this affects the direction of particles
        int py = (int) random(mouseX);
        int c = color(255,255,175);//changed text colour to off white 
        newSeeker(px,py,c);
      }
    }
    if((seekers.size() > count)) {
      for(int z = 0; z < (seekers.size() - count); z++) {
        seekers.remove(seekers.size()-1);
      }
    }
    if(pauze && seekers.size() > 15) {
      for(int z = 0; z < 15; z++) {
        seekers.remove(0);
      }
    }
    else if(pauze && seekers.size() > 0) {
      if((frameCount % 10) == 0) {
        seekers.remove(0);
      }
    }
  }
}

void newSeeker(float x, float y, int c) {
  float maxspeed = random(13,20);
  float maxforce = random(0.5, 0.6);
  seekers.add(new Boid(new PVector(x,y),maxspeed,maxforce,c,false));
}

void update(int count, RPoint[] pnts, int baseR) {
  for ( int i = 0; i < count; i++ )
  {
    float mx = (pnts[i].x)+width/2;
    float my = (pnts[i].y)+height/2;

    if(newtext) {
      coords.add(new Point(mx, my, false));
    }

    if((i < seekers.size()) && (i < coords.size())) {
      Boid seeker = (Boid) seekers.get(i);
      Point coord = (Point) coords.get(i);
      if(!pauze) {
        seeker.arrive(new PVector(coord.x,coord.y));
        seeker.update();
      }
      if((seeker.loc.x >= 0) && (seeker.loc.x < width-1) && (seeker.loc.y >= 0) && (seeker.loc.y < height-1)) {
        int currC = currFrame[(int)seeker.loc.x + ((int)seeker.loc.y)*width];
        currFrame[(int)seeker.loc.x + ((int)seeker.loc.y)*width] = blendColor(seeker.c, currC, ADD);
      }

      if(((seeker.loc.x > mx-1) && (seeker.loc.x < mx+1)) && ((seeker.loc.y > my-1) && (seeker.loc.y < my+1)) && (coord.arrived == false)) {
        seeker.arrived = true;
      }
      else {
        seeker.arrived = false;
      }
    }
  }
}

void keyPressed () {
  if(auto == false) {
    if (  keyCode == DELETE || keyCode == BACKSPACE ) {
      if ( inp.length() > 0 ) {
        inp = inp.substring(0,inp.length()-1);
      }
    }
    else if (key != CODED) {
      inp = inp + key;
    }
  }
}

void mouseReleased() {
  //skip word
  pauze =! pauze;
}



