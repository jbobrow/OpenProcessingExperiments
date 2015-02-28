
int y=20;
int x=5;
int speed=3;
//characteristics
void setup(){
size(400,400);
smooth();
fill(67,205,128,150);
stroke(255,62,150);
strokeWeight(3);
}


//planet
void draw(){
  background(0);
  for(int i = 10; i <= 400; i += 10) { 
  //for(int j = 10; j <= 200; j += 10) {
    float r=random(400);
    float d=random(400);
    stroke(255,255,0);
    frameRate(5);
    point(r,d);
  //} 
 }

frameRate(30);
y=y+speed;
stroke(255,62,150);
ellipse(x+25,y+1,80,20);
ellipse(x+25,y+2.5,50,50);
x=x+speed;
y=y;
if ((x<0)||(x>=300)){
speed=speed*-1;
}
}



