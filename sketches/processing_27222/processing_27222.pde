
final int N = 100;
final int SKIP = 5;

float[] x = new float[N];
float[] y = new float[N];
float[] rad = new float[N];

int count = 0;

void setup(){
  size(800,600);
  background(0);
  
  smooth();
  
  colorMode(HSB,255);
  
  for(int i=0; i<N; i++){
    x[i] = random(width);
    y[i] = random(height);
    rad[i] = PI/4*int(random(9));
  }
  
  ellipseMode(CENTER);
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
  
  fill(0,0,0,30);
  rect(0,0,width,height);
  
  for(int i=0; i<N; i++){
    x[i] += 10*cos(rad[i]);
    y[i] += 10*sin(rad[i]);
    
    fill(int(rad[i]%TWO_PI/TWO_PI*255),100,255,200);
    
    if(x[i]>width) x[i]=0;
    if(y[i]>height) y[i]=0;
    if(x[i]<0) x[i]=width;
    if(y[i]<0) y[i]=height;
    
    ellipse(x[i],y[i],5,5);
    
    if(count%10==0){
      rad[i] += PI/4*int(random(9));
    }
  }
}

