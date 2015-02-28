



int num=30;
int stars=100;
float gravity =0.1;

float[] x = new float[num];

float[] y = new float[num];

float[] vel1= new float[num];

float[] vel2= new float[num];

float[] starsize = new float[stars];
float[] starx = new float[stars];
float[] stary = new float[stars];






void setup(){
   size(500, 500);
   noFill();
   stroke(0);
   smooth();
  
   
   
   for(int i=0; i<num; i++){
     x[i]=random(width);
     y[i]=random(height);
     vel1[i]=random(5);
     vel2[i]=random(5);
   }
   
   for(int i=0; i<stars; i++){
     starsize[i] =random(10);
     starx[i]=random(width);
     stary[i]=random(height);
   }
   
}
void draw(){
  background(0);
  
  for (int i=0; i<stars; i++){
    fill(255);
    ellipse(starx[i],stary[i] , starsize[i],starsize[i]);
  }
  
  
  for (int i=1; i<num; i++){
    
   
    vel2[i]=vel2[i]+gravity;
    
    x[i]=x[i]+vel1[i];
    y[i]=y[i]+vel2[i];
    
    
    PImage cats;
cats = loadImage("spacecat.png");
    image(cats,x[i], y[i]);
    
  
  
  
  if((x[i]<0)||(x[i]>width)){
    vel1[i]=vel1[i]*-1;
  }
  
  if((y[i]<0)||(y[i]>height)){
    vel2[i]=vel2[i]*-.95;
  }
  
}
}


  






