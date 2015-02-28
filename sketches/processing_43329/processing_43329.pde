

//MIKE's work.

int a=0;  
int b=0;
int c=0;
int d=0;
int dd=0;
int x=0;
int y=0;
int z=0;
int xx=0;

void setup() {
  size(1280, 720);
  background(255);
  frameRate(100);
  smooth();
  loop();
  
  

  frameRate(125);
}
int pos = 0;
 



void draw() {
  fill(0,10);
  noStroke();
  rect(0,0,width,height);
  stroke(255,100,100);

  fill(200, 200, 200,10); //semitransparent overlay
  rect(0, 0, width, height);
  fill(150,50,50); 
  stroke(255,0,0);

  a+=10;
  if (a>=360) { 
    a=0;
    y+=random(-5, 5);
  };

  b+=4;
  if (b>=360) { 
    b=0;
    z+=random(-6, 6);
  };

  d-=7;
  if (d>=360) { 
    d=0;
    xx+=random(-7, 7);
  };

  dd-=3;
  if (dd>=360) { 
    dd=0;
    x+=random(-3, 3);
  };

  c+=6;
  if (c>=360) { 
    c=0;
    x+=random(-1, 1);
  };
  c+=1;
  if (c>=360) { 
    c=0;
    x+=random(-0, 30);
  };
  float angleA=radians(a);
  orbiter(angleA, 30, mouseX+y, mouseY+y);
  float angleB=radians(b);
  orbiter(angleB, 150, mouseX+z, mouseY+z);
  float angleD=radians(d);
  orbiter(angleD, 50, mouseX+z, mouseY+z);
  float angleDD=radians(dd);
  orbiter(angleDD, 90, mouseX+x, mouseY+x);
  float angleC=radians(c); //convert to use in trig functions
  orbiter(angleC, 70, mouseX+x, mouseY+x);
}

void orbiter(float ang, float r, int cx, int cy) {

  float sinOfAngle=sin(ang);
  float Y = r*sinOfAngle;
  //now x side
  float cosOfAngle=cos(ang);
  float X = r*cosOfAngle;
  ellipse(X+cx, Y+cy, 27, 27);
  
  
    for(int x=1; x<width; x+=1200)
    for(int y=0; y<height; y+=1200){
  
      fill(1000,2000,dist(x,y,mouseX,mouseY)%255);
      point(X,y);
    }
  
  
}
  

