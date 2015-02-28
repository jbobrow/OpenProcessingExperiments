
//Dana Silberberg Sahar
//Home Assignment Oct_1st_2012 
//Drawing program which uses at least two variables

//Declaring my variables:
//int 
//float mouse;
//int mousePos;
int colorDir;
int myColor;

//Setup loop:
void setup(){
size(600,600);
smooth();
colorMode (HSB,360,100,100,100);//HSB allows rainbow
background(238,60,100);
//Defining variables
//mouse=0;
//mousePos=mouse+1;
myColor=0;
colorDir=myColor+1;
}

void draw(){
strokeWeight(5);
rect (0,0,50,50);
if(mousePressed){
stroke (myColor,100,100,60);//60% transperancy
fill (myColor,100,100,60);//60% transperancy
strokeWeight (20);
myColor+=colorDir;
if (myColor>360){
colorDir=-1;
}
if (myColor<0){
colorDir=1;
}
 //if the 'y' key is pressed use yellow stroke (to draw Yellow sunshine....
 /* thanks to the kind help of "Processing" [the blue book] p.225: Keyboard chapter*/
if ((keyPressed==true)&&(key=='y')){
  stroke (60,100,100,random(25));
  strokeWeight (random(60));
  line(mouseX,mouseY,pmouseX,pmouseY);
}
  if (mousePressed){
  //if the 'w' key is pressed use white stroke (to draw LIGHT WHITE clouds....
 /*That too -  thanks to the kind help of "Processing" [the blue book] p.225: Keyboard chapter*/
 if ((keyPressed==true)&&(key=='w')){
  stroke (100,0,100,random(30));
  strokeWeight (random(100));
line(mouseX,mouseY,pmouseX,pmouseY);
}
 /*That too -  thanks to the kind help of "Processing" [the blue book] p.225: Keyboard chapter*/
 //if the 'g' key is pressed use grey stroke (to draw GREY STORMY clouds....
if ((keyPressed==true)&&(key=='g')){
  stroke (0,0,70,random(100));
  fill (100,0,100,random(100));
  strokeWeight (random(60));
  line(mouseX,mouseY,pmouseX,pmouseY);
}
 /*That too -  thanks to the kind help of "Processing" [the blue book] p.225: Keyboard chapter*/
 //if the 'b' key is pressed use blue stroke (to draw RAINDROPS)....
if ((keyPressed==true)&&(key=='b')){
  stroke (240,100,100,random(20));
fill   (240,100,100,random(20));
  strokeWeight (random(10));
  line(mouseX,mouseY,pmouseX,pmouseY);
}
//and here you got yourself a rainbow
line(mouseX,mouseY,pmouseX,pmouseY);
}
}
}

//this is me trying unsuccessfully to make the screen clear when the 
//mouse is positioned on the rectangular-button I draw in the upper 
//left corner...would love to get a hint as for how to do that...
//(it just keeps earising everything and ignoring the condition...)

//if (mousePressed);{
//if (pmouseX<=(mouse+50));{
//if (mouseX<=(mouse+50));{
//if (mouseX<=50);{
//if ((mouseX, mouseY)<=(50,50));{
//if ((pmouseX, pmouseY)<=(50,50));{
//if (mouseX<=50));{
//fill (238,60,100);//
//rect (0,0,600,600)
//background (238,60,100);
//else{
//background (238,60,100,0);
//}



