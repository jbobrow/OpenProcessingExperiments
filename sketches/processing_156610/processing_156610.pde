
float x;
float y;

float dx;
float dy;

float px;
float py;

float d=dist(x,y, px, py);
float c=map(d,0,100,0,220);

  
float weight=map(d,0,100,1,10);

float R;
float G;
float B;

void setup(){
  size(600,600);
  background(0);
  x=width/2;
  y=height/2;
  px=x;
  py=y;
 
}


void draw(){
  R=map(x,0, width, 0, 255);
  G=map(y,0, height, 0, 255);
  B=map(frameCount,0,300,0,255) %255;
  for(int i=0; i<10;i+=2){
  randomWalker(-50,50,-50,50);
  }
  if(x>330 | y<270){
  randomWalker(-30,30,-30,30);
  }
  if(x>450 | y<150){
  randomWalker(-10,10,-10,10);
  }
  wave(x,y*0.001);
  
    if (keyPressed) {
    if (key == 's') {
      saveFrame("screen-#####.jpg");
    }
    }
}

void randomWalker( float dxMin, float dxMax, float dyMin, float dyMax){

//translate(width/2 + (x-dx)*0.001,height/2+ (y+dy)*0.001);
point(x,y);

dx=random(dyMin, dyMax)*sin(frameCount*0.01);
dy=random(dyMin, dyMax);

if (x<0){
  x=width;
  px=width;
}
else if(x>width){
  x=0;
  px=0;
}
if(y<0){
  y=height;
  py=height;
}
else if (y>height){
  y=0;
  py=0;
}

x+=dx;
y+=dy;


strokeWeight(weight);
stroke(G,R,B,255-c);


line(x, y, px, py);
noStroke();
fill(R,G,B,255-c);
ellipse(x, y, random(weight*20), sin(dy)*weight*20);



px=x;
py=y;
}

void wave(float amp,float freq){
  for (int i=0; i < width; i +=5){
    float sine = sin((frameCount+i)+freq);
    fill(c,160);
    ellipse(x, y+(sine*amp), 15, 15);
  }
}




