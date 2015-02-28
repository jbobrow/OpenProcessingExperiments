
import processing.opengl.*;
/*
viewport           => klick & drag to rotate the figure
modification       => number of grids: keys '4' & '6'
                      size of grids:   keys '+' & '-'
                      wave amplitude:  keys '7' & '1'
                      wave length:     keys '8' & '2'
                      wave velocity:   keys '9' & '3'
                      wave center:     keys 'UP' & 'DOWN' & 'RIGHT' & 'LEFT'
reset modification => key 'r'

*/


//vars for driving variables
int ArrUpDown = -14;    //0;        //def 0        
int ArrRiLeft = -14;    //-16;       //def 0  //15  
int KeyPlusMinus = 10;               //def 14
int Keys71 =-3;         //4;         //def 4
int Keys82 =-2;         //2;         //def 2
int Keys93 = 50;         //1;         //def 1
int Keys46 = 7;         //7;         //def 7  //33

//backup vars for reseting
int ArrUpDown_R = ArrUpDown;
int ArrRiLeft_R = ArrRiLeft;
int KeyPlusMinus_R = KeyPlusMinus;
int Keys71_R = Keys71;
int Keys82_R = Keys82;
int Keys93_R = Keys93;
int Keys46_R = Keys46;

//vars to modify the figure
int xCount = 4;           //x-resolution of the grid   press "+" or "-" to vary
int yCount = 4;           //y-resolution of the grid   press "+" or "-" to vary
float WaveAmplitude = 1;  //press 7 or 1 on numpad to drive that value
float WaveLength = 10;    //press 8 or 2 on numpad to drive that value
float WaveVelocity = 1;   //press 9 or 3 on keyboard to drive that value ///<<<---- disabled for looping. <<loopFrames>> & <<looper>> drive the velocity
float WaveCenterX = 0;    //press Right-Left Arrows to drive that Value
float WaveCenterY = 0;    //press Up-Down Arrows to drive that Value
int instancesCount = 1;   //press 4 or 6 on numpad to drive that value

//vars for clean looping (set loop-itervals here)
int loopFrames = 72; // 96 fr => 4 seconds at 24 fps
int myFrameRate = 24;

//vars for the viewport
int offsetX = 0, offsetY = 0, clickX = 0, clickY = 0;
float rotationX = QUARTER_PI, rotationY = -QUARTER_PI-QUARTER_PI/3, targetRotationX = 0, targetRotationY = 0, clickRotationX, clickRotationY;


void setup() {
 size(512, 512, OPENGL);
 smooth();
 frameRate(myFrameRate);

 fill(255); 
}

void draw() {
  background(0);
  stroke(0,255,255);
  strokeWeight(2);
  fill(0);
  setView();
  scale(10);
  //setting the vars according to control-keys
  xCount = KeyPlusMinus;
  yCount = KeyPlusMinus;
  instancesCount = Keys46;
  WaveCenterX = ArrRiLeft; //- xCount/2;  //<- that's a nice modification, putting the center of the center of the grid
  WaveCenterY = ArrUpDown; //- yCount/2;
  WaveAmplitude = Keys71;
  WaveLength = Keys82;
  WaveVelocity = Keys93;
  /*
  //draw Mesh
  for (int y = 0; y < yCount; y++) {
    beginShape(QUAD_STRIP);
    for (int x = 0; x <= xCount; x++) {
      float z = sin(sqrt(sq(x+ArrRiLeft) + sq(y+ArrUpDown))*norm(WaveLength, 0,10)-frameCount*map(WaveVelocity, 0, 10, 0, 1))*WaveAmplitude;
      vertex(x, y, z);
      z = sin(sqrt(sq(x+ArrRiLeft)+sq(y+1+ArrUpDown))*norm(WaveLength, 0, 10)-frameCount*map(WaveVelocity, 0, 10, 0, 1))*WaveAmplitude;
      vertex(x, y+1, z);
    }
    endShape();
  }
  */
  //draw Mesh Istances
  drawMeshInstance(xCount, yCount, WaveAmplitude, WaveLength, WaveVelocity, WaveCenterX, WaveCenterY);
  pushMatrix();
  for(int i=0; i < instancesCount; i++) {
    //float tInstCount = instancesCount;
    //if (instancesCount == 0) {tInstCount = 1;};
    float angle = TWO_PI/(instancesCount+1);
    rotateZ(angle);
    drawMeshInstance(xCount, yCount, WaveAmplitude, WaveLength, WaveVelocity, WaveCenterX, WaveCenterY);
  }
  popMatrix();
  
  //////////RENDER FRAMES
  
  //renderFrameRange(72,144);
  
}

