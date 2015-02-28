
PShape snow;
PShape snow1;
PShape clouds;
PShape clouds1;
PShape mountains;
PShape tree;
float mountainX=0;
float mountainY=0;
float snowX=2;
float snowY=0;
float snow1X=0;
float snow1Y=150;
float speed=1;


void setup(){
  smooth();
  size(500,500);
  tree=loadShape("tree.svg");
  mountains=loadShape("mountains.svg");
   snow=loadShape("snow1.svg");
   snow1=loadShape("snow2.svg");
   clouds=loadShape("clouds.svg");
   clouds1=loadShape("clouds1.svg");
}
 void draw(){
   background(180);
   //bounce();
   //move();
   shape(clouds1,snowX*-1,200);
   shape(clouds1,snowX*-1,100);
   shape(clouds,snowX*-0.5,0);
   shape(mountains,mountainX+=0.5,mountainY-50);
   shape(snow,snow1X+=2,snow1Y,300,300);
   shape(snow,snowX*3,30,400,400);
   shape(snow,snowX+=2,100,450,450);
  }
 
// void move(){
 //  snowX=snowX+speed;
  // snow1X=snow1X+speed;
  // mountainX=mountainX+speed;
// }
 
/*void bounce(){
   if((snowX>width*3||snowX<0)){
     speed=speed*-1;
   }
   if((snow1X>width*3||snow1X<0)){
     speed=speed*-1;
   }
   if((mountainX>width*3||mountainX<0)){
     speed=speed*1;
  */// }



