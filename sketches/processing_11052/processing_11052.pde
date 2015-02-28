
/* Sin Titulo (2010)
   Audiovisual experimental digital "open source".
   
   Autor: Alejandro Schianchi
   Licencia: GNU GPL / CC-BY-NC
*/

import wblut.hemesh.*;
import wblut.geom.*;
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.ugens.*;
Minim minim;
AudioOutput out;
AudioRecorder recorder;
SineWave sine;
SineWave sine2;
WhiteNoise wn;
import peasy.*;
PeasyCam cam;
Particle[] parts = new Particle[300];
PVector O = new PVector();

float a=0;
float freq=0;
float freq2=0;
float pan=0;
float amp=0;
float rythm = 0;
float tam = 1;
int x =0;
int x2 =0;
int y =0;
int y2 =0;
float posx=0;
float posy=0;
float tam2=200;
float c=150;


HE_Mesh box;
//MovieMaker mm;
float roty = 0;
float rotx = 0;
float rotz = 0;

void setup(){
  size(480, 272, P3D);
  frameRate (24);
  randomSeed (1);
  
  cam = new PeasyCam(this,500);
  
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  sine = new SineWave(freq, 0.5, out.sampleRate());
  sine.portamento(200);
  out.addSignal(sine);
  wn= new WhiteNoise (0.2);
  sine2 = new SineWave(freq2, 0.4, out.sampleRate());
  sine.portamento(200);
  out.addSignal(sine2);
  /* Based on: ADSRExample de Anderson Mills
  */
  out.pauseNotes();
    for( int i = 0; i < 5; i++ )
  {
    out.playNote( 1.25 + i*2.0, 1, new ToneInstrument( 60, 0.6, out ) );
    out.playNote( 2.50 + i*2.0, 1, new ToneInstrument( 60, 0.6, out ) );
    out.playNote( 1.75 + i*2.0, 1, new ToneInstrument( 150, 0.4, out ) );
    out.playNote( 2.75 + i*2.0, 3, new ToneInstrument( 90, 0.4, out ) );
    out.playNote( 1.25 + i*2.0, 3, new ToneInstrument( 2850, 0.05, out ) );
    out.playNote( 2.0 + i*2.0, 0.3, new ToneInstrument( 1640, 0.08, out ) );
    out.playNote( 2.25 + i*2.0, 0.3, new ToneInstrument( 3620, 0.2, out ) );
    out.playNote( 2.5 + i*2.0, 0.3, new ToneInstrument( 5250, 0.1, out ) );
  }
  HEC_Box boxCreator=new HEC_Box(this).setWidth(250).setWidthSegments(7)
    .setHeight(250).setHeightSegments(7)
      .setDepth(250).setDepthSegments(7);
  box=new HE_Mesh(boxCreator);
  HEM_Noise nm=new HEM_Noise().setAmplitude(0);
  box.modify(nm);
  
    for( int i = 0; i < parts.length; i++ )
  {
    parts[i] = new Particle(); 
  }
  noStroke();
  smooth();
  
  

}

void draw(){
  
  noCursor();
  background(255);
  lights();
  camera(); 
  noStroke();
  fill(150);
  translate(width/2,height/2);
  
   if (frameCount<100){
     intro();
     }
   else if (tam<250){
     richter();
     }
   else if (frameCount<800){
     malevich();
     }
   else if (frameCount<1300){
     richter3d();
     }
   else if (frameCount<1800){
     noisecube();
     }
   else if (frameCount<2200){
     noisecubestill();
     }
   else if (frameCount<2500){
     noisecubestillflick();
     }
   else if (frameCount<2800){
     noisecubestillwire();
     }
   else if (frameCount<3300){
     noisecubenoisewire();
     }
   else if (frameCount<3700){
     noisewireandsphere();
     }    
   else if (frameCount<4000){
     cubes2();
     }
   else if (frameCount<4200){
     cubes4();
     }  
   else if (frameCount<4500){
     particles();
//     mm.addFrame();
     }
   else if (frameCount<4800){
     ending2001();
     }   
   else if (frameCount<5300){
     fadeout();
     } 
   else if (frameCount>5300){
     fin();
  }
}

void stop(){
//  recorder.endRecord();
//  recorder.save();
  minim.stop();
  out.close();  
  super.stop();
}

