
/* Processing Sketch by Dominique Schmitz, February 2013 */
/* OpenProcessing http://www.openprocessing.org/user/9076 */
 
PVector sP = new PVector(100,150);
PVector sP2 = new PVector(90,120); 
PVector speeds1 = new PVector(3,2);
PVector speeds2 = new PVector(1,4);

int steps = 2000;       // steps to calculate
int showSteps = steps;  // steps to show
int i;

int skip = 1;

boolean start = true;
boolean m = true;

void setup(){
  size(800,600); 
  background(255);  
}


void draw(){   
  background(255);
  strokeCap(CORNER);
  speeds1 = new PVector(map(mouseY,0,height,1, 11),map(mouseX,0,width,1, 11));
  speeds2 = new PVector(map(mouseX,0,width,1, 11),map(mouseY,0,height,1, 11));
  render(steps); 
}

void render(int st){
  PVector [] finalP = fP(sP, st, speeds1);
  PVector [] finalP2 = fP(sP2, st, speeds2);
        
    stroke(0,100);
    for(i = 0; i< finalP2.length;i+=skip){ 
      float th = map(dist(finalP[i].x, finalP[i].y, finalP2[i].x, finalP2[i].y),
                     0, height, 4, 0.1);
                     strokeWeight(constrain(th,0.1,4));
      line(finalP[i].x, finalP[i].y, finalP2[i].x, finalP2[i].y);
    }  
}

PVector [] fP(PVector posIn, int s, PVector t){   
  PVector [] posOut = new PVector[s];  
  posOut[0] = posIn;
  int dirX = 1; int dirY = 1;
  
  float[] x = new float[s]; float[] y = new float[s];
  x[0]=posIn.x; y[0]=posIn.y;
  
  for(int i = 0; i<steps-1;i++){
    x[i+1]=x[i];
    y[i+1]=y[i];
   
    if((x[i+1]+t.x) > width){ dirX*=-1; } else if((x[i+1]-t.x) < 0){ dirX*=-1; }  
    if((y[i+1]+t.y) > height){ dirY*=-1; } else if((y[i+1]-t.y) < 0){ dirY*=-1; }
    
    x[i+1]+=(t.x*dirX);
    y[i+1]+=(t.y*dirY);
  }
  
  for(int j = 0; j<x.length;j++){ posOut[j] = new PVector(x[j],y[j]); }
  return posOut;
}


void keyPressed(){
  if (key == CODED) {
    if (keyCode == UP) {
        steps+=50;
    } else if (keyCode == DOWN) {
      if(steps-50 > 0){
        steps-=50;
      } else {
        steps=1;
      }
    } 
  }
}



