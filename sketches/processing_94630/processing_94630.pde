
dote[] dots;
int number;
float time;
float number2;
boolean timething;
float timenew;
float xpoint;
float ypoint;

void setup() {
  number=2000;
  number2=0;
  size(500,500);
time=0;
  background(100);
 dots=new dote[number];
  for (int i = 0 ; i < number ; i++) {
    dots[i] = new dote();
    
  
  }
    xpoint=random(210,290);
ypoint=random(225,250+25+25*sqrt(2));
  
 
}

void draw() {
  background(100);
 for(int k=0;k<number2*10;k++) {
   dots[k].display();
   if(number2==number/10 && time==number/10+60)
   {dots[k].explode();
   timething=true;
   }
 }
 if(time<number/10+60) {
 time=time+1;
 }
 if(number2<number/10){
 number2=number2+1;

}

if(timething=true) {
  timenew=1;
}



 }


class dote{
  float c;
  float d;
  float a;
  float b;
  float e;
  float l;
  float o;
  float f;
  float yv;
  float xv;
  float directx;
  float directy;
  
  
  
  dote() {
    c=random(190,310);
d=random(215,250+25+25*sqrt(2)+10);



//these lines allow for the x and y variables to be measured from a central point on the screen (i.e. measuring the difference between a point on the screen and the x or y location through subraction)//
//this allows for easier manipulation of these variables when making a statement about a symetrical object//
a=(225-c); 
b=(250-d); // between this variable and the one above the x,y of 225,250 can be stated as 0,0 based of a and b//
e=(275-c);
l=(250-c);
o=(250+(25/sqrt(2)))-d;






//if a point is contained within the circles at locations x:225,275 y:250 or the points are within a triangle that meets the circles at a point 45 degrees off the outermost point on the cicle (outer most horizontaly) or if the point is contained within a rectangle in the center of the heart then the point is red otherwise the point will be black//
if(sqrt(sq(a)+sq(b))<=25 || sqrt(sq(e)+sq(b))<=25) {
  f=200;} else if ((abs(l)+abs(o))<=25+(25/sqrt(2)) && o<=0) {
    f=200;
  } else if(abs(o)<(25/sqrt(2)) && abs(l)<25) {
   f=200;
 }
  else {
   f=0;
 } 
 
 
 
 directx=random(.1,1);
 directy=random(.1,1);
  }
 
 
 void display() {
   fill(f,f/4,f/4);
  stroke(f,f/4,f/4);
  ellipse(c,d,2,2);
 }
 
 void explode() {
  yv=(d-ypoint)/dist(c,d,xpoint,ypoint);
   xv=(c-xpoint)/dist(c,d,xpoint,ypoint);
   c=c+xv*directx;
   d=d+yv*directy;
 }
 

}




