
float[] circleX={30,90,150,210,270,330};
float[] circleY={0,0,0,0,0,0};
float y=0;
boolean ball= false;

void setup(){
  size(500,500);
  smooth();
  noStroke();
}
void draw(){
  background(0);
  for (int i = 0; i< 6;i++){
  fill(255,i*50,255);
  ellipse(circleX[i],circleY[i],30,30);
  if( circleY[i]>=0 && ball==false){
    circleY[i]+=4;}
    if( circleY[i]>=490){
      ball=true;}
    if(circleY[i]<=500 && ball==true){
    circleY[i]-=2;}
    if(circleY[i]<=10){
      ball=false;}

  
}}

