

// stripped down version of a processing sketch that allows interactive visualisation of a distance map 
// and choosing a contact def / threshold and show the resulting powered contact map 
// values of FP/FN are TrueP/FalseP can be set below, originlly could be set using a slider 
// so there are some variable and line of code that still could be thrown out, 
// just happy that it's working now ... ;) 

import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
import javax.vecmath.GMatrix; 

PeasyCam cam;
PMatrix3D currCameraMatrix;
PGraphics3D g3; 
static float cutoff=8.0, power=3.0, TrueP=98.5, FalseP=0.015; 
int n = 0, ipoint=1, jpoint=1, finit=200, fcount=200; 
float[][] Dmap;
static GMatrix Cmap, Pmap, Scal;
float dx, dy, dz, nproz=1.0, boxw=2.0, boxh=4.0, dSum=0.0, dMax=0.0, pMax=0.0; 
double pAvg=1.0, minscale = 0.01; // minimum scaling factor for powering the matrix 
boolean withIJ = false; 

void setup()  
{
  int i=0, j=0; 
  float aX=0.0, aY=0.0, aZ=0.0; 
  // first load the coordinates 
  Dmap = parsePDB();
  n = Dmap.length; // determine the dimension of the distance matrix 
  Cmap = new GMatrix( n, n);
  Cmap.setIdentity(); // initialising the contact map as identity matrix 
  // determine max for color mapping 
  dMax = 0.0; 
  for ( i=0; i<n; i++) {
    for ( j=0; j<n; j++) {
      if ( Dmap[i][j]>dMax) dMax = Dmap[i][j]; 
    } // next j
  } // next i

  size(512, 512, P3D);
  fill(204);
  // camera setup 
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(2);
  cam.setMaximumDistance(500);
  g3 = (PGraphics3D)g;
 
}

void draw() {
  int i, j; 
  float z, dice=0.0; 
  double sf=0.01; // scaling factor to be computed per row 
  double sum=0.0, edgecount=0.0; 
  lights();
  background(0);
  colorMode( HSB, 360, 100, 100, 100); 
  noStroke(); 
  hint(ENABLE_DEPTH_TEST);
  // drawing the content 
  pushMatrix();
  fill(  189, 100, 100, 100);
  translate( 0, 0, cutoff);
  box( (n)*boxw, (n)*boxw, 0.1);  // drawing the cutoff 
  popMatrix();
  for ( i=0; i<n; i++) {
    for ( j=0; j<n; j++) {
      render( i, j); // drawing the distance map cell i, j  
      dice = random( 100.0); 
      if (Dmap[i][j]<=cutoff && dice<=TrueP ) {
        Cmap.setElement( i, j, 1.0);
      } 
      else {   
        Cmap.setElement( i, j, 0.0);
      } // end if <= cutoff 
      if (Dmap[i][j]>cutoff && dice<=FalseP ) {
        Cmap.setElement( i, j, 1.0);
      } // end if <= cutoff
    } // next i
  } // next j

  Pmap = new GMatrix( n, n); 
  Pmap.setIdentity();
  for (float p=1.0; p<=power; p+=1.0) {
    if (p==1.0) { // Map^1 = I * Map = CMap 
      // toggle ij according to WithIJ 
      if ( withIJ) {
        Cmap.setElement( ipoint-1, jpoint-1, 1.0);
        Cmap.setElement( jpoint-1, ipoint-1, 1.0);
      }
      else {
        Cmap.setElement( ipoint-1, jpoint-1, 0.0); 
        Cmap.setElement( jpoint-1, ipoint-1, 0.0);
      }
      Pmap.mul(Cmap);
    }  
    else Pmap.mul( Pmap); // keep multiplying with current state 

    pMax = 0.0; 
    sum=0.0; 
    edgecount=0.0; 
    Scal = Pmap;
    // alternative: scale to max = 1 before remultiplying   
    for ( i=0; i<n; i++) {
      for ( j=0; j<n; j++) {
        if (Pmap.getElement( i, j)> pMax) pMax = (float)Pmap.getElement( i, j);
        if (Cmap.getElement( i, j)> 0.99) {
          sum+= Pmap.getElement( i, j);
          edgecount+=1.0;
        } // end if this is a contact
      } // next j
    } // next i
    pAvg = (double)(sum/edgecount);
    if (pAvg<1.0) pAvg=(double)1.0; 
    // rescale 
    for ( i=0; i<n; i++) {
      for ( j=0; j<n; j++) {
        Pmap.setElement( i, j, (Pmap.getElement( i, j)/pAvg) );
      } // next j
    } // next i
  } // next power p 

  // drawing the powered Matrix as a field of boxes 
  for ( i=0; i<n; i++) {
    for ( j=0; j<n; j++) {
      //if (Cmap.getElement(i,j)>0.0) {
      pushMatrix();
      fill(  map( Dmap[i][j], 0.0, dMax, 0.0, 255.0), 100, 100, 100);
      z = map( (float)Pmap.getElement(i, j), 0.0, (float)(pMax/pAvg), 0.0, dMax); 
      translate( (i-(n/2))*boxw, (j-(n/2))*boxw, (float)(-0.5*z) );
      box( boxw, boxw, z); 
      popMatrix();
      // } // end if nonzero entry in Cmap
    } // next i
  } // next j   
  // counting doen for next power 
  fcount--; 
  if (fcount<0) {
    fcount = finit; 
    power ++; 
  }
  if (power > 5) power=1; 
} // end draw 


