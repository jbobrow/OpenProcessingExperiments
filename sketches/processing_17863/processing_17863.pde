
int [] xpos = new int [50];
int [] ypos = new int [50];


void setup (){
  size (600,600);
  smooth ();
for ( int i = 0 ;i< xpos.length ; i++){
  xpos[i] = 0; 
  ypos[i] = 0;
}}

void draw (){
background ( #ff0044);


for ( int i = 0 ; i < xpos.length-1 ; i++){
  xpos[i] = xpos [i+1];
  ypos[i] = ypos [i+1];
}

xpos[ xpos.length-1] = mouseX;
ypos[ ypos.length-1] = mouseY;
 
  
  
  
  for ( int i = 0 ;i< xpos.length ; i++){
  noStroke ();
  fill ( 255-i*5);
  ellipse ( xpos[i],ypos[i],i,i);






}}


/*
void circle (int widtha,int heigtha,int widt, int heigh){

  
fill (0);
ellipse ( widtha/2,heighta/2,widt/6,heigh/6);
fill (255);
ellipse ( widtha/2,heighta/2,widt/7,heigh/7);
fill (0);
ellipse ( widtha/2,heighta/2,widt/9,heigh/9);
fill (255);
ellipse ( widtha/2,heighta/2,widt/11,heigh/11);
fill (0);
ellipse ( widtha/2,heighta/2,widt/13,heigh/13);
fill (255);
ellipse ( widtha/2,heighta/2,widt/16,heigh/16);


}

*/
