
//set the int value of color for void figure and ground principle 
int a= 0;
int b= 0;
int c= 0;
color rect1 = color(a,b,c);
void setup(){
  size(550,550);
  background(255,255,255);
}

void draw(){
  if(key=='q' || key=='Q'){
    PROXIMITY();
  }
  if(key=='w' || key=='W'){
     GROUND();
  }
  if(key=='e' || key=='E'){
    CLOSURE();
  }
}
void PROXIMITY(){
 //set these rectangles as a group 1
 //make them move by mouseX and mouseY
noStroke();
fill(0,0,0);
rect(mouseX,0,70,70);
rect(0,mouseY,50,50);
//again group 2
//mave them move in differ piex. 
noStroke();
fill(0,0,0);
rect(mouseX,100,70,70);
rect(100,mouseY,50,50);
// same fule of group 3
noStroke();
fill(0,0,0);
rect(mouseX,200,70,70);
rect(200,mouseY,50,50);
//group 4 
noStroke();
fill(0,0,0);
rect(mouseX,300,70,70);
rect(300,mouseY,50,50);
//group 5
noStroke();
fill(0,0,0);
rect(mouseX,400,70,70);
rect(400,mouseY,50,50);
//group 6
noStroke();
fill(0,0,0);
rect(mouseX,500,70,70);
rect(500,mouseY,50,50);
}
////move mouse to show the principle of figure and ground
void GROUND (){

float x=mouseX;
float y=mouseY;

// use If and Esle to change the each rect's color from black to whte follow the piex's number changing
if(mouseX >=50){
  a=255;b=255;c=255;
}
else{
  a=0;b=0;c=0;  
}
//set a rectangle that should smaller 100px than background
noStroke();
fill(a,b,c);
rect(50,50,450,450);

//create 2nd rect which smaller than the 1st one. 
if(mouseX >=100){
  a=255;b=255;c=255;
}
else{
  a=0;b=0;c=0;
}
noStroke();
fill(a,b,c);
rect(100,100,350,350);
//the third one smaller than the second
if(mouseX >=150){
  a=255;b=255;c=255;
}
else{
  a=0;b=0;c=0;
}
noStroke();
fill(a,b,c);
rect(150,150,250,250);
// follow the same concept
if(mouseX >=200){
  a=255;b=255;c=255;
}
else{
  a=0;b=0;c=0;
}
noStroke();
fill(a,b,c);
rect(200,200,150,150);
//create the last smallest one 
if(mouseX >=250){
  a=0;b=0;c=0;
}
else{
  a=255;b=255;c=255;
}

noStroke();
fill(a,b,c);
rect(250,250,50,50);
}
// firstly, set void setup and void draw to make object animade
//create void draw function, makeing a few rects that need to animade 
void CLOSURE(){
  //set the smooth opition to make these rectangles can represent the principle of closure 
  smooth();
  noStroke();
  //adjust the fill color to make the shape moves smoothly
  fill(0,12);
  //set the value of mouseX and mouseY to make one rect can cover the other
  rect(mouseX,mouseY,100,100);
  noStroke();
  fill(255,255,255);
  // add value to mouseX and mouseY
  rect(mouseX+25,mouseY+25,50,50);
  noStroke();
  //same thing. Finished and run 
  fill(0,90);
  rect(mouseX+38,mouseY+38,25,25);
  
}


  
    
  


