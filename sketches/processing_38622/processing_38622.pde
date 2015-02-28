
void setup(){
  size(500,500);
  background(0,0,0);
  noStroke();
  smooth();
}

float r=PI/9;
float r2=PI/9;
float rloop=1;
void draw(){
for(int x=70;x<=width-60;x=x+35){

  for(int y=70;y<=height-60;y=y+35){
    fill(15,15,15);
    ellipse(x,y,30,30);
    fill(255,255,255);
    arc(x,y,30,30,PI+r,2*PI+r);
    r=r+PI/5;
      
  }
}
}


