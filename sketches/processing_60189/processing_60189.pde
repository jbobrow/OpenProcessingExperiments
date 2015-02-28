
/*Adapted from: Amphiblestrodian feed by kof. 
Link: http://openprocessing.org/sketch/14121
*/

PGraphics vignette;
 
void setup(){
  size(480,320,P2D);
 
  frameRate(100);
  rectMode(CENTER);
  noFill();
  stroke(255,220);
  smooth();
 
  vignette = createGraphics(width+90,height+20,JAVA2D);
  vignette.beginDraw();
  vignette.smooth();
  //vignette.noFill();
  vignette.strokeWeight(1.5);
  for(int i = 0;i<width*2;i++){

    
    
    
 
  }
  vignette.endDraw();
 
}
 
 
void draw(){
  background(0);
  pushStyle();
  fill(0,10);
  rect(width/2,height/2,width,height);
  popStyle();
 
pushMatrix();
  translate(random(-1,1),random(-1,1));
 
  for(int i = 0;i<400;i+=2){
    pushMatrix();
    translate(mouseX,random(height/2,height/1.9));
    //rotate(frameCount*(1.0+i/10.0*noise(frameCount/10.0)));
    stroke(255,60,50,noise((frameCount-i)/30.0)*150);
    ellipse(0,0,20+i,5+i);
    popMatrix();
  }
   
   
  popMatrix();
   
  
  
  image(vignette,random(-20),random(-20));
 
 
  //tint(random(200,255),random(200,255),12,150);
  //image(g,random(-2,2),random(-2,2));
 
  pushStyle();
  strokeWeight(40);
  stroke(20);
   noFill();
  

    
  rect(width/2,height/2,width,height);
  popStyle();
 
}


