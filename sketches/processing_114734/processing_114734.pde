
//Defines the variables for the human
float  hoved_x = 330;
float  hoved_y = 370;
float  ben_x = 330;
float  ben_y = 420;
float  ben_x_2 = 360;
float  ben_y_2 = 460;
float  ben_2x = 330;
float  ben_2y = 420;
float ben_2_x = 300;
float  ben_2_y = 460;
float  arm_x = 330;
float  arm_y = 420;
float  krop_x = 340;
float  krop_y = 400;
float  krop_2x = 320;
float krop_2y = 400;
float hvid = 255;
float inc = 0.25;
  void setup(){
  size (640,640);
  frameRate(60);
}
  
  void draw(){
  background(210,234,255);  
  fill(hvid,hvid,hvid);
    ellipse(hoved_x,hoved_y,25,25);
  noFill();

  line(ben_x,ben_y,ben_x_2,ben_y_2);
  line(ben_2x,ben_2y,ben_2_x,ben_2_y);
  line(hoved_x,hoved_y+12.5,arm_x,arm_y);
  line(hoved_x,hoved_y+12.5,krop_x,krop_y);
  line(hoved_x,hoved_y+12.5,krop_2x,krop_2y);

//Static movement
hoved_x = hoved_x + inc;
arm_x = arm_x + inc;
ben_x = ben_x + inc;
ben_2x = ben_2x + inc;
ben_x_2 = ben_x_2+inc;
ben_2_x = ben_2_x+inc;
krop_x = krop_x+inc;
krop_2x = krop_2x+inc;


//Dynamic movement (legs)
if(ben_2_x < hoved_x){
ben_2_x++;
ben_x_2--;
}
else if(ben_2_x < krop_x){
ben_2_x++;
ben_x_2--;
}
else if(ben_2_x > krop_2x){
ben_2_x--;
ben_x_2++;
}
else if(ben_x_2 > krop_2x){
ben_2_x--;
ben_x_2++;
}
else if(ben_x_2 < krop_x){
ben_2_x++;
ben_x_2--;
}
else{
ben_2_x++;
ben_x_2--;
}
}
//Troubleshooting
void func(){
  println (inc);
}
