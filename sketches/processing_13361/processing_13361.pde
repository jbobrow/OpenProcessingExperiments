
/*
 Feedback v2 for Processing 1.0.9
  A plane is textured with the output image to generate feedback effect.
  Another plane (simple quad) makes the initial input image.
  Keys:
  o switch between objects (either feedback plane or input plane)
  s render grid lines of object
  + increase object size
  - decrease object size
  
  r enables/disables relief on feedback plane
  3 decrease grid res of feedback plane
  4 increase grid res of feedback plane
  
  p enables/disables input plane 
  a enables/disables input plane rotation
  
  t Texture Mode on/off (disabled/commented for openprocessing.org)
  
  Randomness of texture coordinates on feedback plane
  g switch random mode (1=random,2=noise,3=deterministic function)
  1 decrease influence (default influence=0)
  2 increase influence
  
  0 make screenshot
*/

import processing.opengl.*;
import javax.media.opengl.*;

PImage cp;
// for image counter
int cpTimer=0;

// Variables for feedback plane 
float rotationZ = 0;
float rotationY = 0;
float rotationX = 0;
float centerX = 0;
float centerY = 0;
float planeScale  = 1;

float velocityX = 0;
float velocityY = 0;
float velocityZ = 0;

// Variables for object (input plane)
float objRotZ = 0;
float objCenterX = 0;
float objCenterY = 0;
float objScale = 1;

float timer = 0;

PGraphicsOpenGL pgl;
GL gl;
float b;

boolean ANIM = true;
boolean OBJECT = false;
boolean OSTROKES = false;
boolean PSTROKES = false;
boolean TEXTURE = false;
boolean OBJTRANSP = false;
boolean RELIEF = true;

int RANDOM_MODE = 0;
float RAND_ALPHA = 0;

// feedback plane resolution
int SAMPLES = 6;

PImage bg;
PImage bg2;
Heightfield hmap;
PFont myFont;
String textvar;
String screenshotdest;

void setup(){
  textvar = "";  
  size(480,480,OPENGL);
/*  bg = loadImage("bg.jpg");
  bg2 = loadImage("bg2.png");
  if( TEXTURE )
    image(bg,0,0,width,height);
  else */
    background(0);
  
  hmap = new Heightfield(SAMPLES);
  
  myFont = createFont("verdana", 18, true);
  textFont(myFont, 12);
  
  centerX = width*0.5;
  centerY = height*0.5;
  planeScale = width*0.5+10;
  objCenterX = width*0.5;
  objCenterY = height*0.5;
  objScale = 50;
  
  cp = createImage(width,height,RGB);
  cp = get();
  
  pgl = (PGraphicsOpenGL) g;
  gl = pgl.gl;

}

void draw(){
/*  if( TEXTURE )
    image(bg,0,0,width,height);
  else*/
    background(0);
  
  pgl.beginGL();
  gl.glDisable(GL.GL_DEPTH_TEST);
  gl.glDisable(GL.GL_LIGHTING);
  pgl.endGL();  
  
  // FEEDBACK PLANE with grid lines
  pushMatrix();
  translate(centerX,centerY);
  rotateX( radians(rotationX) );
  rotateY( radians(rotationY) );
  rotateZ( radians(rotationZ) );
  scale(planeScale);
  if( PSTROKES ){
    stroke(255);
    strokeWeight(1);
  }else
    noStroke();
    
  hmap.generateHeightfield(cp);

  popMatrix();  
    
  // rotating input plane
  pushMatrix();
  translate(objCenterX,objCenterY,0);
  rotateZ(radians(objRotZ));
  scale(objScale);

  if( OSTROKES )
    stroke(0); 
  else
    noStroke();
   
/*  if( TEXTURE ){
    textureMode(NORMALIZED);  
    beginShape(QUADS);    
      texture(bg2);
      vertex(-1,-1,0,0);
      vertex(1,-1,1,0);
      vertex(1,1,1,1);
      vertex(-1,1,0,1);
    endShape(CLOSE);    
  }else{ */
    b = abs(sin(timer*TWO_PI));
    if( OBJTRANSP )
      noFill();
    else
      fill(155+100*(b-0.5),155+100*(cos(timer*TWO_PI)),180*exp(-b)+75*(0.5-b*b));
    beginShape();
      vertex(-1,-1);
      vertex(1,-1);
      vertex(1,1);
      vertex(-1,1);
    endShape(CLOSE);
//  }
  popMatrix();
 
  
  rotationX += velocityX;
  rotationY += velocityY;
  rotationZ += velocityZ;
  velocityX *= 0.85;
  velocityY *= 0.85;
  velocityZ *= 0.85;  
  if( ANIM )
    objRotZ = (objRotZ+0.1)%360;
  
  if(mousePressed){
    if(mouseButton == LEFT){
      if( OBJECT ){
        objRotZ += (mouseY-pmouseY) * 0.2;
      }else{
        velocityX += (mouseY-pmouseY) * 0.05;
        velocityZ -= (pmouseX-mouseX) * 0.05;
      }
    }else if(mouseButton == CENTER){
      if( OBJECT ){
        objCenterY += (mouseY-pmouseY);
        objCenterX -= (pmouseX-mouseX);
      }
      else{
        centerY += (mouseY-pmouseY) * 0.2;
        centerX -= (pmouseX-mouseX) * 0.2;
      }
    }else if(mouseButton == RIGHT){
      velocityY += (mouseY-pmouseY) * 0.01;
    }
  }
  
  cp = get();
  
  stroke(0);
  fill(255);
  text("Feedback v2",width-120,height-20);
  text(textvar,20,height-20);
  noFill();
  
  timer = timer+0.005;
  if( timer > 1 )
    timer = 0;
}

