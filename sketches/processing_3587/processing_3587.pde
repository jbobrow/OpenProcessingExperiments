
int px = 5;
int c, r;
float e, f, g, s, t;
void setup(){
  size(300, 300);
  frameRate(30);
  c = width/px;
  r = height/px;
}
void draw(){
  t = hour()+minute()+second();
  for(int i=0; i<c;i++){
  for(int j=0;j<r;j++){
     int x=i*px;
     int y=j*px;
     e = x-y+t;
     f = x-y+t;
     g = x-y+t;
     fill(e, f, g,100);
     rect(x,y,px,px);
     noStroke();
  }
 }
}


