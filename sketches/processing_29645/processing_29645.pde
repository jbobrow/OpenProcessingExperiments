
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.p5.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.common.*;
import org.jbox2d.collision.*;
import org.jbox2d.dynamics.joints.*;


import controlP5.*;

ControlP5 controlP5;




PImage deck;
PImage cloud;



Physics physics;
Body body, body2;
Body [] dots;
int numDots = 10;





void setup() {
  
  size(500,500,P3D);
  frameRate(60);
  
  initScene();
    
   cloud = loadImage("cloud.png");
   deck= loadImage("deck.jpg");
   physics.setDensity(0.0f);
  
  controlP5 = new ControlP5(this);
  controlP5.addSlider("numDots",1,10,10,20,20,100,14);
  
  dots= new Body[10];
  
  
  for(int i =0;i<dots.length;i++){
     dots[i]= physics.createCircle(random(1,600), random(1,400), random(20,60));
 } 
  

  fill(51,153,204);
   



}
   


    


                                                  



void draw() {
  background(0);
  
   
   
     image(deck, 0, 400, 700, 100);
      
 image(cloud, mouseX-75, mouseY-80, 150,75);
 physics.setDensity(0.0f);
 
 
// for (int i= 0; i< numDots; i++) {
//    dots[i].update();
//  }

 
  physics.setDensity(1.0f);
  if (keyPressed) {
    if (key == '1') {
      physics.createCircle(mouseX, mouseY, random(5,7));
       } else if(key == '3'){
      physics.removeBorder();
      background(0);
      
      
    } else if (key == '2') {
      float sz = (10);
      physics.createPolygon(mouseX,      mouseY, 
                            mouseX+sz,   mouseY, 
                            mouseX+sz*.5,mouseY-sz);
    }else if(key == 'c') { 
      
      physics.destroy();
      initScene();
      
    }else if(key == 'r'){
    
     
    }
  }
   
 

 


  
controlP5.draw();
}

public void numDots(int theValue) {
  numDots= theValue;
  
  println("a slider event. setting crcles to "+theValue);
  controlP5.controller("numDots").setValue(theValue);
}


   
   
   



void initScene() {
 
   
  
  float gravX = 0.0;                 
  float gravY = -10.0;
  float screenAABBWidth = 600;   
  float screenAABBHeight = 600;
  float borderBoxWidth = 505;      
  float borderBoxHeight = 505;
  float pixelsPerMeter = 30;
  physics = new Physics(this, width, height,
		              gravX, gravY,
			      screenAABBWidth, screenAABBHeight,
			      borderBoxWidth, borderBoxHeight,
			      pixelsPerMeter);
  physics.setDensity(1.0f);
  

  
}



