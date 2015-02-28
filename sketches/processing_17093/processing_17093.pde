
int counter;
int i ;
float[][] ls;
float[] l;
float newAngle;
bool alreadyClicked;
float k;
color black = new color(0,0,0);
color white = new color(255,255,255);

void setup() {  //setup function called initially, only once
  size(500, 500);
 background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  l = {width/2,height/2, 0, PI/2, 1,2);
  k = 0.001;
  
  ls = new float[2500][5];
  
  i = 0;
  while( i < ls.length){
     ls[i] = {width/2, height/2, (int)random(200)*PI/100, random(5),0, random(5)/10};
     i++;
  }
  
  
  clickedOnce = false;
  
  
}

void draw() {  //draw function loops 
   background(255);
   
   
    if(mousePressed && !alreadyClicked){
      if( ! alreadyClicked){
      while( i < ls.length){
     ls[i] = {width/2,height/2, (int)random(200)*PI/100, random(5),0, random(5)/10};
     i++;
  }}
      alreadyClicked = true;
      
   }
   i = 0;
   
   while( i < ls.length){
      
      ls[i][4] = -k*ls[i][3];
      
      if(ls[i][3] < 0.001){
         ls[i][3] = 0;
      }
      i++;
   }
   
 
   i = 0;
   
   while( i < ls.length ){
      updateLine(ls[i]);
      i++;
   }
   
   i = 0;
   
  
  
}

                
 
 void updateLine(float[] lin){
 
    
 
    
    
    
    float nextX;
    float nextY;
    
    nextX = lin[0] + lin[3]*cos(lin[2]);
    nextY = lin[1] - lin[3]*sin(lin[2]);
    
    
    
    
    
    line(lin[0],lin[1],nextX,nextY);
    
    //lin[5] += lin[4];
    
    lin[0] = nextX;
    lin[1] = nextY;
    //lin[2] += lin[5];
    
    if( lin[0] > width || lin[0] <0 || lin[1] <0 || lin[1] > height ){
       //lin[3] = -lin[3];
       //lin[4] = - lin[4];
    }
       
    
 }
 
 void mouseReleased(){
    alreadyClicked =false;
 }
    
    
    
    
                
                
