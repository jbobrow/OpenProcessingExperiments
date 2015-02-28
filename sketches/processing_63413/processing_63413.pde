
float a;
float b;
float g;


void setup(){
 
  size (800,500);
  background(255);
  smooth();
  frameRate(100);
     println("there's an invasion by Zoogs, the Galactic Imperia needs your help! press any-key, and get a hint, how to become one of the insurgends.your our last hope!");

  
}
void draw(){
  

  ellipseMode(CENTER);
  rectMode(CENTER);
  a=random(screenHeight);
  b=random(screenWidth);
  g=random(0,255);
 stroke(0);
 fill(a,g,b);
 rect(a,b,20,100);
 stroke(0);
 fill(0,250,0);
 ellipse(a,b-30,60,60);
 fill(a,0,b);
 ellipse(a-19,b-30,16,32);
 ellipse(a+19,b-30,16,32);
 stroke(0);
 line (a-10,b+50,a-20,b+60);
 line(a+10,b+50,a+20,b+60);
}

 void keyPressed () {
   println("keep on klicking on Zoogs, and help us to kill them, thanks Anakin");
   
  
 }
   
void mousePressed (){
  
 stroke(0);
 fill(250,0,0);
  ellipse(a,b-30,60,60);
}
   
  

  

