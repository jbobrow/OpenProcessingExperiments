
int eco = 50;
float[] x = new float[eco];
float[] y = new float[eco];
float[] ex = new float[eco];


void setup(){
  size(400,400);
  rectMode(CENTER);
  for(int i = 0;i<eco;i++){
  x[i]=0.0; 
  y[i]=0.0;
  ex[i]=0; 
 }
  smooth();
}
void draw(){
  
  fill(0,10);
  rect(200,200,420,420);
  stroke(255);
  strokeWeight(mouseX/20);
  fill(0);
  for(int i = 0;i<eco;i=i+3){
    ex[i] = ex[i] +5;
 if(mousePressed){
   ex[i] = ex[i] +20;
 }
 rect(x[i]+200,y[i]+200,ex[i],ex[i]); 
if( ex[i]> 400){
 ex[i] = 0; 
  
}
 
  }
}

