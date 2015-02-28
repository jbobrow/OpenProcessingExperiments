

import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine;
SineWave sine2;



PImage tex = createImage(255, 255, RGB);
float rotx = -0.3;
float roty = 0.6;

float rotcolor = 0;
float linha,coluna;
float centx,centy,gradangle,thisangle,thiscolor,thiscolor2,thiscolor3,difcentrx,difcentry,thishipo,subangle;
int simcol,simlin;
float freq = 200;
float afreq = 1;
float m;
float my;
boolean saudio = true;

void setup() 
{
  size(350, 350, P3D);
  frameRate(25);
    minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  sine = new SineWave(200, 0.4, out.sampleRate());
  sine2 = new SineWave(200+afreq, 0.4, out.sampleRate());
  sine.portamento(20);
  out.addSignal(sine);
  out.addSignal(sine2);


}

void draw() 
{
    m=millis();
    background(0);
    noStroke();
    ortho(-width/2, width/2, -height/2, height/2, -height/2, height/2);
//    float fov = PI/3.0; 
//    float cameraZ = (height/2.0) / tan(PI * fov / 360.0); 
//    perspective(fov, float(width)/float(height), cameraZ/2.0, cameraZ*6.0); 
    afreq=map(mouseX,0,width,0.1, 200.0);
    freq=map(mouseY,height,0,100.0, 800.0);
    my=map(mouseY,height,0,-0.5, 0.5 );
//    rotcolor=(rotcolor+2.9)%360;
  
    rotcolor=(m%(1000/afreq))*360/(1000/afreq);

    gradangle = radians(rotcolor);
    sine.setFreq(freq);
    sine2.setFreq(freq+afreq);


    tex.loadPixels();  
    centx= tex.width/2;
    centy= tex.height/2; 
    

  for (int i = 0; i < tex.pixels.length; i++) {
    coluna = i/tex.height;
    linha = i%tex.width;
    simcol = floor(coluna/16);
    simlin = floor(linha/16);
       
    difcentrx = coluna-centx;
    difcentry = coluna-centy;
    thishipo = sqrt(difcentrx*difcentrx+difcentry+difcentry);


if (simcol >= 7 && simcol <= 8 && simlin >= 7 && simlin <= 8) {
    subangle=0;
  }else if
  (simcol >= 6 && simcol <= 9 && simlin >= 6 && simlin <= 9){
    subangle=HALF_PI;
  }else if
  (simcol >= 5 && simcol <= 10 && simlin >= 5 && simlin <= 10){
    subangle=PI;
  }else if
  (simcol >= 4 && simcol <= 11 && simlin >= 4 && simlin <= 11){
    subangle=HALF_PI*3;
  }else if
  (simcol >= 3 && simcol <= 12 && simlin >= 3 && simlin <= 12){
    subangle=0;
  }else if
  (simcol >= 2 && simcol <= 13 && simlin >= 2 && simlin <= 13){
   subangle=HALF_PI;
  }else if
  (simcol >= 1 && simcol <= 14 && simlin >= 1 && simlin <= 14){
    subangle=PI;
  }else if
  (simcol >= 0 && simcol <= 15 && simlin >= 0 && simlin <= 15){
    subangle=HALF_PI*3;
  }


    thisangle = atan2(linha-centx, coluna-centy);
    thiscolor = (cos((gradangle-thisangle+subangle))*100)+100;   
    thiscolor2 = (cos((gradangle-thisangle+subangle+my*2*TWO_PI/3))*100)+100;   
    thiscolor3 = (cos((gradangle-thisangle+subangle+my*TWO_PI/3))*100)+100;   
    tex.pixels[int(linha*tex.width+coluna)] = color(thiscolor,thiscolor2,thiscolor3);     
    }
  tex.updatePixels();
  textureMode(NORMALIZED);
  

  translate(width/2.0, height/2.0, -100);
  rotateX(rotx);
  rotateY(roty);
 
  scale(50);
  TexturedCube(tex);
 filter(BLUR,map(mouseY,height/2,height,1.0,6.0));
}

void TexturedCube(PImage tex) {
  beginShape(QUADS);
  texture(tex);

  // +Z "front" face
  vertex(-1, -1,  1, 0, 0);
  vertex( 1, -1,  1, 1, 0);
  vertex( 1,  1,  1, 1, 1);
  vertex(-1,  1,  1, 0, 1);

  // -Z "back" face
  vertex( 1, -1, -1, 0, 0);
  vertex(-1, -1, -1, 1, 0);
  vertex(-1,  1, -1, 1, 1);
  vertex( 1,  1, -1, 0, 1);

  // +Y "bottom" face
  vertex(-1,  1,  1, 0, 0);
  vertex( 1,  1,  1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex(-1,  1, -1, 0, 1);

  // -Y "top" face
  vertex(-1, -1, -1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1, -1,  1, 1, 1);
  vertex(-1, -1,  1, 0, 1);

  // +X "right" face
  vertex( 1, -1,  1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex( 1,  1,  1, 0, 1);

  // -X "left" face
  vertex(-1, -1, -1, 0, 0);
  vertex(-1, -1,  1, 1, 0);
  vertex(-1,  1,  1, 1, 1);
  vertex(-1,  1, -1, 0, 1);

  endShape();
}

void mouseDragged() {
  float rate = 0.01;
  rotx += (pmouseY-mouseY) * rate;
  roty += (mouseX-pmouseX) * rate;
}

void mousePressed(){
  saudio = !saudio;
  if(saudio){
    sine.setAmp(0.5);
    sine2.setAmp(0.5);
    }else{
    sine.setAmp(0);
    sine2.setAmp(0);
    }
}


void stop()
{
  // always close Minim audio classes when you are finished with them
  out.close();
  minim.stop();
  
  super.stop();
}



