
int diam=20;
int circleNum=50;

float[] xpos = new float[circleNum];
float[] ypos= new float[circleNum];

float[] velX = new float [circleNum];     
float[] velY = new float [circleNum];    

//int x=xdirection;
//int y=ydirection;

void setup(){
  size (1000,600);
  background(0);
  frameRate(40);
  noStroke();
    for(int i=0; i<circleNum; i++){
    xpos[i]=random(diam, width-diam);
//    for(int i=0; i<circleNum; i++){
    ypos[i]=random(diam, height+diam);
    
    velX[i]=random(15,20);
    velY[i]=random(20,20);
//    }
  }
}
void draw(){
  background(127.5);
//  xpos = xpos + (xspeed * xdirection);
//  ypos = ypos + (yspeed * ydirection);

  for (int i=0; i<circleNum; i++){
    xpos[i]+=velX[i];
    ypos[i]+=velY[i];
  
  if(xpos[i]< 0 || xpos[i] > width-diam){
      velX[i]*=-1;
  }
  
  if(ypos[i] >= diam || ypos[i] > height-diam){
       velY[i]*=-1;
       

       
  ellipse (xpos[i], ypos[i], diam, diam);

  }
  }
 }

