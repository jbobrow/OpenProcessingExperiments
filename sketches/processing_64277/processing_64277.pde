
import ddf.minim.*;

Minim minim;
AudioInput in;

void setup() {

  size(1000, 700,P3D);
  //colorMode(HSB,360);
  
   minim = new Minim(this);
  minim.debugOn();
  
  in = minim.getLineIn(Minim.STEREO, 1000);
}

void draw() {
  
   
  background(0);
  //background(255);
  for(int i = 0; i < in.bufferSize() - 1; i+=1){
  
  rectMode(CENTER);
 
  rect(500,350,10 + in.left.get(i)+ in.right.get(i)*50+i*10,10 + in.left.get(i)*50+i*14);
  ellipse(i,400 + in.left.get(i)*100,i+1,700 + in.left.get(i+1)*100);
  rotate(radians(random(mouseX,mouseY)));
    //stroke(i*0.8,360,360);
    stroke(255);
  noFill();
  
  
/*  
  ellipse(i,400 + in.right.get(i)*100,i+1,700 + in.right.get(i+1)*100);
  stroke(i*0.06,360,360);
  noFill();
*/
  }
 
 
}

void stop()
{
  in.close();
  minim.stop();
  
  super.stop();
}

