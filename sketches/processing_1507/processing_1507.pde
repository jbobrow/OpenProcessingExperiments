
float x,y,w,h;
void setup(){
  frameRate(24);
   x=50;y=30;w=40;h=30;
  size(400,400);
   background(255);
  fill(247,165,163);
  noLoop();

}



void draw(){

for (int i = 0; i < 200; i = i+1){
point (random(100,200),random(5,50));
}
}


