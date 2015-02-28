
Kid k = new Kid();
   PGraphics buf;
PGraphics bufmain = g;
void setup(){
   size(250,250); 
   frameRate(30);
 buf = createGraphics(width,height,JAVA2D);
resetSnow();
}

void resetSnow(){
  
  buf.beginDraw();
buf.background(255);
  buf.strokeWeight(4);
        buf.fill(225);
        buf.stroke(225);
buf.endDraw();

}

void keyPressed(){
if(key == ' '){
  resetSnow(); 
}
}

void draw(){
  
PImage img = buf.get(0,0,width,height);
image(img,0,0);  
udpateR();
//k.rot += .1;
   k.draw();
}
 

void mouseMoved(){
  if(! mousePressed){
  k.rot += (mouseX-pmouseX) / 40.0 + (mouseY-pmouseY) / 50.0;

k.x=mouseX;
k.y = mouseY;
     
  } 
}

void udpateR(){
  if(mousePressed){
    if(rup){
      r += .1;
      if(r > PI/4){
        rup = false;
      }      
    } else {
       r -= .1;
       if(r < 0){
          rup = true; 
       }
    }
      
  }
}

float r;
boolean rup = true;

class Kid{
  float x =125;
  float y = 125;
float rot;
  void draw(){
  //  r+=.1;

    pushMatrix();
    translate(x,y);    
    rotate(rot);
   
    if(mousePressed){
      
      drawImprint();
    }
    drawSuit(true);
    drawSuit(false);
    popMatrix();
  }
  float TORSOWIDTH = 16;
  float TORSOHEIGHT = 24;  
  float LEGWIDTH = 6;
  float LEGHEIGHT = 12;
  float LEGOUT = 4;
  float ARMWIDTH = 6;
  float ARMLENGTH = 20;
  float HEADWIDTH = 10;


  void drawSuit(boolean drawingBG){
    
    setPens(color(40,100,240),drawingBG);

    rect(-TORSOWIDTH/2,-TORSOHEIGHT/2,TORSOWIDTH,TORSOHEIGHT);
//left leg
    pushMatrix();
      translate(-LEGOUT,TORSOHEIGHT/2);
      rotate(r/2);
      rect(-LEGWIDTH/2,0,LEGWIDTH,LEGHEIGHT);
    popMatrix();
//right leg
    pushMatrix();
      translate(LEGOUT,TORSOHEIGHT/2);
      rotate(-r/2);
      rect(-LEGWIDTH/2,0,LEGWIDTH,LEGHEIGHT);
    popMatrix();
//left arm
    pushMatrix();
    translate(-TORSOWIDTH/4,0);
    rotate(PI*3/8 + (r * 1.25));
    rect(-ARMWIDTH/2,0,ARMWIDTH,ARMLENGTH);
    popMatrix();    
//right arm
    pushMatrix();
    translate(TORSOWIDTH/4,0);
    rotate(-PI*3/8 - (r * 1.25));
    rect(-ARMWIDTH/2,0,ARMWIDTH,ARMLENGTH);
    popMatrix();    
    
        setPens(color(255,25500,200),drawingBG);
    rect(-HEADWIDTH/2, -HEADWIDTH, HEADWIDTH,HEADWIDTH);

    
}
  
  void drawImprint(){
   buf.beginDraw();

    buf.pushMatrix();
    buf.translate(x,y);    
    buf.rotate(rot);


    buf.rect(-TORSOWIDTH/2,-TORSOHEIGHT/2,TORSOWIDTH,TORSOHEIGHT);
    

//left leg
    buf.pushMatrix();
      buf.translate(-LEGOUT,TORSOHEIGHT/2);
      buf.rotate(r/2);
      buf.rect(-LEGWIDTH/2,0,LEGWIDTH,LEGHEIGHT);
    buf.popMatrix();
//right leg
    buf.pushMatrix();
      buf.translate(LEGOUT,TORSOHEIGHT/2);
      buf.rotate(-r/2);
      buf.rect(-LEGWIDTH/2,0,LEGWIDTH,LEGHEIGHT);
    buf.popMatrix();
//left arm
    buf.pushMatrix();
    buf.translate(-TORSOWIDTH/4,0);
    buf.rotate(PI*3/8 + (r * 1.25));
    buf.rect(-ARMWIDTH/2,0,ARMWIDTH,ARMLENGTH);
    buf.popMatrix();    
//right arm
    buf.pushMatrix();
    buf.translate(TORSOWIDTH/4,0);
    buf.rotate(-PI*3/8 - (r * 1.25));
    buf.rect(-ARMWIDTH/2,0,ARMWIDTH,ARMLENGTH);
    buf.popMatrix();    


buf.popMatrix();

      
  buf.endDraw(); 
  }
  
  void setPens(color c, boolean drawingBG){
     if(drawingBG){
        strokeWeight(5);
        fill(0);
        stroke(0);
     } else {
         noStroke();
         fill(c);
     }
  }
  
  
  
}


