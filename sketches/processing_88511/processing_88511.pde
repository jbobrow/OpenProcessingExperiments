
float timer = 0;
float x = 0;
float y = 489;
float z = 1;
float starsY[]= new float[60];
float starsX[]= new float[60];
float[] s= new float [325];
PImage walk1;
PImage walk2;
PImage dance1;
PImage dance2;
PImage shock;
PImage happy;

void setup(){
  size(800,800);
  
   walk1=loadImage("walk1.jpg");
   walk2=loadImage("walk2.jpg");
   dance1=loadImage("dance1.jpg");
   dance2=loadImage("dance2.jpg");
   happy=loadImage("happy.jpg");
   shock=loadImage("shock.jpg");
  
  for( int i = 0; i<60; i++){
    starsY[i]= random(0,500);
    starsX[i]= random(194,800);
  }
}

void draw(){
  timer+=.013;
  
    if(timer<5){
      background(0);
      fill(0,255,100);
      ellipse(400,1000,1500,800);
      image(walk1,356,589);
      
      
  fill(255);
  ellipseMode(CENTER);
  arc(x,y,200,200,PI/2,TWO_PI-PI/2);//solid half
  stroke(255);
  fill(0);
  stroke(0);
  arc(x+2,y,150,200,PI/2,TWO_PI-PI/2);//sliver

  if (x > 750) {z = -1;}
   
  x = x + 1.5;
  y = y - z;
  

}
    for( int i = 0; i<60; i++){
    fill(255);
    ellipse(starsX[i], starsY[i], random(0,10), random(0,10));
  }
if(timer>5 && timer<10){
      fill(0,255,100);
      ellipse(400,1000,random(1350,1500),random(700,800));
      image(shock,356,589);
}

if(timer>10 && timer<15){
      fill(0,255,100);
      ellipse(400,1000,1500,800);
    int i = 300;
    while (i<325) {
    fill(98, 51, 19);
    triangle(33, 717, 100, 717, 82, 698-s[i]);
    if (s[i] <400) {
      s[i] = s[i] + 1;
    i++;
    image(shock,356,589);
    
}
}
}
if(timer>15 && timer<16){
  fill(0,255,100);
  stroke(0);
  ellipse(101, 316, 150, 150);
}
if(timer>16 && timer<17){
    fill(0,255,100);
  stroke(0);
  ellipse(90,345,150,150);
}
if(timer>17 && timer<18)
{
    fill(0,255,100);
  stroke(0);
  ellipse(60,301,150,150);
}
if(timer>18 && timer<19){
    fill(0,255,100);
  stroke(0);
  ellipse(54,376,150,150);
}



if(timer>15 && timer<15.5){
  noStroke();
      fill(0,255,100);
      rect(356,589,200,200);
      image(walk1,326,589);
}
if(timer>15.5 && timer<16){
    noStroke();
        fill(0,255,100);
      rect(326,589,200,200);
  image(walk2,296,589);
}
if(timer>16 && timer<16.5){
    noStroke();
        fill(0,255,100);
      rect(296,589,200,200);
  image(walk1,266,589);
}
if(timer>16.5 && timer<17){
    noStroke();
        fill(0,255,100);
      rect(266,589,200,200);
  image(walk2,236,589);
}
if(timer>17 && timer<17.5){
    noStroke();
        fill(0,255,100);
     rect(236,589,200,200);
  image(dance1,206,589);
}
if(timer>17.5 && timer<18){
  image(dance2,206,589);
}
if(timer>18 && timer<18.5){
  image(dance1,206,589);
}
if(timer>18.5 && timer<19){
  image(dance2,206,589);
}
if(timer>19 && timer<19.5){
  image(dance1,206,589);
}
if(timer>19.5 && timer<20){
  image(dance2,206,589);
}
if(timer>20&& timer<20.5){
  image(dance1,206,589);
}
if(timer>20.5 && timer<21){
  image(dance2,206,589);
}
if(timer>21.5 && timer<22){
  image(dance1,206,589);
}
}


