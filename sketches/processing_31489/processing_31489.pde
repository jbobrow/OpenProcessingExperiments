
int hello = 0;
int goodbye = 10;
int y =0;

void setup(){
  size(500,500);
  noFill();
  background(255, 204, 0);
  frameRate(4);
}
 
 void draw(){
   while(goodbye < 950){
     ellipse(hello,y,goodbye,goodbye);
     goodbye = goodbye + 80;
   }
   
   hello = hello + 100;
   goodbye = 0;
   
   if(hello > 800);
   y = y + 100;
   hello = 0;
 }

