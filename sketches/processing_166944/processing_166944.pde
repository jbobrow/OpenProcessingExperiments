
float[] x= new float[10];
float[] y= new float[10];


float[] graphNums ={
  17, 22, 3, 0, 26, 15, 12, 14, 11, 17
};

void setup(){
 size(400,400); 
 smooth();
 for(int i=0; i<graphNums,length;1++){
   x[i]=width/(graphNums,length)+1;
   
 }
}

void draw(){
  background(100);
  stroke(255,255,0,100);
  strokeWeight(5);
  for(int i=0; i<y,length-1,1++){
    line(x[i], y[i], x[i+1],y[i+1]);
}
