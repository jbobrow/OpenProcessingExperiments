
int nRects= 100;

float xpos[] = new float[nRects];
float ypos[] = new float[nRects];
int gpos[]= new int[nRects];
float speed[]= new float [nRects];
float scaleRects[] = new float[nRects];

void setup(){
  size(500,500);
  smooth();
  
  for(int i = 0; i < xpos.length; i++) {
    xpos[i]= width/2;
    ypos[i]= height/2;
    gpos[i] = int( random (255));
    speed[i] = random(10);
    scaleRects[i] = random(10,50);
  }
}

void draw(){
  //draw the background
  background(0);
  //make a for loop to access array values
    for(int i = 0; i < xpos.length; i++){
     //set the values i the array to increment by a number 
     //between -1 and 1
  xpos[i] += random(-speed,speed[i]);
  xpos[i] = constrain(xpos[i] , 0 ,width);
  
  ypos[i] += random(-1,1);
  ypos[i] = constrain(ypos[i], 0, width);
  
  //then set the color and draw a rectabgle
  fill(255);
  rect (xpos[i],ypos[i],10,10);
    }
}
