
//Jessica Wendler Lab 4

//global variables

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
  speedX[i] = random(4,10);
  speedY[i] = random(2,4);
  r[i]= 15;
  gravity[i]=random(.1,.7);
  damping[i]=random(.1,.6);
  slow[i]=random(.2,.6);
  }
  
  
 
}

void stairs(){
  fill(150,150,150);
  noStroke();
  int xStair;
  int yStair;
  for(int i=1;i<6;i+=1){
  rect(0,i*100,100*i,100);
  }
  
}


void draw(){
  
  stroke(0);
  background(255);
 
  noStroke();
  fill(255,125,30);
  ellipse(600,0,600,600);
   fill(255,255,0);
   ellipse(600,0,500,500);
  fill(250,200,0);
  ellipse(600,0,400,400);
  
 fill(100,0,100,40);
  for(int i=1;i<6;i++){
    ellipse(100*i,100*i,random(200,300),random(200,500));
  }
  stroke(0);
  for (int i=0;i<particleCount; i++){
  fill(random(255),random(100,255),random(255),random(100));
  ellipse(x[i],y[i],r[i],r[i]);
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
  //y speed vlaues changing for tops of stairs
    if (y[i]>100-r[i]/2 && x[i]<100){
      y[i]=100-r[i]/2;
    speedY[i]*=-1;
    speedY[i]*=gravity[i];
    speedX[i]*=damping[i];
 
    }
    if (y[i]>200-r[i]/2 && x[i]<200){
      y[i]=200-r[i]/2;
    speedY[i]*=-1;
    speedY[i]*=gravity[i];
    speedX[i]*=damping[i];
    }
    if (y[i]>300-r[i]/2 && x[i]<300){
      y[i]=300-r[i]/2;
    speedY[i]*=-1;
    speedY[i]*=gravity[i];
    speedX[i]*=damping[i];
    }
    if (y[i]>400-r[i]/2 && x[i]<400){
      y[i]=400-r[i]/2;
    speedY[i]*=-1;
    speedY[i]*=gravity[i];
    speedX[i]*=damping[i];
    }
    if (y[i]>500-r[i]/2&& x[i]<500){
      y[i]=500-r[i]/2;
    speedY[i]*=-.2;
    speedY[i]*=gravity[i];
    speedX[i]*=damping[i];
  }
   
     //x speed vlaues changing for tops of stairs right side
    if (x[i]<100+r[i]/2 && y[i]>100){
        x[i]=100+r[i]/2;
      speedX[i]*=-1;
      speedX[i]*=damping[i];
    speedY[i]*=gravity[i];
    
    }
    if (x[i]<200+r[i]/2 && y[i]>200){
      x[i]=200+r[i];
    speedX[i]*=-1;
    speedX[i]*=damping[i];
    speedY[i]*=gravity[i];
    }
    if (x[i]<300+r[i]/2 && y[i]>300){
      x[i]=300+r[i]/2;
    speedX[i]*=-1;
    speedX[i]*=damping[i];
    speedY[i]*=gravity[i];
    }
    if (x[i]<400+r[i]/2 && y[i]>400){
      x[i]=400+r[i]/2;
    speedX[i]*=-.4;
    speedX[i]*=damping[i];
    speedY[i]*=gravity[i];
    }
    if (x[i]<500+r[i]/2 && y[i]>500){
      x[i]=500+r[i]/2;
    speedX[i]*=-.2;
    speedX[i]*=damping[i];
    speedY[i]*=gravity[i];
  }
  

}
  stairs();
}
  
  

