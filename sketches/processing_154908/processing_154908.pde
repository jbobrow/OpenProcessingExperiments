
// by Alyn Gwyndaf for FutureLearn Creative Coding, at Monash University
// digit keys restart with different number of waves
// drag the moon to adjust overall brightnss, and illumination of waves

//Declarations
int points;
float scaling;
int waveCount;
ArrayList<Wave> TheseWaves;
float moonX, moonY;
color bgFill;
color skyFill;
Moon thisMoon;
float Horizon;

//Setup
void setup() {
  colorMode(HSB,360,100,100,100);
  size(500,300);
  Horizon = 80;
  points = height;  //step between points from 1 to width
  scaling = width / (float)points;
  thisMoon = new Moon(random(50,width-50),random(0, Horizon),10);
  bgFill = color(193.39,thisMoon.Moon_Height * 50, 100);
  skyFill = color (260,30,10,100); 
  background(skyFill);
  waveCount = 4;
  makeWaves(waveCount);
} // end of setup

void makeWaves(int numWaves) {
  TheseWaves = new ArrayList<Wave>();
  for (int i=0; i< numWaves; i++) {
    float wave_loc = Horizon + random(0,Horizon);
    TheseWaves.add( new Wave(wave_loc));
  }
} //end of makeWaves

//Draw
void draw() {
  //blendMode(BLEND);
  noStroke();
  fill(skyFill);
  rect(0,0,width,Horizon); // dark sky
  bgFill = color(193,39,thisMoon.Moon_Height * 50, 8);
  fill(bgFill); // sea colour
  rect(0, Horizon, width, height-Horizon); //colour sea
  //
  thisMoon.create();
  for (int i=0; i< TheseWaves.size(); i++) {
    Wave thisWave = TheseWaves.get(i);
    thisWave.move();
    // test for wave collision > ripple behaviour
    for (int j=0; j<i; j++) {
      Wave thatWave = TheseWaves.get(j);
      if ( ( abs(thisWave.y_current - thatWave.y_current) < 1) && (thisWave.inWard != thatWave.inWard) ) {
        thisWave.ripple();
        thatWave.ripple();
        // try to create new wave when two crash
        // TheseWaves.add( new Wave(thisWave.y_current));

      } // end ripple test
    } // end for thatWave
   thisWave.visual();

  } //end for thisWave
} //end of draw


void keyPressed() {
  if ( (key >= '0') && (key <= '9') ) {
    waveCount = (int)key - 48;
    frameCount = 0;
    makeWaves(waveCount);
  }
}
    
void mouseDragged() {
  if ( dist(thisMoon.MoonX, thisMoon.MoonY, mouseX, mouseY) < 10 ) {
    thisMoon.MoonX = mouseX;
    thisMoon.MoonY = mouseY;
//    bgFill = color(240,65,thisMoon.Moon_Height * 50, 90);  
//    rect(0, Horizon, width, height-Horizon); //colour sea when mooon moves


  }
}

void mousePressed() {
    if ( dist(thisMoon.MoonX, thisMoon.MoonY, mouseX, mouseY) < 10 ) {
      thisMoon.Moon_Bright = thisMoon.Moon_Bright-20;
    }
}

void mouseReleased() {
    if ( dist(thisMoon.MoonX, thisMoon.MoonY, mouseX, mouseY) < 10 ) {
      thisMoon.Moon_Bright = 100;
    }
}
  


  


