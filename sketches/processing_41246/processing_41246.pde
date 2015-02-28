
int radius = 60;

void setup(){
size(900,450);
background(255);
strokeWeight(1);
stroke(255);
//fill(random(255),random(255),random(255),50);
smooth();
}

void draw(){
drawX(int(random(width)),int(random(height)),int(random(255)),int(random(255)),int(random(255)));
}

void drawX(int W,int H,int c1,int c2,int c3){
for(int deg =0;deg<100;deg+=10){
  float angle =radians(deg);
  arc(W,H,radius*2,radius*2,PI,PI+HALF_PI);
  float x =W-(cos(angle)*radius);
  float y =H-(sin(angle)*radius);
  fill(c1,c2,c3,30);
  line(W,H,x,y);
}
}

                
                
