
/*Original Code created by Tomomi Ogura found at http://www.openprocessing.org/sketch/27222*/
/* Code adapted by Anne Marie Hood YSDN Interactivity 2, Exercise 3b*/
/*Lost*/
PImage img0;
float a = 0;
float b = 0;
final int N = 100;
final int SKIP = 5;
 
float[] x = new float[N];
float[] y = new float[N];
float[] rad = new float[N];
 
int count = 0;
 
void setup(){
  size(430,280);
  
   
  smooth();
  img0= loadImage ("map.JPG");

   
  for(int i=0; i<N; i++){
    x[i] = random(width);
    y[i] = random(height);
    rad[i] = PI/4*int(random(100));
  }
   
  imageMode(CENTER);
  noStroke();
   
  /*for(int i=0; i<100; i++){
    draw();
  }*/
}
 
void draw(){
  if(frameCount%SKIP==0){
    count += 1;
  }else{
    return;
  }
   
  
  
  for(int i=0; i<N; i++){
    x[i] += 10*cos(rad[i]);
    y[i] += 10*sin(rad[i]);
     
    fill(255,255,100);
     
    if(x[i]>width) x[i]=0;
    if(y[i]>height) y[i]=0;
    if(x[i]<0) x[i]=width;
    if(y[i]<0) y[i]=height;
     
    rect(x[i],y[i],5,5);
     
    if(count%10==0){
      rad[i] += PI/4*int(random(9));
    }
  }
  tint (255,50);
  image (img0,pmouseX,pmouseY);
}



