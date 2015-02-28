
//Jessica Wendler Lab 5

//global variables
PImage img;

int particleCount = 800;
float[] x = new float[particleCount];
float[] y = new float[particleCount];
float[] speedX= new float[particleCount];
color[] strokeCol = new color[particleCount];
float[] speedY  = new float[particleCount];
float[] r = new float[particleCount];
float[] slow= new float[particleCount];
float[] gravity = new float[particleCount];
float[] damping = new float[particleCount];

void setup(){
  size(600,600);
  background(0);
 
  

  for (int i=0;i<particleCount; i++){
  speedX[i] = random(4,20);
  speedY[i] = random(2,4);
  r[i]= random(2,40);
  gravity[i]=random(.2,.9);
  damping[i]=random(.1,.9);
  slow[i]=random(.2,.6);
  strokeCol[i]=color(random(255),random(10,255),random(255),random(100));
  }
  
  
 
}


void draw(){
  
 img = loadImage("blooming_rain.jpg");
 img.resize(width,height);
  image(img,0,0);
  
  stroke(0);
  for (int i=0;i<particleCount; i++){
  stroke(strokeCol[i]);
  fill(strokeCol[i]);
  ellipse(random(width),y[i],r[i],r[i]);
  x[i]+=speedX[i];
  speedY[i]+=gravity[i];
  y[i]+=speedY[i];
  
 
  noStroke();
  fill(random(255),random(255),random(255),20);
  ellipse(random(width),0,random(10,80),random(10,80));
  x[i]+=speedX[i];
  speedY[i]+=gravity[i];
  y[i]+=speedY[i];
 
  //boundary
  if (x[i]>width-r[i]/2){
    x[i]=width-r[i]/2;
    speedX[i]*=-.8;
    speedX[i]*=damping[i];
  }
  if (y[i]>height-r[i]/2){
    y[i]=height-r[i]/2;
    speedY[i] *=-1;
    speedY[i]*=gravity[i];
  }
  if (x[i]<0){
    x[i]=0;
    speedX[i]*=-1;
    
  }
  if (y[i]<0){
    y[i]=0;
    speedY[i]*=-1;
   
    
  }
  
    
    
  }
}



