
float r;
float g;
float b;
float a=200;
float x=100;
float y=100;
float diam;

void setup(){
  size(200,200);
  background (225);
  smooth();
}

void draw(){
  noStroke();
  fill(r,g,b,a);
  ellipse(mouseX,mouseY,diam,diam);
  diam=int (random (0,50));
  if ((mouseY>0)&&(mouseY<60)){
    r=255;
    g=int(random(0,255));
    b=int(random(0,255));
  }
  else{
    if ((mouseY>=60)&&(mouseY<120)){
      r=int(random(0,255));
      g=255;
      b=int(random(0,255));
    }else{ 
      if((mouseY>=120)&&(mouseY<=200)){
        r=int(random(0,255));
        g=int(random(0,255));
        b=255;
      }
    }
  }
  
}


