
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import processing.pdf.*;

boolean record;


Minim minim;
AudioInput in;


void setup(){
  size(600,300,P3D);
 background(255);
 // beginRecord(PDF, "everything-###.pdf");

  minim = new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(Minim.STEREO, 1024);
  
  smooth();
  frameRate(30);
  
}


void draw(){
 
    


  noStroke();
  if(mousePressed){
      for(int i = 0; i < in.bufferSize() - 1; i++)
  {
    stroke(0,random(200));
    strokeWeight(random(1));
  //line(mouseX,mouseY+in.left.get(i)*50, pmouseX ,pmouseY+in.left.get(i+1)*50);
    //line(mouseX,mouseY+in.right.get(i)*50, pmouseX ,pmouseY+in.right.get(i+1)*50);
   // ellipse(mouseX,mouseY+in.right.get(i)*50, pmouseX ,pmouseY+in.right.get(i+1)*50);
   line(mouseX,mouseY, pmouseX ,pmouseY);
     strokeWeight(random(1));
    ellipse(mouseX,mouseY, in.right.get(i)*50 ,in.left.get(i+1)*50);
    
  }
  
}


}
void stop()
{
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();
 
  super.stop();
}


void keyPressed(){
  
  
    if(key == 'c'){
  noStroke();
    fill(255);
  rect(0,0,width, height);
    }
    
     if (key == 's') {
    endRecord();
    exit();
  }
  if (key == 'o') {
    beginRecord(PDF, "everything-###.pdf");
  }


    
  }
 
  
   

   
 


