
int x = 0; 
void setup(){size(400,800);}

void wop(){
  fill(255);
  for (int i = 5; i < 800; i = i + 20) {
    if(i<800)
    {
      float q = random(500);
      float w = random(900);
      background(255,22,173,100);
      line(x,y,q,w);
      line(2*x,2*y,q,w);
    }}}
    
    void bop() {size(400,800);
    fill(255,255,255,150);
    for (int i = 5; i<200; i = i +10){
      if (i<200)
      {
        float e= random(400);
        float r = random(800);
        stroke(255,255,255,100);
        strokeWeight(1);
        line(200,0,e,r);
        line(200,800,e,r);
      }}}
    
   int y=0;
int speed=10;
void draw(){
 wop();
 bop();
frameRate(30);
fill(255,255,255,100);
strokeWeight(1);
ellipse(200,400,200,y);
  y=y+speed;
  if((y<10)||(y>=800)){
  speed=speed*-1;
  }
}
