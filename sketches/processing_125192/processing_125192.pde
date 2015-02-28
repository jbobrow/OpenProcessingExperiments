
import rwmidi.*;
MidiInput input;
MidiOutput output;

float[] cc = new float[127];

int fadeAmt = 5;
char lastKey;
color from = color(204, 102, 0);
color to = color(0, 102, 153);
float colorpos = 0;
float colorchange = 1;
float colorinc = 0.01;
float a = 0;
float x = 0;
float y = 0;
float z = 0;
float xinc = 0;
float yinc = 0;
float zinc = 0;

float boxSize = 50;
float boxMult = 1;

void setup()
{
  size(1000, 1000, P3D);
  strokeWeight(2);
  stroke(0);
  
  loop();
  cc[12]=cc[13]=cc[14]=64;
  cc[15]=27;
  
  input = RWMidi.getInputDevices()[1].createInput(this);
}

void draw()
{
  background(255,150);
  //fill(color(255),fadeAmt);
  //rect(0,0,width,height);
  lights();
  
  xinc = (cc[12]-63)/320;
  yinc = (cc[13]-63)/320;
  zinc = (cc[14]-63)/320;
  boxMult = int(cc[15]/12.7);
  fadeAmt = int(cc[16]*2);
  boxSize = 100;
  
  x += xinc;
  y += yinc;
  z += zinc;
  
  if (colorpos < 1 && colorpos > 0)   {
    colorpos += colorchange * colorinc;
  }
  else{
    if (colorpos >= 1) {
      colorchange = -1;
      colorpos += colorchange * colorinc;
      from = color(random(255),random(255),random(255));
    } else {
      colorchange = 1;
      colorpos += colorchange * colorinc;
      to = color(random(255),random(255),random(255));
    }
  }
  
  fill(lerpColor(from, to, colorpos));
  
  translate(width/2,height/2);
  
  rotateX(x);
  rotateY(y);
  rotateZ(z);
  
  a = 0;
  
  while (a < boxMult) {
    pushMatrix();
      translate(boxSize*a,0,0);
      
      box(boxSize);
      pushMatrix();
        translate(0,boxSize*a,0);
        box(boxSize);
        pushMatrix();
          translate(0,0,boxSize*a);
          box(boxSize);
        popMatrix();
        pushMatrix();
          translate(0,0,-boxSize*a);
          box(boxSize);
        popMatrix();
      popMatrix();
      pushMatrix();
        translate(0,-boxSize*a,0);
        box(boxSize);
        pushMatrix();
          translate(0,0,boxSize*a);
          box(boxSize);
        popMatrix();
        pushMatrix();
          translate(0,0,-boxSize*a);
          box(boxSize);
        popMatrix();
      popMatrix();
      
      pushMatrix();
        translate(0,0,boxSize*a);
        box(boxSize);
      popMatrix();
      pushMatrix();
        translate(0,0,-boxSize*a);
        box(boxSize);
      popMatrix();
    popMatrix();
    
    pushMatrix();
      translate(-boxSize*a,0,0);
      
      box(boxSize);
      pushMatrix();
        translate(0,boxSize*a,0);
        box(boxSize);
        pushMatrix();
          translate(0,0,boxSize*a);
          box(boxSize);
        popMatrix();
        pushMatrix();
          translate(0,0,-boxSize*a);
          box(boxSize);
        popMatrix();
      popMatrix();
      pushMatrix();
        translate(0,-boxSize*a,0);
        box(boxSize);
        pushMatrix();
          translate(0,0,boxSize*a);
          box(boxSize);
        popMatrix();
        pushMatrix();
          translate(0,0,-boxSize*a);
          box(boxSize);
        popMatrix();
      popMatrix();
      
      pushMatrix();
        translate(0,0,boxSize*a);
        box(boxSize);
      popMatrix();
      pushMatrix();
        translate(0,0,-boxSize*a);
        box(boxSize);
      popMatrix();
    popMatrix();
    
    pushMatrix();
      translate(0,boxSize*a,0);
      box(boxSize);
      pushMatrix();
        translate(0,0,boxSize*a);
        box(boxSize);
      popMatrix();
      pushMatrix();
        translate(0,0,-boxSize*a);
        box(boxSize);
      popMatrix();
    popMatrix();
    pushMatrix();
      translate(0,-boxSize*a,0);
      box(boxSize);
      pushMatrix();
        translate(0,0,boxSize*a);
        box(boxSize);
      popMatrix();
      pushMatrix();
        translate(0,0,-boxSize*a);
        box(boxSize);
      popMatrix();
    popMatrix();
    
    pushMatrix();
      translate(0,0,boxSize*a);
      box(boxSize);
    popMatrix();
    pushMatrix();
      translate(0,0,-boxSize*a);
      box(boxSize);
    popMatrix();
    
    a += 1;
  }
}

void controllerChangeReceived(rwmidi.Controller controller){
 print(controller.getCC());
 print(" ");
 println(controller.getValue()); 
 cc[controller.getCC()] = controller.getValue();
}
