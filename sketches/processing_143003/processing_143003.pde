
Ball[] rock = new Ball[200];
int i=0;
 
 
void setup(){
//  background(20);
  size(600,300);
  rock[0] = new Ball(20, 100, 2, 1, #8D1700, 100);
}

void draw(){
  background(20);
  if(rock[0].counter()>i){
    i++;
    rock[i] = new Ball(rock[0].xPos(), rock[0].yPos(), random(3), random(3), color(random(200)+55,random(200)+55,random(200)+55), 100);
  }
  for(int j=0;j<=i && j<200;j++){
    rock[j].display();
  }
}

class Ball{
  float x, y;
  float size;
  color c;
  float xVol, yVol;
  int counter = 0;
  Ball(float iniX, float iniY, float inixVol, float iniyVol, color iniC, float iniSize){
    x=iniX;
    y=iniY;
    xVol=inixVol;
    yVol=iniyVol;
    c=iniC;
    size=iniSize;
  }
  void display(){
    fill(c);
    ellipse(x,y,size,size);
    if(x<0 || x>600){
      xVol=-xVol;
      size=size-5;
      counter++;
     }
    if(y<0 || y>300){
      yVol=-yVol;
      size=size-5;
      counter++;
    }
    x=x+xVol;
    y=y+yVol;
  }
  int counter(){
    return counter;
  }
  float xPos(){
    return x;
  }
  float yPos(){
    return y;
  }
}
