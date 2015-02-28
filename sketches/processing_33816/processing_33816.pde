
//Nicole Del Senno
//N00211488

int diam= 50;                             //width of the shape
int numCircle = 50;                       //number of circles

float[] xpos = new float[numCircle];      //starting position x
float[] ypos = new float[numCircle];      //starting position y

float[] velX = new float [numCircle];     //velocity of the shape
float[] velY = new float [numCircle];     //velocity of the shape

float[] r = new float [numCircle];        //r color value
float[] g = new float [numCircle];        //g color value
float[] b = new float [numCircle];        //b color value
float[] a = new float [numCircle];        //a color value

void setup(){
  size(800,600);
  noStroke();
  smooth();
  //random starting position 
  for (int i=0; i< numCircle; i++){
    xpos[i]= random(diam, width-diam);
    ypos[i]= random(diam, height-diam);
    
    velX[i] = random(2,4);
    velY[i] = random(3,5);
  }
}

void draw(){
  background(0);
  //updates the position of the shape
  for(int i=0; i<numCircle; i++){
    xpos[i] +=velX[i];
    ypos[i] +=velY[i];
    
    //set boundaries for the shapes
    if(xpos[i] < 0 || xpos[i] > width-diam){
      velX[i]*=-1;
    }
    if(ypos[i] < 0 || ypos[i] > height-diam){
      velY[i]*=-1;
    }
    
    //draw and random fill of the shapes
    r[i] = random(0,255);
    g[i]= random(0,255);
    b[i] = random(0,255);
    a[i] = random(0,255);
    
    fill (r[i], g[i], b[i], a[i]);
    ellipseMode(CORNER);
    ellipse(xpos[i], ypos[i], diam,diam);
  }
}
  

