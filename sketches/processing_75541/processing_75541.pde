
void setup() {
size(600, 600);

}
PImage cloud= loadImage("cloud.png");
PImage felix= loadImage("felix.png");

float x=100;
float y=200;
float speed1=0;
float speed2=0;
float speed3=0;
float speed4=0;
float speed5=0;
float speed6=0;
float speed7=0;
float speed8=0;

float xpos1=random(10,580);
float xpos2=random(10,580);
float xpos3=random(10,580);
float xpos4=random(10,580);
float xpos5=random(10,580);
float xpos6=random(10,580);
float xpos7=random(10,580);
float xpos8=random(10,580);

float ypos1=random(10,580);
float ypos2=random(10,580);
float ypos3=random(10,580);
float ypos4=random(10,580);
float ypos5=random(10,580);
float ypos6=random(10,580);
float ypos7=random(10,580);
float ypos8=random(10,580);
void draw()
{
  cloud1();
//ellipse (x, y, 20,20);
image(felix,x,y,73,115);
   if(x<=530 && x>=0)
   {
     if (keyPressed) {
       if (key == 'a' || key == 'A') {
         x=x-6;
       }
       if (key == 'd' || key == 'D') {
         x=x+6;
       }
     }    
   }
   else{
     if(x>530){
       if (key == 'a' || key == 'A') {
         x=x-6;
       }
     }
     if(x<0){
       if (key == 'd' || key == 'D') {
         x=x+6;
       }
     } 
   } 

//cloud1();

}
float p1=random(0,0.2);
float p2=random(0,0.2);
float p3=random(0,0.2);
float p4=random(0,0.2);
float p5=random(0,0.2);
float p6=random(0,0.2);
float p7=random(0,0.2);
float p8=random(0,0.2);
float i=0;
float j=0;
float k=0;
void cloud1(){
 //if(i<=192 && j<=173 && k<=167){
  i=i+0.05;
  j=j+0.05;
  k=k+0.05;
 if(i<192 && j<173 && k<167){
  background(2+i,66+j,87+k);
 }
 else{
    background(194,239,254);
 }
speed1=0;
speed2=0;
speed3=0;
speed4=0;
speed5=0;
speed6=0;
speed7=0;
speed8=0;
speed1=random(0,0.002);
speed2=random(0,0.002);
speed3=random(0,0.002);
speed4=random(0,0.002);
speed5=random(0,0.002);
speed6=random(0,0.002);
speed7=random(0,0.002);
speed8=random(0,0.002);

if(ypos1<0){
ypos1=600;
xpos1=random(10,580);
}

image(cloud,xpos1,ypos1);
ypos1=ypos1- p1;
p1=p1+speed1;
/////////////////////
if(ypos2<0){
ypos2=600;
xpos2=random(10,580);
}

image(cloud,xpos2,ypos2);
ypos2=ypos2- p2;
p2=p2+speed2;
/////////////////////
if(ypos3<0){
ypos3=600;
xpos3=random(10,580);
}

image(cloud,xpos3,ypos3);
ypos3=ypos3- p3;
p3=p3+speed3;
/////////////////////
if(ypos4<0){
ypos4=600;
xpos4=random(10,580);
}

image(cloud,xpos4,ypos4);
ypos4=ypos4- p4;
p4=p4+speed4;
/////////////////////
if(ypos5<0){
ypos5=600;
xpos5=random(10,580);
}

image(cloud,xpos5,ypos5);
ypos5=ypos5- p5;
p5=p5+speed5;
/////////////////////
if(ypos6<0){
ypos6=600;
xpos6=random(10,580);
}

image(cloud,xpos6,ypos6);
ypos6=ypos6- p6;
p6=p6+speed6;

/////////////////////
if(ypos7<0){
ypos7=600;
xpos7=random(10,580);
}

image(cloud,xpos7,ypos7);
ypos7=ypos7- p7;
p7=p7+speed7;
/////////////////////
if(ypos8<0){
ypos8=600;
xpos8=random(10,580);
}

image(cloud,xpos8,ypos8);
ypos8=ypos8- p8;
p8=p8+speed8;
/////////////////////
}


