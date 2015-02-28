
/* @pjs preload="lepipe.jpg";*/
/* @pjs preload="clouds1.jpg";*/
PImage myimage;
PImage myimage2;
int multicircle = 150;

void setup(){
  size(856,720);
  myimage = loadImage("lepipe.jpg");
 myimage2 = loadImage ("clouds1.jpg");
}
void draw(){

image (myimage, 0,0,width,height);


image (myimage2, 0,0,width,height);
tint(100,5);
  
noStroke();
fill(#000000);
ellipse (0,0,300,300);
ellipse (0,720,300,300);
ellipse (856,0,300,300);
ellipse (856,720,300,300);

stroke(#FFFFFF);
fill(#0101DF);
ellipse (0,0,275,275);
ellipse (0,720,275,275);
ellipse (856,0,275,275);
ellipse (856,720,275,275);
  
fill(#0B610B);
ellipse (0,0,250,250);
ellipse (0,720,250,250);
ellipse (856,0,250,250);
ellipse (856,720,250,250);



smooth();
strokeWeight(1);
stroke(#58FA58);



//lower left 

line(0,720,656,520);
line(0,720,666,530);
line(0,720,676,540);
line(0,720,686,550);
line(0,720,696,560);
line(0,720,706,570);
line(0,720,716,580);
line(0,720,726,590);
line(0,720,736,600);
line(0,720,746,610);
line(0,720,756,620);
line(0,720,766,630);
line(0,720,776,640);
line(0,720,786,650);
line(0,720,796,660);
line(0,720,806,670);
line(0,720,816,680);
line(0,720,826,690);
line(0,720,836,700);
line(0,720,846,710);

//right
line(856,720,190,530);
line(856,720,180,540);
line(856,720,170,550);
line(856,720,160,560);
line(856,720,150,570);
line(856,720,140,580);
line(856,720,130,590);
line(856,720,120,600);
line(856,720,110,610);
line(856,720,100,620);
line(856,720,90,630);
line(856,720,80,640);
line(856,720,70,650);
line(856,720,60,660);
line(856,720,50,670);
line(856,720,40,680);
line(856,720,30,690);
line(856,720,20,700);
line(856,720,10,710);

stroke(#FFFFFF);
strokeWeight(3);
noFill();
ellipseMode(CENTER);
ellipse(250,500,50,50);

ellipseMode(CENTER);
ellipse(300,450,50,50);

ellipseMode(CENTER);
ellipse(280,250,50,50);

ellipseMode(CENTER);
ellipse(270,350,50,50);

ellipseMode(CENTER);
ellipse(220,380,50,50);

ellipseMode(CENTER);
ellipse(260,470,50,50);

ellipseMode(CENTER);
ellipse(250,430,50,50);

ellipseMode(CENTER);
ellipse(270,400,50,50);

ellipseMode(CENTER);
ellipse(270,280,50,50);

ellipseMode(CENTER);
ellipse(250,310,50,50);


noFill();

for (int multicircle = 950; multicircle>0;multicircle-=100){
  ellipse(448,360,multicircle,multicircle);

  
  
  
}









}


