
//Open Processing, Classrooms

PImage backimg;

void setup(){
  size(600, 400);
  smooth();
  
  background(#5AABFF);
}
 
float x=150, y=150, xn=150, yn=150;
float a=150, b=150, an=150, bn=150;
float q=150, w=150, qn=150, wn=150;
float e=150, r=150, en=150, rn=150;
float d=150, f=150, dn=150, fn=150;
 
void draw(){
//-------------------------------Normal Speed
  if(keyPressed){
   if(key == '1'){
     frameRate(60);
   }
 }
//---------------------------------Double Speed
  if(keyPressed){
   if(key == '2'){
     frameRate(120); }
 }
 //-----------------------------------------Ten Times Speed
 if(keyPressed){
   if(key == '3'){
     frameRate(600);
   }
 }
   
  //----------------------------Sky Depth
  stroke(#a5d9ec, random(0.1,2));
  e = constrain(e, 0+random(0, 20), width-random(0, 20));
  r = constrain(r, 0+random(0, 20), height-random(0, 20));
   
  e = e + random(-49,5);
  r = r + random(-5,5);
   
  strokeWeight(random(3, 4));
  line(250,r,en,rn);
  en = e;
  rn = r;
   
  //--------------------------------------------------------Background Clouds
    stroke(255, random(5,20));
  x = constrain(x, 0+random(0, 20), width-random(0, 20));
  y = constrain(y, 0+random(0, 20), height-random(0, 20));
   
  x = x + random(-15,15);
  y = y + random(-15,15);
   
  strokeWeight(random(.1, 5));
  line(x,y,xn,yn);
   
  xn = x;
  yn = y;
   
 
//------------------------------------------------------------------Clouds
   stroke(255, random(10,80));
  d = constrain(d, 0+random(0, 20), width-random(0, 20));
  f = constrain(f, 0+random(0, 20), height-random(0, 20));
   
  d = d + random(-5,5);
  f = f + random(-5,5);
   
  strokeWeight(random(.5, 8));
  line(d,f,dn,fn);
   
  dn = d;
  fn = f;
   
     backimg = loadImage("adv10.gif");
  image(backimg,0,0);
   
        save("clouds.png");
   
   
}
//----------------------------------------------------------------------------//
 
  //Clear
 void keyTyped(){
   if(key == 'c'){
  background(#93E3FF);
  
 
   }
   

   
 }
 
 
//--------------------------------Pause
 void keyPressed(){
   if(key == 'z'){
  noLoop();
    
   }
 }
 //--------------------------Resume
 void keyReleased(){
   if(key == 'x'){
  loop();
    
   }
 }
  
 void mousePressed(){
   d = mouseX;
   f = mouseY;
 }


