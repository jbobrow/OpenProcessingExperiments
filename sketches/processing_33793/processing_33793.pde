
int numCircles = 50;
float [] circleX = new float[numCircles];
float [] circleY = new float[numCircles];

int [] rad = new int[numCircles];

float[] speed=new float[numCircles];
float[] r=new float[numCircles];
float[] g=new float[numCircles];
float[] b=new float[numCircles];

boolean[] isGoingRight=new boolean[numCircles];
boolean[] isGoingDown=new boolean[numCircles];

 
void setup(){
  size(500,500);
  smooth();
  noStroke();
  frameRate(20);

   
  for(int i=0; i< numCircles; i++){
    rad[i]= 2*(i+1);
    circleX[i] = round(random(rad[i], width-rad[i]));
    circleY[i] = round(random(rad[i], height-rad[i]));
    speed[i]=random(5,10);
    r[i] =random(130,255);
    g[i] =random(133);
    b[i] =random(0);
    isGoingRight[i] = true;
    isGoingDown[i] = false;
  }
  
}
 
 
 
void draw(){
  background(121,181,200);
  
  for(int i=0; i< numCircles; i++){
    ellipse(circleX[i], circleY[i],rad[i],rad[i]);
    fill(r[i], g[i], b[i]);
    noStroke();
    
    //for X  
    //x-right side
    if (circleX[i] + ((rad[i])/2) > width) {
      isGoingRight[i]=false;
    }
    //x-left side
    if (circleX[i] - ((rad[i])/2) < 0) {
      isGoingRight[i]=true;
    }
    
    if (isGoingRight[i] == true) {
      circleX[i]+=speed[i];
    }
    
    else {
      circleX[i]-=speed[i];
    }
     

   //for Y
   //y-bottom side
    if (circleY[i] + ((rad[i])/2) > height) {
      isGoingDown[i]=false;
    }
    //y-top side
    if (circleY[i] - ((rad[i])/2) < 0) {
      isGoingDown[i]=true;
    }
    
    if (isGoingDown[i] == true) {
      circleY[i]+=speed[i];
    }
    else {
      circleY[i]-=speed[i];
    }
     
  }
}
 

   
    








