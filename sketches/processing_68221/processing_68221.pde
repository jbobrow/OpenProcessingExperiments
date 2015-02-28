
int colStroke, colGround;
float midX, midY;

float sinLookUp[];
float cosLookUP[];

int e = 0;

/* Math.cos DEG_TO_RAD */

float SC_PRECISION = 0.2f;
// caculate reciprocal for conversions
float SC_INV_PREC = 1/SC_PRECISION;
// compute required table length
int SC_PERIOD = (int) (360f * SC_INV_PREC);

void popLookUp() {
    sinLookUp = new float[SC_PERIOD]; //create floatArray of SC_PERIOD units
    cosLookUp = new float[SC_PERIOD];
    
      for (int i = 0; i < SC_PERIOD; i++) {
        sinLookUp[i] = (float)Math.sin(i * DEG_TO_RAD * SC_PRECISION);
        cosLookUp[i] = (float)Math.cos(i * DEG_TO_RAD * SC_PRECISION);
  }
}

void drawUp() {

    // modulate the current radius
    radius=midX*sinLookUp[millis()%SC_PERIOD];
    
    // draw a circle made of points (every 5 degrees)
    for(int i=0; i<360; i+=10) {
        // convert degrees into array index:
        // the modulo operator (%) ensures periodicity 
        int theta=(int)((i*SC_INV_PREC) % SC_PERIOD);
        // draw the circle around mouse pos
        point(midX+radius*cosLookUp[theta], midY+radius*sinLookUp[theta]);
    }
}

void setup() {
    popLookUp(); /* call LookUp table method in setup(), ready for use in draw() */
    size(666,666);
    colGround=0;
    colStroke=255;
    strokeWeight(3);
    midX = int(width/2);
    midY = int(height/2);
}

void draw() {

    /* colGround = midX+radius*cosLookUp[e]; */
    colStroke = midY+radius*sinLookUp[e];
    e++;

    background(colGround);
    stroke(colStroke);
    
    drawUp();
}

/*
sincoslookup taken from http://wiki.processing.org/index.php/Sin/Cos_look-up_table
@author toxi (http://www.processinghacks.com/user/toxi)
*/
