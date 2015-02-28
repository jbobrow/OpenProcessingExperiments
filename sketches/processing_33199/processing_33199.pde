
int a=600;
int b=3;
int c=0;
int d=2;

PImage myImage;
PImage myImage2;
PImage myImage3;

PFont myFont;

void setup(){

size(800,600);
 text("winter is coming",50,100);
smooth();

myImage=loadImage("snow.jpg");
myImage2=loadImage("emote_Flake.gif");

myFont=createFont("Calibri",40,true);
textFont(myFont);






}

void draw(){
  /*myImage=loadImage("snow.jpg");*/
  image(myImage,0,0,1024,768);

 
 a-=b;
  text("winter is coming",a,100);
  if(a<0||a>600){b*=-1;}
  
 c+=d;
    image(myImage2,40,c,50,50);
    if(c>560){image(myImage2,40,560,50,50);}


}

