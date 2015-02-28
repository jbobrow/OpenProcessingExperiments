



PFont f;
PImage skull;
PImage skull2;
PImage axe;
PImage axe2;
PImage clock;
PImage bones;
import gifAnimation.*;
PImage[] animation;
float DegreesPerHour = 360.0/12.0;
float DegreesPerTick = 360.0/60.0;
float i = 100;
Gif loopingGif;

void setup()
{
  size(650,800);
  f=loadFont("Boner-48.vlw");
 
  
}
 
void draw()
{
  background(0);
   loopingGif = new Gif(this, "bdragon.gif");
  loopingGif.loop();  
  animation = Gif.getPImages(this, "bdragon.gif");
   int[] numbers = {second(), minute(),hour(),380,day(),month(),year()};
   int s = numbers[0];
   int m = numbers[1];
   int h = numbers[2];
   int t = numbers[3];
   int d = numbers[4];
   int w = numbers[5];
   int y = numbers[6];
  // time
 
  float hoursRotation = radians( h  * DegreesPerHour);
  float secondsRotation = radians( s * DegreesPerTick);
  float minutesRotation = radians( m * DegreesPerTick);
  bones = loadImage("bone.png");
  skull= loadImage("skull.png");
  skull2= loadImage("skull2.png");
  clock= loadImage("clock.png");
  axe= loadImage("axe.png");
  axe2= loadImage("axe2.png");
  imageMode(CENTER); 
  smooth();
  // clock back
  fill(255);
  ellipse(width/2, height/2, 650, 650);
  image(clock, width/2, height/2);
   
   
 
  // seconds
  pushMatrix();
  translate(width/2, height/2);
  rotate(secondsRotation);
  translate(-width/2, -height/2);
  image(axe2, width/2, height/2);
  popMatrix();
 
   
  // minute hand
  strokeWeight(4);
  pushMatrix();
  translate(width/2, height/2);
  rotate(minutesRotation);
  translate(-width/2, -height/2);
  image(bones, width/2, height/2);
  popMatrix();
  
   // hour hand
  pushMatrix();
  translate(width/2, height/2);
  rotate(hoursRotation);
  translate(-width/2, -height/2);
  image(axe, width/2, height/2);
  popMatrix();
  if (s<1){
  image(skull2, width/2, 368);
  
}
  else{
  image(skull, width/2, 368);
  }
  if(h>12){
    h=h-12;
  }
  fill(#ffffff);
  textFont(f,80);
 
  if (m<10){
  text(+h+":0"+m, 190,70);}
  if(m>9){
  text(+h+":"+m,190,70);}
  if (h<9){
  t=t-35;}
  if (s<10){
  text(":0"+s,t,70);}
  else if (s>9){
  text(":"+s,t,70);}
   if (s>25){
  i=i+100;
image(loopingGif,i-200,45);}
  else {i=-100;}
   
    if(h>12){
    h=h+12;
  }
 

  textFont(f,30);
  text(" "+w+"/"+d+"/"+y ,10,695);}
  
 
  

  




