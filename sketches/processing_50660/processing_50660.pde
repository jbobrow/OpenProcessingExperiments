
//katy law
//1-31-2012
//Create a Processing sketch that explores motion 
//using variables, math operators and conditionals. 

//declare
int x;//declare variable x of type int //the hanger
int y;
int directionx;
int directiony;

int xx;//the arms
int yy;
int dirxx;
int diryy;

int xxx;//the body and leg
int yyy;
int dirxxx;
int diryyy;



 
//run once
void setup(){
  size(600,600);
  background(#86dde0);
  smooth();
  //assign
  x=400;//assign 20 to x
  y=200;
  xx=440;
  yy=310;
  xxx=400;
  yyy=270;
  
 
//directionx=0;//assign _ to directionx
//directiony=-1;
dirxx=-1;//assign first direction to arm
diryy=-1;

 
}
 
//run 60 fps
void draw(){
  x+=directionx;//x=x+directionx //the hanger
  y+=directiony;//y=y+directiony
  if(x<401){
    directionx=-1;
    directiony=-1;
  }
  if(x<370){
    directionx=-5;
    directiony=0;
  }
  if(x<250){
    directionx=0;
    directiony=5;
 
  }
  if(y>430){
  directionx=0;
  directiony=0;
  
  }


  xx+=dirxx;//arms
  yy+=diryy;
  if(xx<520){
  dirxx=-1;
  diryy=-1;


  if(xx<400){
  dirxx=-1;
  diryy=1;
}
  if(xx<360){
  dirxx=0;
  diryy=0;
  }

  xxx+=dirxxx;//body and leg
  yyy+=diryyy;
  if(yyy>201){
  dirxxx=0;
  diryyy=1;
}
  if(yyy>350){
  dirxxx=-1;
  diryyy=1;
}
  if(yyy>390){
    dirxxx=0;
    diryyy=0;
  }


  noStroke();
  fill(#6c59ea);
  ellipse(x,y,20,20);
  
    noStroke();
  fill(#6c59ea);
  ellipse(xx,yy,20,20);
  
noStroke();
  fill(#6c59ea);
  ellipse(xxx,yyy,20,20);
  
  ellipse(400,234,65,65);
  

  
    }
}                               