// define class Moon
class Moon {

// declarations
float MoonX, MoonY, Moon_Size, Moon_Bright, Moon_Glow, Moon_Height;

// constructor
Moon (float Xpos, float Ypos, float Big) {
  MoonX = Xpos;
  MoonY = Ypos;
  Moon_Size = Big;
  Moon_Bright = 100;
  Moon_Glow = 5;
  Moon_Height = (Horizon - MoonY) / Horizon;

}
// end constructor

void create() {
  ellipseMode(RADIUS);
  //blendMode(BLEND);
  noStroke();
  fill(230,0,Moon_Bright,70);
  ellipse(MoonX, MoonY, Moon_Size+Moon_Glow, Moon_Size+Moon_Glow);
  fill(230,0,Moon_Bright,100);
  ellipse(MoonX, MoonY, Moon_Size, Moon_Size);
  Moon_Height = (Horizon - MoonY) / Horizon;
  //edge conditions
  if (MoonY + Moon_Size + Moon_Glow > Horizon ) {
    rectMode(CORNER);
    fill(bgFill);
    //can now make moon under water with rect for sea in front
    rect(MoonX-Moon_Size-Moon_Glow,Horizon,(Moon_Size+Moon_Glow)*2, (Moon_Size+Moon_Glow)*2);
    //prevent moon going too far down
    MoonY = (MoonY-Horizon > 5) ? Horizon + 5 : MoonY;
  }
}
//end Moon.create

  
}
// end class
// define Wave class

class Wave {
  //declarations and defaults
  float y_origin=height/2;
  float y_current = y_origin;
  float waveHeight = 50; //height over overall sine
  float phaseShift = 0;
  float moveTravel = 25;
  float moveSpeed = .5; //maximum
  boolean inWard = true;
  float[] waveShape;
  float[] waveBright;
  float strengthHeight=1; //opacity or strength of wave
  float strengthThick = 5; //set maximum
  
  //Constructor
  Wave(float y_orig) {
    y_origin = y_orig;
    moveTravel = height-y_origin;
    waveHeight = waveHeight * random(.5,1);
    phaseShift = random(0,180);
    moveSpeed = moveSpeed * random(.1,1);
    strengthThick = strengthThick * random (0,1);
    waveShape = new float[points];
    waveBright = new float[points];
    create();
    smooth();
    
  } //end of constructor

  //originate wave waveShape runs -1 to +1
  void create() {
    for (int i=0; i<points; i++) {
      waveShape[i] = (sin(radians(i)/2+phaseShift) + random(0,1))/2;
      waveBright[i] = 100;
      // waveShape[i] = random(0,1);
    }
  } //end of origination
    
  //smooth wave
  void smooth() {
    int smoothMargin = 2;
    float avgPoints = (float)smoothMargin * 2 + 1;
    for (int i=0; i<points-1; i++) {
      float waveSum = 0;
      for (int j = i-smoothMargin+1; j <= i+smoothMargin-1; j++) {
        j = (j <= 0) ? 0 : j;
        j = (j >= points-1) ? points-1 : j;
        // println("i = ",i,"j = ",j);
        /*
        if ( (j<0) || (j>points-1) ) {
          println("Error");
          exit();
        }
        */
        waveSum += waveShape[j];
        //println(waveSum);
      }
      waveShape[i]=waveSum/avgPoints;
    }
  } // end of smoothing  
    
  
  // move method
  void move() {
    //calculate wave position and points
    float y_old = y_current;
    float travelFrac = (1-(cos(radians(frameCount*moveSpeed))))/2;
    y_current = y_origin + moveTravel * travelFrac;
    //strengthHeight = sin(travelFrac * PI)*255;
    strengthHeight = 1 - abs(travelFrac-0.5)*2;
    inWard = ( y_current > y_old ) ? true : false;
    } // end of move
  
  // create method to redraw wave
  void visual() {
    //blendMode(BLEND);
    //draw the wave
      for (int i=0; i< points-1; i++) {
        float x_pos = (float)i * scaling;
        float y_pos = y_current + waveHeight * waveShape[i];
        float x_pos2 = (float) (i+1) * scaling;
        float y_pos2 = y_current + waveHeight * waveShape[i+1];
        strokeWeight(strengthThick);
        //illuminate according to moon position
        float moon_dist = abs(thisMoon.MoonX - x_pos);
        float pointBright = strengthHeight*(80-map(moon_dist*2,0,width,0,80));
        stroke(240,0,99,pointBright);
        line(x_pos, y_pos, x_pos2, y_pos2);
      }
  } //end visual

  void ripple() {
   create();
   smooth();
   }
    
    
  
} //end class





