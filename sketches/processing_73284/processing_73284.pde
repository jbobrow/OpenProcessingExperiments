
int X;
int Button;
int Z;
int Button2;

void setup(){
  size (600,600);
  X=600;
  Button=0;
  Z=60;
  Button2=0;
  }
void draw(){
  background (0);
  for (int a=0; a<600;a=a+1){
    noStroke();
    fill(a);
    rect (0,a,600,1);
  }
  if (mouseX>100&&mouseX<150&&mouseY>100&&mouseY<150&&mousePressed == true&&Z>30){
   if (Button==1){
     Button=0;
   }
   else{
     Button=1;
   }
   Z=0;
  }
  
  if (Button==1){
    fill(255);
    ellipse (300,400,100,100);
  }
  Z++;
  fill(10);
  rect (100,100,50,50);
  fill(255);
  rect (400,500,50,50);
  
if (mouseX>400&&mouseX<500&&mouseY>450&&mousePressed == true&&Z>30){
  if (Button2==1){
    Button2=0;
  }
  else{
    Button2=1;
  }
  Z=0;
}
if (Button2==1){
  for (int a=20; a>0;a=a-1){
    fill(a*10);
    ellipse (50,50,a,a);
  }
}
  }