void intro(){
//  recorder.beginRecord();
//  mm.addFrame();
}
void richter(){
  cam.rotateZ(0);
  box(tam);
  tam=tam+0.5;
//  mm.addFrame();
}
void malevich(){
  cam.rotateZ(0);
  box(tam);
//  mm.addFrame();
}
void richter3d(){
  cam.rotateX(0.02);
  cam.rotateY(0.015);
  cam.rotateZ(0.01);
  box(tam);
//  mm.addFrame();
}
void noisecube(){
  cam.rotateX(0.015);
  cam.rotateY(0.01);
  cam.rotateZ(0.02);
     
  freq++;
  sine.setFreq(freq);
  pan= 0;
  sine.setPan(pan);
  amp= 0.5;
  sine.setAmp(amp);
  
  HEM_Noise nm=new HEM_Noise().setAmplitude(a);
  box.modify(nm);
  
  noStroke();
  box.drawFaces();

  a=a+0.02;
 //  mm.addFrame();
}
void noisecubestill(){

  cam.rotateX(0.01);
  cam.rotateY(0.02);
  cam.rotateZ(0.015);
     
  sine.setFreq(100);
  pan= 0;
  sine.setPan(pan);
  amp= 0.4;
  sine.setAmp(amp);
  
  noStroke();
  box.drawFaces();
//  mm.addFrame();
}
void noisecubestillflick(){

  cam.rotateX(0.01);
  cam.rotateY(0.02);
  cam.rotateZ(0.015);
     
  amp= 0.05;
  wn.setAmp(amp);  

  float flick= random(0,1);
  if (flick > 0.8){
  stroke(0);
  noFill();
  out.addSignal(wn);
  }
  else {
      fill(150);
      out.disableSignal(wn);
  }
  box.drawFaces();

//  mm.addFrame();

}
void noisecubestillwire(){

  if (rythm<10){
  sine.setFreq(440);
  rythm++;
  } else if (rythm<20){
    rythm++;
  sine.setFreq(50);
  } else {
    rythm=1;
  }
  
  cam.rotateX(0.01);
  cam.rotateY(0.02);
  cam.rotateZ(0.015);
     
  stroke(0);
  noFill();
  box.drawFaces();

//  mm.addFrame();

}
void noisecubenoisewire(){
  
  sine.setFreq(80);
  
  cam.rotateX(0.015);
  cam.rotateY(0.01);
  cam.rotateZ(0.02);

  stroke(0);
  noFill();

  box.drawFaces();
  HEM_Noise nm=new HEM_Noise().setAmplitude(a);
  box.modify(nm);
  
  tam=500;
  
//  mm.addFrame();

}
void noisewireandsphere(){
  
    if (rythm<5){
  sine.setFreq(80);
  rythm++;
  } else if (rythm<10){
    rythm++;
  sine.setFreq(120);
  } else {
    rythm=1;
  }
  
  cam.rotateX(0.015);
  cam.rotateY(0.01);
  cam.rotateZ(0.02);

  stroke(0);
  noFill();

  box.drawFaces();
  HEM_Noise nm=new HEM_Noise().setAmplitude(a);
  box.modify(nm);
  sphere(tam);
  tam=tam-0.5; 
  
//  mm.addFrame();
}
void cubes2(){

  cam.rotateZ(0.0);
  
  noStroke();
  fill(150);
  if (rythm<50){
  sine.setFreq(200);
  rythm++;
  translate(x,0,0);
  box(75);  
  x++;
  } else if (rythm<100){
    rythm++;
  sine.setFreq(120);
    translate(x2,0,0);
  x2--;
    box(75);  
  } else {
    rythm=1;
  }
//  mm.addFrame();
}
void cubes4(){

  cam.rotateZ(0.0);

  noStroke();
  fill(150);
  if (rythm<50){
  sine.setFreq(200);
  rythm++;
  translate(x,0,0);
  box(75);  
  x++;
  } else if (rythm<100){
    rythm++;
  sine.setFreq(120);
    translate(x2,0,0);
  x2--;
    box(75);  
  } 
  if (rythm<30){
  sine.setFreq(300);
  rythm++;
  translate(-50,y,0);
  box(75);  
  y++;
  } else if (rythm<60){
    rythm++;
  sine.setFreq(150);
    translate(-50,y2,0);
  y2--;
    box(75);  
  }  
    else {
    rythm=1;
  }
//  mm.addFrame();
}
void particles(){
// Based on: 2009 Daniel Winkler http://www.phyloa.com
  amp= 0;
  sine.setAmp(amp);
  
  out.resumeNotes();
  
  cam.rotateX(0.008);
  cam.rotateY(0.008);
  cam.rotateZ(0.008);
   
  noStroke();
  fill(150);
  
O.set(400, 500, 0 );

  for( int i = 0; i < parts.length; i++ )
  {
    parts[i].update(); 
  }
}

int size = 12;
   
public class Particle
{
  PVector loc = new PVector( random( 0, width ), random( 0, height ), random( -300, -700 ) );
  PVector speed = new PVector();

  public Particle()
  {

  } 

  public void update()
  {

      PVector dir = new PVector(200, 200, 0 );
      dir.sub( loc );
      dir.normalize();
      speed.add( dir );

    loc.add( speed );
    pushMatrix();
    translate( loc.x, loc.y, loc.z );
    rotateToFace( loc );
 
    beginShape( QUADS );
    vertex( -size, -size, 0 );
    vertex( size, -size, 0 );
    vertex( size, size, 0 );
    vertex( -size, size, 0 );
    endShape();
    popMatrix();
  }
}

PVector U = new PVector( 0, 1, 0 );
void rotateToFace( PVector P )
{
  PVector D = new PVector( );
  D.set( O );
  D.sub( P );
  PVector Right = U.cross( D );
  Right.normalize();
  PVector Backwards = Right.cross( U );
  Backwards.normalize();
  PVector Up = Backwards.cross( Right );
  applyMatrix(Right.x, Right.y, Right.z, 0, Up.x, Up.y, Up.z, 0, Backwards.x, Backwards.y, Backwards.z, 0, 0, 0, 0, 1);


}
void ending2001(){
  amp= 0.5;
  sine.setAmp(amp);
  sine.setFreq(100);
  cam.rotateZ(0);
  box(tam2);
  tam2=tam2-0.2;

//  mm.addFrame();
}
void fadeout(){

  sine.setFreq(freq);
  freq--;
  cam.rotateZ(0.0);
  noLights();
  fill(c);
  c=c+0.3;
  box(tam2);
  tam2=tam2-0.2;
  
//  mm.addFrame();
}
void fin(){
//    mm.finish();
    exit(); 
}


