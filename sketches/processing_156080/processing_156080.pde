
PImage earth;
PImage moon;
PImage sun;
PImage starbg;
PImage starfr;
PImage glare;
PImage starwars;
int amp = 200;
float diX;
float diY;
float i;
PFont font;
 
 
 
void setup(){
  smooth();
  size(500, 500,P2D);
  earth = loadImage("earth.png");
  moon = loadImage("moon.png");
  sun = loadImage("sun.png");
  starbg = loadImage("starbg.jpg");
  starfr = loadImage("starfr.png");
  glare = loadImage("glare.png");
  starwars = loadImage("starwar.gif");
  i = 0;
  font = loadFont("EurostileRegular-16.vlw");
 
}
   
   
void draw() {
   
   
   
  diX = width/2- mouseX;//distance from mouse to center
  diY = height/2 - mouseY;
    
  imageMode(CENTER);
   
  background(0);
   
  float starbgX = width/2;
  float starbgY = height/2;
   
  starbgX = starbgX - diX*0.6;
  starbgY = starbgY - diY*0.6;
   
  image(starbg, starbgX, starbgY, width*2, height*2);
  image(starfr, starbgX*1.2, starbgY*1.2, width*1.5, height*1.5);
  
   
   
  float sunX = 0;
  float sunY = 0;
   
  if (mouseX > width)  {
    sunX = sunX + diX*0.1;
  } else {
    sunX = sunX - diX*0.1;}
     
  if (mouseY > height)  {
    sunY = sunY + diY*0.1;
  } else {
    sunY = sunY - diY*0.1;}
     
  if (i < 360) {
    i = i + 0.1 ;} else {
      i = 0;}
   
   
  pushMatrix();
  imageMode(CENTER);
  translate(width/2, height/2);
  rotate(i*0.01);
  image(sun, sunX, sunY, 150, 150);
  popMatrix();
 
   
   
   
   
   
   
   
  float time =  millis()*0.0005;
  float earthX = cos(time) * amp + width/2;
  float earthY = sin(time) * amp + height/2;
   
  
   
 
  pushMatrix();
 
  image(earth, earthX - diX*0.15, earthY - diY*0.15, 50, 50);
  popMatrix();
   
  float moonX = cos(time*10) * amp/5 + earthX - diX*0.15;
  float moonY = sin(time*10) * amp/5 + earthY - diY*0.15;
   
  image(moon, moonX , moonY, 20, 20);
   
   
  float starfrX = width/2;
  float starfrY = height/2;
   
   
   
  starfrX = starfrX + diX*2;
  starfrY = starfrY + diY*2;
   
   blendMode(ADD); 
   
  image(starfr, starfrX, starfrY, width*4, height*4);
  image(starfr, starfrX*1.2, starfrY*1.2, width*16, height*16);
   
  pushMatrix();
  textSize(13);
  int i = 0;
  while (i < 10){
    fill(#3411FA);
      text("Once in a galaxy far, far away...", width/2, 8 * height/10 + i);
      i = i +1;}
     
   
  fill(#3411FA);
  text("Once in a galaxy far, far away...", width/2, 8 * height/10);
  fill(#ffffff);
  text("Once in a galaxy far, far away...", width/2, 8 * height/10+2);
  popMatrix();
   
   if (frameCount%500 > 250) {
    float clearc;
    if (keyPressed == true) {
      clearc = 0;} else {
        clearc = 99999; }
       
    blendMode(NORMAL); 
    image(starwars, width/2 + clearc, height/2 + clearc);
  
   
 

 
  }
   
       blendMode(ADD); 
    image(starfr, starfrX*1.2, starfrY*1.2, width*16, height*16);
     
    blendMode(NORMAL); 
 
   
}



