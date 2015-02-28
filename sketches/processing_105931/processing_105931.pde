
MonsterPerry[] zxy = new MonsterPerry[4];
MonsterPerry2[] zxy1 = new MonsterPerry2[4];
int i;
int j;
void setup(){
  size(400,400);
   for(int i =0; i<zxy.length;i++){
     zxy[i]=new MonsterPerry();
     zxy[i].prime(i*width/zxy.length,height/4,2);
   }
   for(int i =0; i<zxy1.length;i++){
     zxy1[i]=new MonsterPerry2();
     zxy1[i].prime(i*width/zxy1.length,height/4,2);
   }
}
   
 void draw(){
   background(255,225,0);
    for(int i=20; i<width; i+=20)
  {
    for(int j=20;j<height; j+=20) {

   fill(0,0,random(225));  
if (mousePressed){
fill(0,random(225),0);}
ellipse(i,j,20,20);}
  }
   for (int i=0;i<zxy.length;i++){
     zxy[i].animate();
   }
   for(int i=0; i< zxy.length;i++){
     zxy[i].move();
   }
   for (int i=0;i<zxy1.length;i++){
     zxy1[i].animate();
   }
   for(int i=0; i< zxy1.length;i++){
     zxy1[i].move();
   }
 }
class MonsterPerry{

float x;
float y;
float speed;
void prime(float a,float b,float c){
  x=a;
  y=b;
  speed=c;
  int i;
  int j;
}




void animate(){
 
 //body star 
 textSize(90);
text("★", x-40,y+30);
  fill(255,225,0);
  //head
  ellipse(x,y,30,30);
  fill(random(225),random(225),0);
  //eyes
  ellipse(x+10,y-2,12,12);
  ellipse(x-10,y-2,12,12);
  }
  void move(){
    if(mousePressed){
      x+=speed;
    if(x>=490){x=-90;}}
  }
  
}
class MonsterPerry2{

float x1;
float y1;
float speed1;
void prime(float a,float b,float c){
  x1=a;
  y1=b+140;
  speed1=c;
}




void animate(){
 //body star 
 textSize(90);
text("★", x1-40,y1+30);
  fill(255,225,0);
  //head
  ellipse(x1,y1,30,30);
  fill(random(225),random(225),0);
  //eyes
  ellipse(x1+10,y1-2,12,12);
  ellipse(x1-10,y1-2,12,12);
  }
  void move(){
    if(mousePressed){
      x1+=-speed1;
    if(x1<=0){x1=490;}}
  }
}

 


