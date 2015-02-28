
PImage myImg;
PImage secMyImg;
PImage thirMyImg;
int vel = 10;
int valueX = 0;
int valueY = 500;
int antX = 500;
int antY = 500;
 
 
 
 
void setup(){
  //gingham background
  size(600,600);
   
  frameRate(30);
  smooth();
 
   
  myImg = loadImage("ant2.gif");
  secMyImg = loadImage("ant1.gif");
  thirMyImg = loadImage("ant3.gif");
}
 
 
void draw(){
  background(255,255,255);


stroke(255,0,9,99);
   strokeWeight(29);
   for (int i = 0; i < height; i += 80){
   line(0,i,600,i); 
 }
 



for (int j = 0; j <height; j += 80){
line(j,0,j,600);
}


       
image(myImg,valueY,valueX);
image(thirMyImg,valueX,valueY);
image(secMyImg,antX,antY);
 
valueX = valueX + vel;
antX = antX-vel;
antY = antY-vel;
 
if(valueX ==height ){
vel = - vel;
}
 
else if(valueX ==0) {
  vel = - vel;
 
}
 
if(valueY==0){
 vel = - vel;
}
     
 
}



