
//By Robin E.

float x;  //Declares Variable
float y;
int directionX;
int directionY;

void setup(){
 smooth();
 frameRate(300); size(1200,600);
 x=3;
 directionX=4;
 y=3;
 directionY=1;
}

void draw(){
  background(250,5,5);
  x += directionX;
  y += directionY;
  
  //And now, for the lines.
  

  fill(250,238,8);
  stroke(250,238,8);
  line(x,y,70,70);
  fill(127,245,2);
  line(x,y,40,40);
  line(x,y,260,0);
  line(x,y,450,0);
  line(x,y,150,150);
  line(x,y,345,16);
  line(x,y,375,523);
  line(x,y,476,375);
  line(x,y,430,430);
  line(x,y,300,300);
  line(x,y,520,600);
  line(x,y,500,500);
  line(x,y,670,600);
  line(x,y,10,500);
  line(x,y,30,475);
  line(x,y,780,200);
  line(x,y,650,300);
  line(x,y,800,600);
  line(x,y,925,475);
  line(x,y,1100,20);
  line(x,y,978,550);
  line(x,y,800,50);
  line(x,y,1200,0);
  line(x,y,1125,345);
  line(x,y,130,300);
  line(x,y,132,456);
  line(x,y,1140,570);
  line(x,y,625,50);
  line(x,y,800,78);
  line(x,y,1000,285);
  line(x,y,1200,500);
  line(x,y,250,540);
  line(x,y,100,467);
  
  println(x);
  println(y);
  if(y > height){
    directionY=-1;
  }
  if(x > width){
    directionX=-1;
  }
  if(y==0){
    directionY=1;
  }
  if(x==0){
    directionX=1;
  }
}

