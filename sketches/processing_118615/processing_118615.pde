
float[] hP = new float[]{0.0,10.0,-10*sqrt(3.0)/2.0,5.0,-10*sqrt(3.0)/2.0,-5.0,0,-10.0,10*sqrt(3.0)/2.0,-5,10*sqrt(3.0)/2.0,5};
//float[] hP = new float[]{10.0,0.0,5,-10*sqrt(3.0)/2.0,-5,-10*sqrt(3.0)/2.0,-10.0,0.0,-5,10*sqrt(3.0)/2.0,5,10*sqrt(3.0)/2.0};
int dim = 700;
int startTime = 0;
int lineS = 2;
int hexS = 2;
int numX = 5;
int numY = 5;
int[] jits = new int[numX*numY*2];
int targetLoc;
Hexagon hex;
int colorMode=0;
testMode activeMode;
ArrayList<testMode> testModes;
int trialsDone = 0;
boolean isDone = false;
boolean startScreen = true;
testMode cubes = new testMode(new color[]{80,80,180,180,130,130},10);
testMode solids = new testMode(new color[]{130,130,130,130,130,130},10);
testMode blanks = new testMode(new color[]{250,250,250,250,250,250},10);

void setup(){
  size(700,700);
  testModes = new ArrayList<testMode>();
  testModes.add(cubes);
  testModes.add(solids);
  testModes.add(blanks);
  activeMode = cubes;
  background(250);
  newSearch();
}

void draw(){
  if(isDone){
    endRun();
  }else if(startScreen){
    showStart();
  }else{
    drawAllStims();
  }
}

void newSearch(){
  background(250);
  hex = new Hexagon(activeMode.grays);
  for(int i=0;i<numX*numY*2+1;i++){
    jits[i] = floor(random(-10,10));
  }
  jits[numX*numY*2]=floor(random(0,2));
  targetLoc = floor(random(numX*numY));
  startTime = millis();
}

void reset(){
  background(250);
  colorMode=0;
  trialsDone=0;
  isDone=false;
  activeMode=cubes;
  print(activeMode.nTrials);
  print(cubes.nTrials);
  newSearch();
  cubes.totalTargetTimes=0;
  solids.totalTargetTimes=0;
  blanks.totalTargetTimes=0;
}

class testMode{
  color[] grays;
  int successes = 0;
  int nTrials;
  int totalTargetTimes = 0;
  testMode(color[] gs, int nTs){
    grays = gs;
    nTrials = nTs;
  }
}

void drawAllStims(){
  float dx = dim/(numX);
  float dy = dim/(numY);
  for(int ix=0;ix<numX;ix++){
    for(int iy=0;iy<numY;iy++){
      int xJit = jits[((ix)*numY+iy)*2];
      int yJit = jits[((ix)*numY+iy)*2+1];
      if((ix)*numY+iy==targetLoc){
        drawStim(dx*(ix)+dx/2+xJit,dy*(iy)+dy/2+yJit,.65-jits[numX*numY*2]*.3,lineS,hexS,hex);
      }else{
        drawStim(dx*(ix)+dx/2+xJit,dy*(iy)+dy/2+yJit,.5,lineS,hexS,hex);
      }
    }
  }
}

void endTrial(){
  activeMode.successes++;
  activeMode.totalTargetTimes = activeMode.totalTargetTimes + millis()-startTime;
  trialsDone++;
  if(trialsDone == activeMode.nTrials){
    nextMode();
    trialsDone=0;
  }
  newSearch();
}

void nextMode(){
  colorMode++;
  if(colorMode>2){
    endRun();
  }else{
    activeMode = testModes.get(colorMode);
  }
}

void mouseReleased(){
  if(isDone||startScreen){
    if(mouseX<dim/2+50&&mouseX>dim/2-50&&mouseY>dim-195&&mouseY<dim-165){
      isDone=false;
      startScreen=false;
      reset();
    }
  }else if(floor(mouseX/(dim/numX+1))==floor(targetLoc/numY)&&floor(mouseY/(dim/numY+1))==targetLoc%numX){
      endTrial();
  }
}

void drawStim(float x, float y, float hexPosition, float lineSize, float hexSize, Hexagon hex){
  stroke(0);
  strokeWeight(lineS*3);
  line(x-15*lineSize,y,x+15*lineSize,y);
  hex.drawHexagon((x-15*lineSize)+(lineSize*30)*hexPosition,y,hexSize);
}

class Hexagon{
  color[] colors;
  Hexagon(color[] cs){
    colors = cs;
  }
  void drawHexagon(float x, float y,float s){
    for(int i=0;i<6;i++){
      fill(colors[i]);
      strokeWeight(0.8);
      stroke(colors[i]);
      int j=i*2;
      pushMatrix();
      translate(x,y);
      scale(s);
      triangle(0,0,hP[j%12],hP[(j+1)%12],hP[(j+2)%12],hP[(j+3)%12]);
      //line(0,0,hP[j%6],hP[(j+1)%6]);
      popMatrix();
    }
  }
}

void showStart(){
  startScreen=true;
  background(#FFFFFF);
  fill(50);
  textSize(20);
  text("Completion Search!",dim/2-85,dim/2-10);
  text("Click on the uneven lines as fast as possible!",dim/2-190,dim/2+30);
  text("There are three rounds of ten trials.",dim/2-155,dim/2+60);
  fill(250);
  stroke(0);
  rect(dim/2-50,dim-195,100,30);
  fill(0);
  textSize(28);
  text("Start!",dim/2-40,dim-170);
  textSize(10);
  text("v0.9 by Guillaume Riesen",dim/2-60,dim-10);
}
  
  
void endRun(){
  isDone = true;
  background(#FFFFFF);
  fill(50);
  textSize(12);
  text("End of Trial",dim/2-20,dim/2-10);
  for(int i = 0;i<3;i++){
    text("Mode " + int(i+1) + " average: " + float(testModes.get(i).totalTargetTimes/testModes.get(i).nTrials)/1000.0 + " seconds",dim/2-80,dim/2+20+i*20);
  }
  fill(250);
  stroke(0);
  rect(dim/2-50,dim-195,100,30);
  fill(0);
  textSize(28);
  text("Again!",dim/2-40,dim-170);
}  


