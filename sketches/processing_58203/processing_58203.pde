
float aa =-THIRD_PI;
float ab =THIRD_PI;

void setup(){
 size(500,500);
 frameRate(3);
 background(0);
//form(height/2,width/2,HALF_PI,8);
//form(width/2,height/2,HALF_PI+2*THIRD_PI,8);
//form(width/2,height/2,HALF_PI-2*THIRD_PI,8);
noFill();
smooth();

}

void draw(){
  background(0);
 form(width/2,height,-HALF_PI,9); 
}

  int strokecontrol = 0;
void form(float x,float y,float a,int c){

  stroke(strokecontrol);
float nx=x+2*(3+pow(c,2))*cos(a);
float ny=y+2*(3+pow(c,2))*sin(a);
strokecontrol += 5;
if(strokecontrol>255){
  strokecontrol=0;}
line(x,y,nx,ny);
if(c>0){
form(nx,ny,a+aa,c-1);
form(nx,ny,a,c-1);
form(nx,ny,a+ab,c-1);
}
}
void mousePressed(){
  background(0);
 form(width/2,height,-HALF_PI,8); 
}