void mousePressed() {
  clickX = mouseX;
  clickY = mouseY;
  clickRotationX = rotationX;
  clickRotationY = rotationY;
}

void drawMeshInstance (int aXcount, int aYcount, float aWaveAmplitude, float aWaveLength, float aWaveVelocity, float aWaveCenterX, float aWaveCenterY){
    float looper = TWO_PI*frameCount/100*norm(WaveVelocity, 0, 50);//map(frameCount%loopFrames, 0, loopFrames, 0, TWO_PI); //calculates the speed of the SinWave
    for (int y = 0; y < aYcount; y++) {
    beginShape(QUAD_STRIP);
    for (int x = 0; x <= aXcount; x++) {
      float z = sin(sqrt(sq(x+aWaveCenterX) + sq(y+aWaveCenterY))*norm(aWaveLength, 0,10)-looper)*aWaveAmplitude;
      vertex(x, y, z);
      z = sin(sqrt(sq(x+aWaveCenterX)+sq(y+1+aWaveCenterY))*norm(aWaveLength, 0, 10)-looper)*aWaveAmplitude;
      vertex(x, y+1, z);
    }
    endShape();
  }
} 

void setView() {
  translate(width*0.5, height*0.5);
  
  if (mousePressed) {
    offsetX = mouseX-clickX;
    offsetY = mouseY-clickY;
    targetRotationX = clickRotationX + offsetX/float(width) * TWO_PI;
    targetRotationY = min(max(clickRotationY + offsetY/float(height) * TWO_PI, -HALF_PI), HALF_PI);
    rotationX += (targetRotationX-rotationX) * 0.25;
    rotationY += (targetRotationY-rotationY)* 0.25;
  }
  rotateX(-rotationY);
  rotateY(rotationX-PI/6);
  //float looper = map(frameCount%loopFrames, 0, loopFrames, 0, TWO_PI/(instancesCount+1)); //calculating the rotation based on the number of grid-instances
  rotateZ(map(frameCount%360, 0, 360, 0, TWO_PI));
}

void keyPressed() {
  if (key == CODED) {
    switch(keyCode) {
      case UP:
       ArrUpDown +=1;
       println( "ArrRiLeft = "+ArrRiLeft+" | ArrUpDown = "+ArrUpDown);
       break;
      case DOWN:
       ArrUpDown -=1;
       println( "ArrRiLeft = "+ArrRiLeft+" | ArrUpDown = "+ArrUpDown);
       break;
      case RIGHT:
       ArrRiLeft += 1;
       println( "ArrRiLeft = "+ArrRiLeft+" | ArrUpDown = "+ArrUpDown);
       break;
      case LEFT:
       ArrRiLeft -= 1;
       println( "ArrRiLeft = "+ArrRiLeft+" | ArrUpDown = "+ArrUpDown);
       break;
    }
  }
  switch(key) {
    case '+':
     KeyPlusMinus += 1;
     println( "KeyPlusMinus = "+KeyPlusMinus);
     break;
    case '-':
     KeyPlusMinus -= 1;
     println( "KeyPlusMinus = "+KeyPlusMinus);
     break;
    case '7':
     Keys71 += 1;
     println("Keys71 = "+Keys71);
     break;
    case '1':
     Keys71 -= 1;
     println("Keys71 = "+Keys71);
     break;
    case '8':
     Keys82 += 1;
     println("Keys82 = "+Keys82);
     break;
    case '2':
     Keys82 -= 1;
     println("Keys82 = "+Keys82);
     break;
    case '9':
     Keys93 += 1;
     println("Keys93 = "+Keys93);
     break;
    case '3':
     Keys93 -= 1;
     println("Keys93 = "+Keys93);
     break;
    case '6':
     Keys46 += 1;
     println("Keys46 = "+Keys46);
     break;
    case'4':
     Keys46 -= 1;
     println("Keys46 = "+Keys46);
     break;
    case'r':
     resetVars();
    
  }
}

void resetVars() {
  ArrUpDown = ArrUpDown_R;           
  ArrRiLeft = ArrRiLeft_R;      
  KeyPlusMinus = KeyPlusMinus_R;              
  Keys71 = Keys71_R;        
  Keys82 = Keys82_R;            
  Keys93 = Keys93_R;         
  Keys46 = Keys46_R; 
  
}

void renderFrameRange(int staFrame, int stoFrame) {
  if(staFrame > frameCount) {println("WAITING for RENDER-PRERUN to end");};
  
  if((staFrame <= frameCount) && (frameCount < stoFrame)) {
    saveFrame("130723a_Hallo_SinusWaveOnGrid_loop72fr_#####.png");
    println("RENDERING at " + frameRate + "fps");
  }
  if(stoFrame < frameCount){println("RENDERING DONE");};
}


