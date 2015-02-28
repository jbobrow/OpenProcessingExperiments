
void setup() {
size(1240,877);
  background(0);
  noLoop();
}
void draw() {
stroke(255);
strokeWeight(2);
 for(int a=10; a<=1230; a=a+10) {
    for(int b=10; b<=867; b=b+10) {
      point(a,b);

    }
  }

  
  
    




stroke(255,50,15);
strokeWeight(1);

  for(int a=0; a<360; a=a+3){
  float x=400+sin(radians(a))*130;
  float y=400+cos(radians(a))*130;
  line(620,438,x,y);
 }


for(int a=0; a<360; a=a+3) {
   float x=500+sin(radians(a))*130;
  float y=640+cos(radians(a))*130;
  line(620,438,x,y);
}

for(int a=0; a<360; a=a+3) {
   float x=760+sin(radians(a))*130;
  float y=610+cos(radians(a))*130;
  line(620,438,x,y);
}

for(int a=0; a<360; a=a+3) {
   float x=800+sin(radians(a))*130;
  float y=350+cos(radians(a))*130;
  line(620,438,x,y);
}

for(int a=0; a<360; a=a+3) {
   float x=580+sin(radians(a))*130;
  float y=210+cos(radians(a))*130;
  line(620,438,x,y);
}


stroke(255,255,0);
for(int a=0; a<360; a=a+5){
  float x=200+sin(radians(a))*50;
  float y=280+cos(radians(a))*50;
  line(200,200,x,y);
}
for(int a=0; a<360; a=a+5){
  float x=125+sin(radians(a))*50;
  float y=235+cos(radians(a))*50;
  line(200,200,x,y);
}
for(int a=0; a<360; a=a+5){
  float x=140+sin(radians(a))*50;
  float y=150+cos(radians(a))*50;
  line(200,200,x,y);
}
for(int a=0; a<360; a=a+5){
  float x=235+sin(radians(a))*50;
  float y=140+cos(radians(a))*50;
  line(200,200,x,y);
}
for(int a=0; a<360; a=a+5){
  float x=265+sin(radians(a))*50;
  float y=220+cos(radians(a))*50;
  line(200,200,x,y);
}

noStroke();
fill(255,185,0);
ellipse(620,438,50,50);
fill(255,100,0);
ellipse(195,200,35,35);

saveFrame("hyang.png");
 }
 



