
int bally=320;
int speed=2;




void setup(){
  size(400,400);


}

void draw(){
   background(255);
  
{  fill(0);
rect(140,390,150,20);
}
{
fill(255,0,0);
ellipse(220,bally,30,30);
}
if(bally>height){
  speed=speed*-1;
}
else if (bally<0){
  speed=speed*-1;
}
bally=bally+speed;


//}

 int x=10;
 while (x <=400){
    int y=10;
   while(y<300){
     fill(245,90,150);
      rect(x,y,20,20);
     y+=50;
    }
    x+=30;
 }
}
