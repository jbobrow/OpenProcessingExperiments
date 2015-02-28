
int a=50;
int numCheck = 50;

Check [] check = new Check[numCheck];

void setup(){
  size(500,500);
  background(0); 
  for (int i=0; i<check.length; i++){
    check[i]= new Check();
  }
}

void draw(){
frameRate(a);
rect(0,0,500,500);
fill(0,10);
float interp=sin(frameCount/60.);

for(int i=0; i<check.length; i++){
  check[i].display(interp);
}
}

class Check{
  float xpos, ypos;
  float xoffset, yoffset;
  PImage che;
  
  Check(){
    che=loadImage("check.png");
    xpos =random(width);
    ypos =random(height);
    xoffset =random(width);
    yoffset =random(height);
  }
 

 
    
  void display(float interp) //interp is some number between -1.0 and 1.0
  {
    float xtemp,ytemp;
    
    xtemp=xpos+interp*xoffset;
    if(xtemp>width) xtemp=width-(xtemp-width);
    if(xtemp<0) xtemp=xtemp*-0.1;
    
    ytemp=ypos+interp*yoffset;
    if(ytemp>height) ytemp=height-(ytemp-height);
    if(ytemp<0) ytemp=ytemp*-0.1;
    
    image(che,xtemp,ytemp);
  }
    
}


  

