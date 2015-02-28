
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioInput in;

float rx;
float ry;



void setup(){
  size(512,512,P2D);
  
  minim = new Minim(this);
  minim.debugOn();
  in=minim.getLineIn(Minim.STEREO,512);
 
 colorMode(HSB,512);
 noFill(); 
 smooth();
 
 rx = random(1,359);
 ry = random(1,359);
 
}

void draw()
{
  background(0);
  
  
  //noStroke();
  
  for(int i = 0; i < 512; i+=20)//in.bufferSize() - 1
  {
    strokeWeight(5);
    stroke(i,512,512);
    
  //  pushMatrix();
   // translate(256,256);
   // rotate(radians(in.left.get(i)*180));
    //rotate(radians(rx+mouseX));
    
      //arc(0,0,i,i,radians(rx),radians(ry));
    //popMatrix();
    
    //fill(i,512,512);
    //line(0,0,512,512);
    //line(100,512,100,mouseY);
    line(i,512,in.right.get(i)*50,in.left.get(i)*50);
    //point(i,256+in.left.get(i)*100);
    //ellipse(i,256,5+in.left.get(i)*50,5+in.left.get(i)*50);
    //line(i, 50 + in.left.get(i)*50, i+1, 50 + in.left.get(i+1)*50);
    //line(i, 150 + in.right.get(i)*50, i+1, 150 + in.right.get(i+1)*50);
  
  }
}
  


