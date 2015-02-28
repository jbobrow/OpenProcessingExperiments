

// fieldlines of magnetic poles
// loosely based on code by http://www.reallyslick.com/
// author: toxi@toxi.co.uk
// version: 09/06/03

import processing.pdf.*;

boolean record;


//Schieber unten links in der Ecke ändert den Durchmesser der Kreise, aus denen die Linien gehen


String  punkte [];
float[][] points;

//Anzahl der Pole
static final int NUM_POLES		= 43;
//der aussenstehende rennt bei höherer zahl wild rum
static final int MAX_CHARGE             = 4;

static final int POS_CHARGE_COLOUR      = 0x004011;
static final int NEG_CHARGE_COLOUR      = 0x00c0ff;
// länge der magnetlinien
static final int NUM_MAX_STEPS		= 20;
//ändert die feingliedrigkeit der linien
static final int MIN_STEP_SIZE		= 6;
// auch. bei großer zahl sind nur lange striche, keine linien mehr
static final int MAX_STEP_SIZE		= 28;

static final int BASE_STEP		= MIN_STEP_SIZE+(MIN_STEP_SIZE+MAX_STEP_SIZE)/2;

static final float MOD_SPEED		= 0.2f;
static final float MIN_LATHE_SPEED	= 0.3f;
//Anziehungskraft vom Aussenstehendem? Je höher, desto eher geht der zu den anderen 4 und lässt sich nicht mehr kontrollieren
static final float FORCE_FACTOR         = 20;

static final float MAX_FORCE_STEP       = 15;
//Wo ist der unterschied zum force factor?
static final float ATTRACTOR            = -2.5f;

static final int DISTANCE_LIMIT         = 90000;
static final int MIN_DISTANCE           = 100*100;

// Zeichenfeldgröße
static final int WIDTH			= 800;
static final int HEIGHT			= 800;



Pole[]  poles;

float stepSize;
int maxSteps;

float modAngle;
float latheSpeed;

HScrollbar  slider;

void setup() {
  size(800,800);
    punkte = loadStrings ("punkte.txt");

  background(0);
  
  initPoles();
  slider=new HScrollbar(10, HEIGHT-10, 100, 5, 2);
 // start at 20% step width;
  slider.setPos( 0);
}

 
float f = 1;


void draw() {
//  if (record) {
//    // Note that #### will be replaced with the frame number. Fancy!
//    beginRecord(PDF, "frame-2.pdf"); 
//  }

  background(0);
  smooth ();
      
      translate (100,20);
   
  
  
  //nimmt den beweglichen pole mit der maus mit
//  if (pmouseX!=mouseX || pmouseY!=mouseY) {
//    //pole[0].x=0;   
//    //pole[0].x=0;  , dann würde er nur oben in der linken ecke hängen
//    poles[0].x=mouseX;
//    poles[0].y=mouseY;
//  }

  slider.update();
  stepSize=MIN_STEP_SIZE+(slider.getPos()*(MAX_STEP_SIZE-MIN_STEP_SIZE)/100);

  // increase number of steps until we reach maximum
  // nimmt man den raus, sind die magnetlinien ganz kurz
  if (maxSteps<NUM_MAX_STEPS) maxSteps=min(maxSteps+1, NUM_MAX_STEPS);

  float s = sqrt(stepSize *stepSize * 0.3f);

  // update charges of the poles before re-drawing the field
  for (int i=0; i<poles.length; i++) poles[i].update(poles);

  // draw fieldlines around poles
  // number depends on latheSpeed (step angle in radians)
  for (int i=0; i<poles.length; i++) {
    for (float j=poles[i].chargeMod*2; j<poles[i].chargeMod*2+TWO_PI; j+=latheSpeed) {
        poles[i].drawFieldLine(poles, i, s*cos(j), s*sin(j));
    }
  }
  // gradually introduce more fieldlines until max. number is reached
  latheSpeed=max(latheSpeed*0.9f, MIN_LATHE_SPEED);

  // slider always on top
  slider.draw();
  
   if (record) {
    endRecord();
	record = false;
  }
}

// Wenn ich Leertaste drücke, macht er neu
//void keyPressed() {
//  if (key==' ') initPoles();
//}

  
synchronized void initPoles() {
  poles = new Pole[punkte.length];
  float charge=1;
  for (int i=0; i<punkte.length; i++){
      int[] list = int(split (punkte[i], ','));
      poles[i] = new Pole(charge, i, list[0], list[1]);
    charge=-charge;
  }
  maxSteps=2;
  latheSpeed=radians(330);
}

class Pole {
  int x, y, xOriginal, yOriginal;
  int id;
  float baseCharge;
  float charge;
  float chargeMod;
  float chargeModSpeed;
  float chargeModAmp;

