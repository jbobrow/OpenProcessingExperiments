
float theWidth = 500;
float theHeight = 500;
float LOOKER_RADIUS = 60.0;
float numX = 27;
float numY = 27;
float noiseCount = 0;
AngleThing[][] myAngleThing = new AngleThing[(int)numX][(int)numY];
void setup(){
  noiseDetail(10);
  size((int)theWidth, (int)theHeight);
  background(255);
  noStroke();
  colorMode(HSB, 30.0, 255, 1.0, 255);
  for(int i=0; i<myAngleThing.length; i++){
    int theLength = myAngleThing[0].length;
    for(int j=0; j<theLength; j++){
      int tempX = (int)(theWidth/(numX-10.0)*(i-4));
      int tempY = (int)(theHeight/(numY-10.0)*(j-4));
      float theHue = PI+atan2((float)tempY-(float)theHeight/2.0, (float)tempX-(float)theWidth/2.0);
      myAngleThing[i][j] = new AngleThing(tempX, tempY);
      myAngleThing[i][j].render();
    }
  }
}

void draw(){
  background(255);
  for(int i=0; i<myAngleThing.length; i++){
    int theLength = myAngleThing[0].length;
    for(int j=0; j<theLength; j++){
      myAngleThing[i][j].update();
      myAngleThing[i][j].render();
    }
  }
  noiseCount += .01;
}

void mousePressed(){
  save("thumb.tif");
}

class AngleThing{
  float wigCo = 12.0;
  PVector pos;
  PVector wiggle;
  float lookingTheta;
  float openedTheta;
  float arcHue = 5;
  float ellipHue = 5;
  float sen = 3.24;
  float radius = 10;
  AngleThing(int x_, int y_){
    pos = new PVector(x_, y_);
    wiggle = new PVector(0, 0);
  }
  void update(){
    lookingTheta = noise(pos.x/theWidth*.5, pos.y/theHeight*.5, noiseCount)*2*PI;
    openedTheta = noise(pos.x/theWidth*5.0, pos.y/theHeight*5.0, noiseCount)*PI;
    arcHue = (1.75*noise(pos.x/theWidth, pos.y/theHeight, noiseCount*.2))%1.0;
    ellipHue = 1.75*noise(pos.x/theWidth, pos.y/theHeight, noiseCount*.2+4.0);
    radius = LOOKER_RADIUS*(2.0-(1.0/(1.0+sen))-(2.0-(1.0/(sen+1.0))*2.0)*noise(pos.x/theWidth*5.0, pos.y/theHeight*5.0, noiseCount*1.5));
    wiggle.x = wigCo*noise(pos.x/theWidth*.25, pos.y/theHeight*.25, noiseCount*.07+10.0);
    wiggle.y = wigCo*noise(pos.x/theWidth*.25, pos.y/theHeight*.25, noiseCount*.07+20.0);
  }
  void render(){
    fill(((20-20*cos(2*PI*ellipHue))/2.0+15.0)%30.0, 255, 255, 255);
    ellipse(pos.x+wigCo*wiggle.x*cos(wiggle.y), pos.y+wigCo*wiggle.x*sin(wiggle.y), radius, radius);
    fill(((20-20*cos(2*PI*arcHue))/2.0+15.0)%30.0, 180, 255, 255);
    arc(pos.x+wigCo*wiggle.x*cos(wiggle.y), pos.y+wigCo*wiggle.x*sin(wiggle.y), radius, radius, lookingTheta-openedTheta, lookingTheta+openedTheta);
  }
}

