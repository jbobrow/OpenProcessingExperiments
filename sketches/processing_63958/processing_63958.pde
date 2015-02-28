
import ddf.minim.*;

Minim minim;
AudioInput in;

void setup(){
  
  size(400,400);
  background(mouseX,mouseY,mouseX);
  ellipseMode(CENTER);
 minim = new Minim(this);
  minim.debugOn();
  
  // get a line in from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.STEREO, 512);
  
}
  
  
  
void draw(){
 
  stroke(255, 50);
  translate(50, 50, 0);
  rotateX(mouseY * 0.05);
  rotateY(mouseX * 0.05);
  fill(mouseX * 2, 0, 160);
  sphereDetail(mouseX / 4);
  sphere(40);
float r;
r = random(10,40);
 
  
  
smooth();
  colorMode(HSB,360);
  rectMode(CENTER);
 
 for(int k = 0; k < in.bufferSize() - 1; k++)
  {
    
//background(255,0,255);
fill(255,0,255,54);
  
rectMode(CENTER);
rect(200,200,400,400);

  
stroke(0);
strokeWeight(1);


  
noStroke();
colorMode(HSB);
fill(mouseX,255,255);


ellipseMode(CENTER);
ellipse(mouseY,mouseX,r,r);
ellipse(random(0,400),mouseX,r,r);
ellipse(mouseY,random(0,400),r,r);
noStroke();
translate(58, 48, 0);
sphere(28);
rect(205,mouseX,50,50);
rect(random(0,400),mouseX,50,50);
rect(random(0,400),205,50,50);
rect(mouseX,mouseY,50,50);
rect(105,mouseX,50,50);
rect(mouseY,mouseX,50,50);
rect(mouseX,305,50,50);
rect(mouseX,mouseY,50,50);
fill(random(0,255),random(0,255),random(0,255));
line(0,random(0,400),random(0,400),400);
 
 
 

//translate(0, mouseX, mouseX); 
//rotateY(0.5);
//box(mouseX); 
//translate(0, mouseX, mouseX); 
//rotateY(0.5);
//box(mouseX); 
//translate(0, mouseX, mouseX); 
//rotateY(0.5);
//box(mouseX); 
//translate(0, mouseX, mouseX); 
//rotateY(0.5);
//box(mouseX); 
//translate(0, mouseX, mouseX); 
//rotateY(0.5);
//box(mouseX); 
}
}
void stop()
{
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();
  
  super.stop();
}

