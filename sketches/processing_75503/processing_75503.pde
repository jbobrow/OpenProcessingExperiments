
float x,y,x2,y2,angle,glowLight,rad;

void setup(){
  size(600,600);
  background(132,100,100);
  x=0;
  y=0;
  x2=0;
  y2=0;
  angle=0;
  //rad=0;
  smooth();
}

void draw(){
  
    
  x= 400*cos(radians(angle*5))*sin(radians(angle*5))*sin(radians(angle*5));
  y= 400*sin(radians(angle*5))*cos(radians(angle*5))*cos(radians(angle*5));
  ellipse(x+width/2,y+height/2,300,200);
  ellipse(x+width/2,y+height/2,200,100);
  ellipse(x+width/2,y+height/2,150,50);
  
  x2=400*tan(radians(angle*3));
  y2=400*tan(radians(angle*3));
  rect(x2+width/2,y2+height/2,600,600);
  
  glowLight=abs(255*cos(radians(angle))*sin(radians(angle*2)));
  fill(glowLight,100,100,10);
  
  
  angle+=.1;

}

