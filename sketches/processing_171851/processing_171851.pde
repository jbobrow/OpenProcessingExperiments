
ball[] circleArray=new ball[400];
void setup(){
for(int i=0;i<circleArray.length; i++){
circleArray[i]=new ball(50,50);
}
size(500,500);
background(0,0,255);
}

void draw(){
for(int i=0;i<circleArray.length; i++){
circleArray[i].update();

}
}
class ball {
int vx=random(-5, 5);
int vy=random(-5, 5);


int x=0;
int y=0;
ball(int xP, int yP){
x=xP;
y=yP;
}
void update(){
fill(random(255),random(255),random(255));
ellipse(x,y,50,50);
x = x + vx;
y = y + vy;

}
}
