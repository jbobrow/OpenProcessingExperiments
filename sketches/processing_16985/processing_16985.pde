
int counter;
int i ;
float[][] ls;
float[] l;
float newAngle;
bool alreadyClicked;
float k;
int numAnts;
float depth = 0;
color black = new color(0,0,0);
color white = new color(255,255,255);
bool keyAlreadyPressed;

void setup() {  //setup function called initially, only once
  size(500, 500);
 background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  l = {width/2,height/2, 0, PI/2, 1,2);
  k = 0.01;
  
  ls = new float[2^9][5];
  
  ls[0] = {width/2,height/2,PI/2,1,0,0};
  numAnts = 1;
  keyAlreadyPressed = false;
  
  
  
  clickedOnce = false;
  
  
}

void draw() {  //draw function loops 
   background(255);
   
    i = 0;
    
    if( keyPressed && !keyAlreadyPressed){
       ls = new float[2^9][5];
       ls[0] = {width/2,height/2,0,1,0,0};
       numAnts = 1;
       keyAlreadyPressed = true;
       depth  = 0;
    }
    
    if(mousePressed && !alreadyClicked && depth < 7){
       while( i < numAnts ){
       
          
          ls[numAnts + i] = {ls[i][0],ls[i][1],ls[i][2] + PI/15,ls[i][3],ls[i][4] + 0.001,ls[i][5] };
          ls[2*numAnts + i] = {ls[i][0],ls[i][1],ls[i][2] - PI/15,ls[i][3],ls[i][4] - 0.001,ls[i][5] };
          
          
          i++;
       }
       depth = depth + 1
       numAnts = numAnts*3;
       alreadyClicked = true;
       
    }
    
    i = 0;
    
    while(i < numAnts){
       updateLine(ls[i]);
       i++;
    }
          
  
  
}

                
 
 void updateLine(float[] lin){
 
    
 
    
    
    
    float nextX;
    float nextY;
    
    nextX = lin[0] + lin[3]*cos(lin[2]);
    nextY = lin[1] - lin[3]*sin(lin[2]);
    
    
    
    
    
    line(lin[0],lin[1],nextX,nextY);
    
    lin[5] += lin[4];
    lin[0] = nextX;
    lin[1] = nextY;
    lin[2] += lin[5];
    
    if( lin[0] > width || lin[0] <0 || lin[1] <0 || lin[1] > height ){
       lin[3] = -lin[3];
       lin[4] = - lin[4];
    }
       
    
 }
 
 void mouseReleased(){
    alreadyClicked =false;
 }
    
    
 void keyReleased(){
    keyAlreadyPressed = false;
 }
 
                
                                                                                
