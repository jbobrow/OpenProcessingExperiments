
float DEPTH=6; // recursion depth. Increase for more accuracy
float SIZE=512.0; // window size
float x,y; // current position
float sz=SIZE/(float)Math.pow(2,DEPTH); // size of individual cells
float CELLS=(float)Math.pow(Math.pow(2,DEPTH),2); // total number of cells
boolean showCurve=false;

// data goes in here
float[] values=new float[]{121.4,65.8,55.3,14.7,99.9,670.0,56.0,43.0,78.0,5.10,11.3,78.9,3.2};

float[] cellcounts; // corresponding number of cells for each value
color[] colours; // colours for each value
int ixValue; // used as pointer to current value in array

void setup() {
  size(512,512);
  reset();
  rectMode(CENTER);
  noStroke();
}

void nudge() {
  // change values at random
  for (int i=0;i<values.length;i++) {
    values[i]*=random(0.98,1.02);
  }
  cellcounts=new float[values.length];
  float total=0.0;
  for (int i=0;i<values.length;i++) total+=values[i];
  //print("Total="+total+"\n");
  for (int i=0;i<cellcounts.length;i++) {
    cellcounts[i]=(float)Math.ceil(((double)(values[i]/total))*CELLS);
  }
  ixValue=0;
}

void keyPressed() {
  if (key=='+' || key=='=') {
    // more detailed but slower
    if (DEPTH<8) {
      DEPTH+=1; 
      sz=SIZE/(float)Math.pow(2,DEPTH); // size of individual cells
      CELLS=(float)Math.pow(Math.pow(2,DEPTH),2); // total number of cells
      reset();
    }
  }
  if (key=='-' || key=='_') {
    // less detailed but faster
    if (DEPTH>2) {
      DEPTH-=1; 
      sz=SIZE/(float)Math.pow(2,DEPTH); // size of individual cells
      CELLS=(float)Math.pow(Math.pow(2,DEPTH),2); // total number of cells
      reset();
    }
  }
  if (key==' ') {
    showCurve=!showCurve;
  }
}

void reset() {
  values=new float[(int)random(10,100)];
  for (int i=0;i<values.length;i++) {
    values[i]=random(10,1000);
  }
  cellcounts=new float[values.length];
  colours=new color[values.length];
  float total=0.0;
  for (int i=0;i<values.length;i++) total+=values[i];
  //print("Total="+total+"\n");
  for (int i=0;i<cellcounts.length;i++) {
    cellcounts[i]=(float)Math.ceil(((double)(values[i]/total))*CELLS);
    colours[i]=color(random(0,255),random(0,255),random(0,255),200);
    //print ("["+i+"] "+values[i]+"->"+cellcounts[i]+"\n");
  }
  ixValue=0;
}

void mouseClicked() {
  reset();
}

void draw() {
  hilbert(0, 0, SIZE, 0, 0, SIZE, DEPTH);
  nudge();
}


void hilbert(float x0, float y0, float xis, float xjs, float yis, float yjs, float n) {
  //code ported from the following source
  //http://www.dcs.napier.ac.uk/~andrew/hilbert.html
  if (n<= 0) {
     if (showCurve) {
       stroke(0);
       line(x,y,x0+(xis+yis)/2, y0+(xjs+yjs)/2);
     }
     noStroke();
     x=x0+(xis+yis)/2;
     y=y0+(xjs+yjs)/2;
     fill(colours[ixValue]);
     rect(x,y,sz,sz);
     cellcounts[ixValue]-=1;
     if (cellcounts[ixValue]<=0) ixValue+=1;
  } else {
    hilbert(x0, y0, yis/2, yjs/2, xis/2, xjs/2, n-1);
    hilbert(x0+xis/2, y0+xjs/2 ,xis/2, xjs/2, yis/2, yjs/2, n-1);
    hilbert(x0+xis/2+yis/2, y0+xjs/2+yjs/2, xis/2, xjs/2, yis/2, yjs/2,n-1);
    hilbert(x0+xis/2+yis, y0+xjs/2+yjs, -yis/2,-yjs/2, -xis/2, -xjs/2,n-1);
  }
}



