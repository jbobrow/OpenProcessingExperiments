
//Hannah Faye

int X;
int Button;
int Y;
int Button2;
 
void setup(){
  size (800,800);
  X=800;
  Button=0;
  Y=100;
  Button2=0;
  }
void draw(){
  background (0);
  for (int a=0; a<800;a=a+1){
    noStroke();
    fill(a,0,193,250);
    rect (0,a,800,800);
  }
  if (mouseX>800&&mouseX;<500&&mouseY;>400&&mouseY;<150&&mousePressed; == true&&Z>30){
   if (Button==1){
     Button=0;
   }
   else{
     Button=1;
   }
   Y=0;
  }
   
  if (Button==1){
    fill(255,230,0);
    rect (300,400,100,100);
  }
  Y++;
  fill(0,250,102);
  rect (100,100,100,500);
  fill(0,250,102);
  rect (400,500,100,500);
   
if (mouseX>400&&mouseX;<500&&mouseY;>450&&mousePressed; == true&&Y>30){
  if (Button2==1){
    Button2=0;
  }
  else{
    Button2=1;
  }
  Y=0;
}
if (Button2==1){
  for (int a=100; a>0;a=a-1){
    fill(a*100);
    rect (100,10,a,a);
    rect (150,10,a,a);
    rect (50,10,a,a);
  }
}
  }
