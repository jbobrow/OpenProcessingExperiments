
//Copyright Christopher Henley chenley 2014

//Frame
size(400,400);
background(0,0,0);
pushMatrix();
translate(200,200);
int a=0;
int b=1;
int d=0;

//Background
noFill();
strokeWeight(1);
stroke(10,10,10);
quad(-200,-50,50,80,60,63,-60,50);
quad(50,60,-60,-80,90,-150,-200,120);
rect(-50,-50,100,100);
rect(-150,-150,300,300);
triangle(-20,100,180,180,150,-90);
ellipse(100,-60,100,200);
ellipse(0,0,200,200);
//Initials
while (a<100){
  noFill();
  stroke(0,0,d);
  strokeWeight(b);
  arc(-70,0,200-a,200-a,PI/4,PI+PI-PI/4);
  arc(70,0,200-a,200-a,PI/2+PI/4,PI+PI/2-PI/4);
  arc(70,0,200-a,200-a,PI+PI/2,TWO_PI+PI/2);
  a=a+10;
  b=b+1;
  d=d+(255/10);
}
stroke(0,0,255);
strokeWeight(10);
line(20,0,120,0);

//Save
//saveFrame("chenley_Hw1.jpg");





