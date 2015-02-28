
     int radius = 50;

void setup(){
size(900,450);
background(255);
strokeWeight(1);
stroke(255);
fill(230,230,255,100);
smooth();
}

void draw(){
drawX(int(random(width)),int(random(height)));
}

void drawX(int W,int H){
for(int deg =0;deg<100;deg+=10){
  float angle =radians(deg);
  arc(W,H,radius*2,radius*2,PI,PI+HALF_PI);
  float x =W-(cos(angle)*radius);
  float y =H-(sin(angle)*radius);
  line(W,H,x,y);
}
}   