  // note: i had to use the java Math object in the class constructor due to some P5 parser bug
  Pole(float c, int _i, int _x, int _y) {
    
    baseCharge = (float)(c*(Math.random()+0.2f)*MAX_CHARGE);
    chargeMod=(float)(Math.random()*3.1415926f);
    chargeModSpeed=(float)(Math.random()*0.12f)+0.01f;
    chargeModAmp=(float)(Math.random()*MAX_CHARGE)+0.2f;
    id = _i;
    x = _x;
    y = _y;
    xOriginal = _x;
    yOriginal = _y;
  }

  void update(Pole[] siblings) {
    float force=0;
    float distSQ=1;
    charge=baseCharge+chargeModAmp*sin(chargeMod);
    chargeMod+=chargeModSpeed;
    for (int i=0; i<siblings.length; i++) {
      if (siblings[i]!=this) {
        int dx=x-siblings[i].x;
        int dy=y-siblings[i].y;
        distSQ=min((dx*dx+dy*dy), DISTANCE_LIMIT);
        force=min(random(FORCE_FACTOR, FORCE_FACTOR*1.5f)*(abs(charge)+abs(siblings[i].charge))/distSQ, MAX_FORCE_STEP);
        if (distSQ>MIN_DISTANCE && ((charge<0 && siblings[i].charge>0) || (charge>0 && siblings[i].charge<0))) force*=ATTRACTOR;
        x+=force*dx;
        y+=force*dy;
        if (id!=0) {
          x = xOriginal;
          y = yOriginal;
        }
      }
    }
  }

  // move pole to a new position
  void setPosition(int xx, int yy) {
    x=xx;
    y=yy;
  }

  // draws a single fieldline starting from the current instance
  // direction of the line is influenced by all other poles passed in an array to this method

  void drawFieldLine(Pole[] poles, int id, float xdir, float ydir) {
    float charge=poles[id].charge;
    int lastx=poles[id].x;
    int lasty=poles[id].y;
    int x=(int)(lastx+xdir);
    int y=(int)(lasty+ydir);
    float rep=0;
    float distSQ;
    float dist;
    float distRec=0;

    int col;

    if (charge<0) col = NEG_CHARGE_COLOUR;
    else col = POS_CHARGE_COLOUR;

    int r = col>>16&0xff;
    int g = col>>8&0xff;
    int b = col&0xff;

    int endx=0, endy=0;
    int i;

    int offx=2;
    int offy=4;
    float offc=1;

    beginShape(  );

    for (i=0; i<maxSteps; i++) {
      xdir=ydir=0;
      for (int j=0; j<poles.length; j++) {
        rep=charge * poles[j].charge;
        float tx=x-poles[j].x;
        float ty=y-poles[j].y;
        distSQ = tx*tx + ty*ty;
        dist=sqrt(distSQ);
        if (dist < stepSize && i>2) {
          endx=poles[j].x;
          endy=poles[j].y;
          i=10000;
        }
        tx/=dist;
        ty/=dist;
        if (distSQ<1) distSQ=1;
        xdir+=tx*rep/distSQ;
        ydir+=ty*rep/distSQ;
      }

      distSQ=xdir*xdir + ydir*ydir;
      distRec=stepSize / sqrt(distSQ);
      xdir*=distRec;
      ydir*=distRec;
      lastx=x;
      lasty=y;
      x+=xdir;
      y+=ydir;

      // do manual clipping before sending invisible triangles to the vertex queue, should save some time
      if (lastx>-offx && lastx<=WIDTH && lasty>-offy && lasty<=HEIGHT && x>-offx && x<=WIDTH && y>-offy && y<=HEIGHT) {

        stroke((int)(0xc8*offc), (int)(0xff*offc), 0x00);
        stroke(244, 120);
        noFill();

      if(id%2==0)  vertex(lastx-offx, lasty-offy);
      }
      offc*=0.8;
    }

    //    if (i>=10000) {
    //      fill(r,g,b,0);
    //      vertex(endx,endy);
    //    }
    endShape();
  }  
}

// casey's scrollbar class

class HScrollbar
{
  int swidth, sheight;    // width and height of bar
  int xpos, ypos;         // x and y position of bar
  float spos, newspos;    // x position of slider
  int sposMin, sposMax;   // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  HScrollbar (int xp, int yp, int sw, int sh, int l) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + swidth/2 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
  }

  void update() {
    if (over()) {
      over = true;
    } 
    else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if (abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  int constrain(int val, int minv, int maxv) {
    return min(max(val, minv), maxv);
  }

  boolean over() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
      mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } 
    else {
      return false;
    }
  }

  void draw() {
    fill(255);
    stroke(255);
    rect(xpos, ypos, swidth, sheight);
    if (over || locked) {
      fill(0xff, 0, 0);
    } 
    else {
      fill(102, 102, 102);
    }
    rect(spos, ypos, sheight, sheight);
  }

  float getPos() {
    // convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }
  void setPos(float val) {
    newspos=spos=xpos+val/ratio;
  }
}


void keyPressed(){  record = true;

}  

