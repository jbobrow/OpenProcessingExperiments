
int radius = 150;
int deg = 0;
int maxDegrees = 360;
int increment = 12;
int[] xTracker = new int[maxDegrees/increment];
int[] yTracker = new int[maxDegrees/increment];
int[] randomized = new int[30];

int globalBackgroundR;
int globalBackgroundG;
int globalBackgroundB;

int colorIndex;
int[][] colors = new int[5][3];

int globalRed;
int globalGreen;
int globalBlue;

void setup(){
  size(700,400);
  setColors();
  setBackground();
  refreshStroke();
  

  smooth();
  uia();

}
void draw(){


}
void mousePressed(){
  clear();
setColors();
setBackground();
redrawSeeds();


  
}
void uia(){
  setBackground();
  // background(globalBackgroundR,globalBackgroundG,globalBackgroundB);
  int tracker = 0;
  for(deg=0;deg<maxDegrees;deg+=increment){
    float angle = radians(deg);
    float x = width/2+(cos(angle)*radius);
    float y = height/2+(sin(angle)*radius);

    //    ellipse(x,y,6,6);
    xTracker[tracker] = int(x);
    yTracker[tracker] = int(y);


    tracker++;
  }

  //monta array indexadora.

  redrawSeeds();

}



void redrawSeeds(){

  for(int i=0;i<30;i++){
    randomized[i] = int(random(29));
  }

  for(int i = 0;i<30;i++){
    int xPointer = xTracker[randomized[i]];
    int yPointer = yTracker[randomized[i]];
    refreshStroke();
    if(i>0){
      line(xPointer,yPointer,xTracker[randomized[i-1]],yTracker[randomized[i-1]]);
    }
    else{
      line(xPointer,yPointer,xTracker[randomized[i+1]],yTracker[randomized[i+1]]);
    }
  }
}

void clear(){
  // background(globalBackgroundR,globalBackgroundG,globalBackgroundB); 
  setBackground();
}

int setColors(){
  colors[0][0] = 59;
  colors[0][1] = 15;
  colors[0][2] = 15;

  colors[1][0] = 74;
  colors[1][1] = 64;
  colors[1][2] = 50;

  colors[2][0] = 106;
  colors[2][1] = 107;
  colors[2][2] = 84;

  colors[3][0] = 132;
  colors[3][1] = 145;
  colors[3][2] = 105;

  colors[4][0] = 196;
  colors[4][1] = 209;
  colors[4][2] = 167;

  colorIndex = int(random(5));
  globalBackgroundR = colors[colorIndex][0];
  globalBackgroundG = colors[colorIndex][1];
  globalBackgroundB = colors[colorIndex][2];

  return colorIndex;
}

void setBackground(){
  background(globalBackgroundR,globalBackgroundG,globalBackgroundB);
}

void refreshStroke(){
  int strokeIndex = int(random(5));
  if(strokeIndex == colorIndex){
    if(strokeIndex==4){
      strokeIndex--;
    }else{
      strokeIndex++;
    }
  }
  println(strokeIndex);
  globalRed = colors[strokeIndex][0];
  globalGreen = colors[strokeIndex][1];
  globalBlue = colors[strokeIndex][2];
  stroke(globalRed,globalGreen,globalBlue);
}







