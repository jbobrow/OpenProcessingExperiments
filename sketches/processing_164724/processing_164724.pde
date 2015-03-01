
float red1x, red1y, red2x,red2y;
float red_x,red_y;
float vel_x,vel_y;
boolean up=false;
boolean left=false;
float curDeg=0;
float radious=40;
float deg;
int level=1;

void setup()
{
  size(600,600);
  background(20,0,50); 
  stroke(255,0,0); 

  strokeCap(PROJECT);
  red_x=random(0,600);
  red_y=random(0,600);
   vel_x=1;

}
void mousePressed(){
  
  float tVecX=red2x-red1x;
  float tVecY=red2y-red1y;
  
  float tVecMag = sqrt(tVecX*tVecX+tVecY*tVecY);
  
  float uVecX = width;
  float uVecY = 0;
  
  float uVecMag = sqrt(uVecX*uVecX+uVecY*uVecY);
  
  float dot = tVecX*uVecX +tVecY*uVecY;
  
  float cosine = dot/(tVecMag*uVecMag);
  
 
  if(cosine>-0.3&&cosine<0.3)level+=1;
}

void draw(){
  deg=radians(curDeg);
  red1x=red_x-radious*cos(deg);
  red1y=red_y+radious*sin(deg);
  red2x=red_x+radious*cos(deg);
  red2y=red_y-radious*sin(deg);
  
  vel_y=3+red_y/60;
  
  if(red1y>=600||red2y>=600)up=true;
  else if(red_y<=-30) up=false;
  if(red1x>=600||red2x>=600)left=true;
  else if(red1x<=0||red2x<=0) left=false;
  
  if(up==false){
  red_y+=vel_y;
    if(left==false){
    red_x+=vel_x;
    curDeg-=vel_y-3;
    }else if(left==true){
     red_x-=vel_x;
    curDeg+=vel_y-3;
    }
  }else if(up==true){
  red_y-=vel_y;
      if(left==false){
      red_x+=vel_x;
      curDeg-=vel_y-3;
      }else if(left==true){
      red_x-=vel_x;
      curDeg+=vel_y-3;
  }
  }
  stroke(255);
  line(0,height/2,width,height/2);
  strokeWeight(level);
  stroke(200,red_y/3,red_y/4); 
  fill(200,red_y/3,red_y/3); 
  line(red1x,red1y,red2x,red2y);
  
  for(int i=0;i>level;i++);{
  ellipse(width/2,height/2,30*level,30*level);
  }
  if(level==11){
   level=1;
  background(20,0,50); 
  }
}
