
//carnival booth
PImage ball;
PImage elephant;
PImage tiger;
PImage bulldog;
PImage bird;
float x,y,h,angle;
float a,d;
int direction;
int X;
int Y;
int directionX;
int directionY;

void setup(){
  size(800,600);
 //elephant
 elephant=loadImage("elephant1.gif");
 smooth();
  x=0;
  y=0;
  h=1;
  angle=0;
  //tiger
  tiger=loadImage("tiger-birthday.gif");
  x=0;
  y=0;
  h=1;
  angle=0;
  //bird
  bird=loadImage("bluebird.gif");
  x=0;
  y=0;
  h=100;
  angle=0;


//beach ball following mouse
 
  ball = loadImage("beachball.png");
  a=0;
  d=0;
  smooth();
}
{

int i;
int b;
int c;
}
{
X=10;
Y=20;

directionX=6;
directionY=15;
}
void draw(){ 
  //wooden stand and targets
noStroke();
 background(23,193,186);
fill(255,157,132);
ellipse(40,20,200,80);
ellipse(40,70,120,80);
ellipse(40,60,260,80);

fill(255,157,132);
ellipse(100,200,100,80);
ellipse(30,100,300,80);

ellipse(10,250,160,100);

fill(95,44,2);
rect(30,400,750,600);
fill(3,95,2);
rect(30,400,750,60);
fill(170,19,5);
for(int i=60; i<750; i+=60){
ellipse(i,430,60,60);
}
fill(188,140,49);
for(int b=60; b<750; b+=60)
ellipse(b,430,50,50);

fill(170,19,5);
for(int c=60; c<750; c+=60)
ellipse(c,430,40,40);

fill(188,140,49);
for(int b=60; b<750; b+=60)
ellipse(b,430,30,30);

fill(170,19,5);
for(int c=60;c<750;c+=60)
ellipse(c,430,20,20);

fill(188,140,49);
for(int b=60; b<750; b+=60)
ellipse(b,430,10,10);

fill(95,44,2);
rect(30,80, 40,400);
rect(750,80,40,600);
rect(30,50,760,50);

fill(170,19,5);
for(int i=60; i<850; i+=60)
ellipse(i,35,60,60);

fill(188,140,49);
for(int b=60; b<850; b+=60)
ellipse(b,35,50,50);

fill(170,19,5);
for(int i=60; i<850; i+=60)
ellipse(i,35,40,40);

fill(188,140,49);
for(int b=60; b<850; b+=60)
ellipse(b,35,30,30);

fill(170,19,5);
for(int i=60; i<850; i+=60)
ellipse(i,35,20,20);
fill(188,140,49);
for(int b=60; b<850; b+=60)
ellipse(b,35,10,10);

fill(3,95,2);
triangle(70,460,70,600,10,690);
rect(70,460,680,600);
rect(70,460,680,40);
triangle(750,460,600,600,815,690);

 //beach ball
image(ball,a,d,50,50);

//elephant movement
  image(elephant,x,y,200,200);
  x=cos(radians(angle))*h/4 + width/20;
  y=sin(radians(angle))*h/4 + height/2;
  
  angle--; //take this out to make animal move forward; add to make it rotate
  h++;

//when mouse is clicked over animal, animal flashes red, then travels down the Y-coordinate[falling]
//if(mousePressed == true);
 //if(dist(mouseX,mouseY,a,d)<50 == LEFT) {
   //fill(255);
 //} else if(dist(mouseX,mouseY,a,d)<50 == RIGHT) {
   //fill(255);
 //} else {
  //fill(255);
    
//tiger movement
  image(tiger,x,y,100,100);
  x=tan(radians(angle))*h + width;
  y=sin(radians(angle))*h/4 + height/2;
  
  //bird movement
  image(bird,x,y,80,80);
  x=sin(radians(angle))*h/4 + width/2;
  y=cos(radians(angle))*h/4 + height/2;
 }
  
  void mouseDragged(){ 
    if(dist(mouseX,mouseY,a,d)>5){
    a=mouseX;
    d=mouseY;
   if (abs(mouseX - a) < width &&
      abs(mouseY - d) < height) {
    x += random(-30, 30);
    y += random(-2, 5);
    fill(255);
    
    
  }
    
    //elephant rotates 180 when clicked on before [falling]
     //image(elephant,width,height,200,200); 
    //translate(width/2, height/2); 
//rotate(PI/3.0);
}

}
 