void keyPressed(){
  if( key == '+' ){
    textvar = "Increase Size";
    if(OBJECT)
      objScale += 1;
    else
      planeScale += 1;
  }else if( key == '-' ){
    textvar = "Decrease Size";
    if(OBJECT)
      objScale -= 1;
    else
      planeScale -= 1;    
  }else if( key == '1' && RAND_ALPHA > 0){
    textvar = "Decrease Randomness";
    RAND_ALPHA -= 0.01;
  }else if( key == '2' && RAND_ALPHA < 1){
    textvar = "Increase Randomness";
    RAND_ALPHA += 0.01;
  }else if( key == '3' && SAMPLES > 2 ){
    textvar = "Decrease Grid Resolution";
    SAMPLES -= 1;
    hmap.setSamples(SAMPLES);
  }else if( key == '4' && SAMPLES < 32) {
    textvar = "Increase Grid Resolution";
    SAMPLES += 1;
    hmap.setSamples(SAMPLES);
  }
}

void keyReleased(){
  if( key=='a' ){
    ANIM = !ANIM;
    textvar = "Input plane rotation "+ANIM;    
  }else if( key == 'o' ){
    OBJECT = !OBJECT;
    textvar = (OBJECT?"Input":"Feedback")+" plane";
  }else if( key == 's'){
    if( OBJECT)
      OSTROKES = !OSTROKES;
    else
      PSTROKES = !PSTROKES;
  }else if( key == 't' )
    TEXTURE = !TEXTURE;
  else if( key == 'p' ){
    OBJTRANSP = !OBJTRANSP;
    textvar = "Input plane "+(OBJTRANSP?"disabled":"enabled");
  }else if( key == 'r' ){
    RELIEF = !RELIEF;
    textvar = "Relief "+RELIEF;
    if( RELIEF )
      hmap.generateValues();
    else
      hmap.flattenValues();
  }else if( key == 'g' ){
    RANDOM_MODE = (RANDOM_MODE+1)%3;
    textvar = "Random mode "+RANDOM_MODE;
  }else if( key == '0' ){
/*    screenshotdest = "p_"+year()+"_"+month()+"_"+day()+"_"+hour()+minute()+second()+"_"+cpTimer+".jpg";
    cp.save(screenshotdest);
    textvar = "Screenshot saved to: screenshotdest";
    cpTimer++;*/
  }
}


class Heightfield{

  float _values[];
  int _samples;
  
  Heightfield( int isamples ){
    setSamples(isamples);
  }
  
  void generateValues(){
    for( int k = 0; k<_values.length; k++){
      _values[k] = 0.5-noise(0.09*(k%_samples),0.09*(k/_samples));
    }
  }
  
  void flattenValues(){
    for( int k = 0; k<_values.length; k++){
      _values[k] = 0;
    }    
  }
  
  void setSamples(int isamples){
    _samples = isamples;
    _values = new float[_samples*_samples];
    if( RELIEF )
      generateValues();
    else
      flattenValues();
  }
  
  float randValue(int k, int l){
    switch(RANDOM_MODE){
      case 0:
        return random(1);
      case 1:
        return noise(0.9*k+timer,0.9*l+timer);
      default:
        return 0.5*(k%2+l%2);
        //return pow(cos(PI*k/_samples),2)+pow(sin(PI*l/_samples),2);
        //return sin(PI*k/_samples-0.35)*sin(PI*l/_samples-0.35);
        //return tan(PI*k/_samples)*tan(PI*l/_samples);
    }
  }
  
  void generateHeightfield(PImage cp){
    float step = 2.0/(_samples-1);
    if( RAND_ALPHA > 0 ){
      for( int i=0; i<_samples-1; i++ ){
        beginShape(QUAD_STRIP);
        textureMode(NORMALIZED);
        texture(cp); 
        for( int j=0; j<_samples; j++){
          vertex(-1+j*step,-1+i*step,_values[j+i*_samples],
            (1-RAND_ALPHA)*j*step*0.5+RAND_ALPHA*randValue(j,i), (1-RAND_ALPHA)*i*step*0.5+RAND_ALPHA*randValue(j,i)); 
          vertex(-1+j*step,-1+(i+1)*step,_values[j+(i+1)*_samples],
            (1-RAND_ALPHA)*j*step*0.5+RAND_ALPHA*randValue(j,i), (1-RAND_ALPHA)*(i+1)*step*0.5+RAND_ALPHA*randValue(j,i+1));
        }
        endShape();
      }
    }else{
      for( int i=0; i<_samples-1; i++ ){
        beginShape(QUAD_STRIP);
        textureMode(NORMALIZED);
        texture(cp); 
        for( int j=0; j<_samples; j++){
          vertex(-1+j*step,-1+i*step,_values[j+i*_samples],j*step*0.5,i*step*0.5);
          vertex(-1+j*step,-1+(i+1)*step,_values[j+(i+1)*_samples],j*step*0.5,(i+1)*step*0.5);
        }
        endShape();
      }
    }
  }
}
                
                
