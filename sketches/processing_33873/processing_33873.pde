
/*I looked at Nicole's program to firgure this one out.*/
int diam= 5;                             //width of the shape
int numCircle = 50;                       //number of circles
 
float[] xpos = new float[numCircle];      //starting position x
float[] ypos = new float[numCircle];      //starting position y
 
float[] velX = new float [numCircle];     //velocity of the shape
float[] velY = new float [numCircle];     //velocity of the shape
 
void setup(){
  size(200,600);
  stroke(2);
  smooth();
  fill(40,40,40);
  //random starting position
  for (int i=20; i< numCircle; i++){
    xpos[i]= random(diam, width-diam);
    ypos[i]= random(diam, height-diam);
     
    velX[i] = random(0,3);
    velY[i] = random(3,0); 
  }
}
 
void draw(){
  background(20,40,200);
  //updates the position of the shape
  for(int i=0; i<numCircle; i++){
    xpos[i] +=velX[i];
    ypos[i] +=velY[i];
     
    //set boundaries for the shapes
    if(xpos[i] < diam || xpos[i] > width-diam) {
      velX[i]*=-1;
    }
    if(ypos[i] < diam || ypos[i] > height-diam) {
      velY[i]*=-1;
    }
 
    ellipse(xpos[i], ypos[i], diam,diam);
  }
}


