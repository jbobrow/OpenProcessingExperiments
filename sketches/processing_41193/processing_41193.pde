
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine;

import JMyron.*;

JMyron m;//a camera object

//variables to maintain the floating ellipses
float objx = 160;
float objy = 120;
float objdestx = 160;
float objdesty = 120;


//opacity of circles
float opac = 100;

Circle[] a = new Circle[14];

void setup(){
  size(700,400, P3D);
  background(255);
  m = new JMyron();//make a new instance of the object
  m.start(width,height);//start a capture at size
  m.trackColor(255,255,255,256*3-100);//track white
  m.update();
  m.adaptivity(10);
  m.adapt();// immediately take a snapshot of the background for differencing
  println("Myron " + m.version());
  ellipseMode(CENTER_DIAMETER);
  rectMode(CENTER_DIAMETER);
  noStroke();
  noCursor();
  colorMode(HSB);


  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  sine = new SineWave(440,0.5,out.sampleRate());
  sine.portamento(200);
  out.addSignal(sine);

  int i = 0;
  while(i < 14){
    a[i] = new Circle((60)*i,200,50);
    i++;
  }

}

void draw(){
  background(255);
  m.update();//update the camera view



  int[][] centers = m.globCenters();//get the center points
  float avX=0;
  float avY=0;
  for(int i=0;i<centers.length;i++){
    avX += centers[i][0];
    avY += centers[i][1];
  }
  if(centers.length-1>0){
    avX/=centers.length-1;
    avY/=centers.length-1;

    float freq = map(avX, avY, height, 1500, 60);
    sine.setFreq(freq);
    float pan = map(avX, avY, width, -1, 2);
    sine.setPan(pan);

    int i =0;
    int j = 0;
    while(i <14){
      noStroke();
      smooth();
      fill(avX/3,avY/4,avY/3,abs(0));
      ellipse(a[i].x, a[j].y, a[i].r, a[i].r);

      if(i > 0){
        intersect(a[0], a[i]);
      }
      i++;
    }
    a[0].x=avX;
    a[0].y=avY;
  }

}

class Circle 
{ 
  float x, y, r, r2; 

  Circle( float px, float py, float pr ) { 
    x = px; 
    y = py; 
    r = pr; 
    r2 = r*r; 
  } 
} 


void intersect( Circle cA, Circle cB ) { 

  float dx = cA.x - cB.x; 
  float dy = cA.y - cB.y; 
  float d2 = dx*dx + dy*dy; 
  float d = sqrt( d2 ); 

  if ( d>cA.r+cB.r || d<abs(cA.r-cB.r) ) return; // no solution 

    float a = (cA.r2 - cB.r2 + d2) / (2*d); 
  float h = sqrt( cA.r2 - a*a ); 
  float x2 = cA.x + a*(cB.x - cA.x)/d; 
  float y2 = cA.y + a*(cB.y - cA.y)/d; 

  noStroke();
  smooth();  

  float paX = x2 + h*(cB.y - cA.y)/d; 
  float paY = y2 - h*(cB.x - cA.x)/d; 
  float pbX = x2 - h*(cB.y - cA.y)/d; 
  float pbY = y2 + h*(cB.x - cA.x)/d; 

  fill(paX/3,paY/4,paY/3,abs(50));
  ellipse( paX, paY, 25, 25 ); 
  ellipse( pbX, pbY, 25, 25 );
  
  stroke(paX/3,paY/4,paY/3,abs(128));
  strokeWeight(1);
  line(paX, paY, pbX, pbY);

} 











