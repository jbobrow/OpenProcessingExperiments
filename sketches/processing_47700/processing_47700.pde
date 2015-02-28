
int radius;
float counter=0;

float x,y,angle;
void setup(){
  size(500,500);
  angle=0;
  radius = 200;
  smooth();
}

void draw(){
   x=cos(radians(angle))*angle/20 + width/2;
  y=sin(radians(angle))*angle/20 + height/2;
  ellipse(x,y,20,20);
  x=cos(radians(angle))/angle/20 + width/2;
  y=sin(radians(angle))*angle/20 + height/2;
  //x = angle++;
  //angle = radius++;
  ellipse(x,y,70,70);
  angle+=9;
  fill(255,0,0);
  //ellipse(width/2,height/2,380,380);
  translate(width/2,height/2);
    for(int i=0; i < 50; i+=1){
    line(sin(counter)*500,sin(counter)*500,20,500);
  rotate(radians(160));
}
counter+=.1;
}