void render( int i, int j) {
  float o = boxw/2.0;  // offset 
  float cx=getXfor( i), cy=getYfor( j), cz=Dmap[i][j]; // center coordinates
  if ( i>0 && i<n-1 && j>0 && j<n-1) {
    pushMatrix(); 
    beginShape(TRIANGLE_FAN); 
    // System.out.println("pLeft"+pLeft+" pRight"+pRight+" pBottom"+pBottom+" pTop"+pTop+" pFront"+pFront+" pBack"+pBack); 
    vertColor( cz); 
    vertex( cx, cy, cz); // center tip 
    vertColor(          ((cz+Dmap[i-1][j-1]+Dmap[i][j-1]+Dmap[i-1][j])*0.25) ); 
    vertex( cx-o, cy-o, ((cz+Dmap[i-1][j-1]+Dmap[i][j-1]+Dmap[i-1][j])*0.25) ); // left top 
    vertColor(          ((cz               +Dmap[i][j-1]             )*0.5 ) );
    vertex( cx, cy-o, ((cz               +Dmap[i][j-1]             )*0.5 ) ); // top 
    vertColor(          ((cz+Dmap[i+1][j-1]+Dmap[i][j-1]+Dmap[i+1][j])*0.25) );
    vertex( cx+o, cy-o, ((cz+Dmap[i+1][j-1]+Dmap[i][j-1]+Dmap[i+1][j])*0.25) ); // right top
    vertColor(          ((cz                            +Dmap[i+1][j])*0.5 ) ); 
    vertex( cx+o, cy, ((cz                            +Dmap[i+1][j])*0.5 ) ); // right 
    vertColor(          ((cz+Dmap[i+1][j+1]+Dmap[i][j+1]+Dmap[i+1][j])*0.25) );
    vertex( cx+o, cy+o, ((cz+Dmap[i+1][j+1]+Dmap[i][j+1]+Dmap[i+1][j])*0.25) ); // right bottom 
    vertColor(          ((cz               +Dmap[i][j+1]             )*0.5 ) );
    vertex( cx, cy+o, ((cz               +Dmap[i][j+1]             )*0.5 ) ); // bottom 
    vertColor(          ((cz+Dmap[i-1][j+1]+Dmap[i][j+1]+Dmap[i-1][j])*0.25) );
    vertex( cx-o, cy+o, ((cz+Dmap[i-1][j+1]+Dmap[i][j+1]+Dmap[i-1][j])*0.25) ); // left bottom
    vertColor(          ((cz                            +Dmap[i-1][j])*0.5 ) );
    vertex( cx-o, cy, ((cz                            +Dmap[i-1][j])*0.5 ) ); // left 
    vertColor(          ((cz+Dmap[i-1][j-1]+Dmap[i][j-1]+Dmap[i-1][j])*0.25) );
    vertex( cx-o, cy-o, ((cz+Dmap[i-1][j-1]+Dmap[i][j-1]+Dmap[i-1][j])*0.25) ); // left top to close
    endShape();
    popMatrix();
  } // end if not on edge
} // end render( i, j) 

void vertColor( float datvalue) { // sets the fill color for the vertices according to the given data value 
  fill(  map( datvalue, 0.0, dMax, 0.0, 255.0), 100, 100, 100);
} // end of vertColor 

float getXfor( int ipunkt) { // returns the x coordinates for row ipunkt based on boxwidth 
  return (float)(ipunkt-(n/2))*boxw;
}  

float getYfor( int jpunkt) { // returns the y coordinates for row jpunkt based on boxwidth 
  return (float)(jpunkt-(n/2))*boxw;
}


