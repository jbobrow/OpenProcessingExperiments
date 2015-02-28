
//clock
clockHand clock1;
clockHand clock2;

void setup(){
  size(600,600);
  smooth();
  background(#FFFFFF);
  clock1 = new clockHand(width/3,height/3, 100,1,#FF0303);
  clock2 = new clockHand(width*2/3,height*2/3, 100,2,#0358FF);
 frameRate(8);
}

void draw(){
  background(#FFFFFF);
  text("click inside each clock to start and stop hands",width/2,50);
clock1.display();
clock1.tick();
clock1.dclick();

clock2.display();
clock2.tick();
clock2.dclick();
}
class clockHand{
  float angle;
  float x;
  float y;
  float length;
  boolean running;
  float speed;
  color faceColor;
clockHand(float xTemp, float yTemp, float lengthTemp,float speedTemp,color faceColorTemp){
    x= xTemp;
    y= yTemp;
    faceColor=faceColorTemp;
    length = lengthTemp;
    angle = 0;
   speed = speedTemp;
   running = true;
  }
 void tick(){
    if(running){
   angle=(angle+speed)%360;
    }
 }
  void clockFace(){
    float faceR;
    fill(faceColor);
    faceR = (length*2)+20;
   
   ellipse(x,y,faceR,faceR);
  
 }
 void toggle(){
   if(running){
     running=false;
   }else{
   running=true;
   }
 }   
 void dclick(){
 if((dist(x,y,mouseX,mouseY)<(length*2))&&(mousePressed)){
 toggle();

   }
 }
 
 void display(){
   clockFace();
   float endx;
   float endy;
   endx = x+(length*cos(angle));
   endy = y+(length*sin(angle));
  
   line(x,y,endx,endy);
 }
}




