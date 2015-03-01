
//Red Spider Drop



float x=255;
float y=255;
float chngx=1;
float chngy=1;
int r=0;
int g=0;
int b=0;
int thick=3;
float degchng=9;

void setup() {
  size(510,520);
  smooth();
  strokeJoin(ROUND);
}

void draw() {
  background(0);
  thick=2;
  float chngx=1;
  
  //int r=225;
  //int g=128;
  //int b=225;
  
  if(mousePressed==true) {
    degchng+=0.2;
    if(degchng>36) {
      degchng=36;
    }
  } else {
    degchng-=0.2;
    if(degchng<9) {
      degchng=9;
    }
  }
  
  for(int p=510; p>255; p-=chngx) {
  
  for(int deg=0; deg<360; deg+=degchng) {
  float angle=radians(deg);
  float x=random(0.5,2)+255+(cos(angle)*(p-255));
  float y=random(0.5,2)+255+(tan(angle)*(p-255));  
    //strokeWeight(thick);
  stroke(255,0,mouseY/2);
  fill(r,mouseX/4,100);
  ellipse(x,y,thick*4,thick*2);
  }
  
  chngx+=5;
  r=random(210,250);
  thick++;
  
  }
  
  
}
