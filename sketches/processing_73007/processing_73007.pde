
int botCount = 300;
 Bot[] b = new Bot[botCount];

 void setup(){
 size(600,600);
 background(0);
 frameRate(500000);
 // noStroke();
 smooth();
 colorMode(RGB, width);
 for(int i=0;i<b.length;i++){
 b[i] = new Bot(random(width),random(height), random(10)+5,random(360));
 }
 }
 int a=0;
 int x=0;

 void draw(){

 fill(122,175,255);

 
for(int i=0;i<b.length;i++){
 b[i].update();
 b[i].render();
 }
 }

 class Bot{
 float x;
 float y;
 float d;
 float a;
 
public Bot(float newX, float newY, float newD, float newA){
 x= newX;
 y= newY;
 d= newD;
 a= newA;
 }
 void update(){
 float xInc = cos(radians(a));
 float yInc = sin(radians(a+=2));
 
x+=xInc;
 y+=yInc;
 } 
void render(){
 ellipse (x, y, d, d);
 
} 
}

