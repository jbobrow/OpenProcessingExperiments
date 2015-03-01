
//move mouse to show the principle of figure and ground
//first, set the int value of color
int a= 0;
int b= 0;
int c= 0;
color rect1 = color(a,b,c);
//create a 600x600px bacground and find color
void setup(){
size(550,550);
background(255,255,255);
}
//in void function set the float value of X,Y to see the piex number in my screen
void draw(){
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

//create 2nd rect which smaller than the 1st one
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
// as same rule as last 
if(mouseX >=200){
  a=255;b=255;c=255;
}
else{
  a=0;b=0;c=0;
}
noStroke();
fill(a,b,c);
rect(200,200,150,150);
//the last smallest one 
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



