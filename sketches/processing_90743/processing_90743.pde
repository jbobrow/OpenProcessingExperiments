
float start=0.785;
float stop= 5.497;
float incr=.14;
int xPos=0;//<------------
 
void setup(){
noStroke();
size (800,100);
fill(250,250,0);
frameRate(60);
}
void draw(){
  background(0);
arc(xPos,50,80,80,start,stop);//<------------
start=start-incr ;
stop =stop+incr;
xPos=xPos+1;//<------------
if(start<=0 || start >=0.786){
  incr=incr *-1;
}
if (xPos>=800){//<------------
  xPos=0;//<------------
}//<------------
println("start= "+ start +"  stop= " +stop);
}
