
float px,py,px2,py2,px3,py3;
float angle;
float radius;
float frequency=1;
float a,b;
int i;

void setup(){
  size(720,480);
  background(20,180,190);
}
void draw(){
    background(20,170,200);
  a=mouseX;
  b=mouseY;
  radius=sqrt(sq(360-a)+sq(240-b));
  
  fill(255,127);
   noStroke();
   for (int i = 0; i< 720; i+=1){
    //px =cos(radians(angle))*(radius);
    py =80+sin(radians(angle))*(radius)/8;
    //px2 =cos(radians(angle))*(radius);
    py2 =160+sin(radians(angle))*(radius)/4;
    //px3 =cos(radians(angle))*(radius);
    py3 =320+sin(radians(angle))*(radius)/2;
    rect(i,py, 4,4);
    rect(i,py2,8,8);
    rect(i,py3,16,16);
    
    angle-=1;
  }
}



