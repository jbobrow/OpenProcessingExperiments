
import maxlink.*;
MaxLink link = new MaxLink(this, "final_recentdraft");

  public int getsize;

void setup(){
  size(1350,500);
  background(255);
  smooth();

}




/*
drawing between sky and earth
gradient background changing dramatically,, time-based
or using something else to modulate time

define depth and space of the screen
*/



int alpha = 10;
void draw() {
  //making delays with fill alpha
  noStroke();
  
  fill(255,alpha);
  //fill(255);
  //fill(229,219,184,alpha);
  rect(0,0,width*2,height*2);
  noStroke();
  //strokeWeight(3);
  //stroke(255,alpha*2);
  //uppershape
  //  float r1 = map(mouseY,0,height,61,170);
  //  float g1 = map(mouseY,0,height,90,191);
  //  float b1 = map(mouseY,0,height,115,209);
  //fill(255,211,33);
  fill(3,185,255,alpha+150);
  beginShape();
  float x1 = map(mouseX,0,width,-21,490);
  curveVertex(x1, 0);
  curveVertex(x1, 0);
  float x2 = map(mouseX,0,width,136,545);
  float y2 = map(mouseX,0,width,70,35);
  curveVertex(x2, y2);
  float x3 = map(mouseX,0,width,792,1200);
  float y3 = map(mouseX,0,width,35,70);
  curveVertex(x3, y3);
  float x4 = map(mouseX,0,width,846,1360);
  curveVertex(x4, 0);
  curveVertex(x4, 0);
  float x5 = map(mouseX,0,width,1083,1639);
  curveVertex(x5, 0);
  curveVertex(x5, 0);
  float x6 = map(mouseX,0,width,978,1441);
  float y6 = map(mouseX,0,width,32,106);
  curveVertex(x6, y6);
  float x7 = map(mouseX,0,width,-104,360);
  float y7 = map(mouseX,0,width,106,32);
  curveVertex(x7,y7);
  float x8 = map(mouseX,0,width,-300,287);
  float y8 = map(mouseX,0,width,-7,0);
  curveVertex(x8,y8);
  curveVertex(x8,y8);
  endShape(CLOSE);
  
  //stroke(229,219,184,alpha*2);
  //lowershape
  //  float r2 = map(mouseY,0,height,115,175);
  //  float g2 = map(mouseY,0,height,85,135);
  //  float b2 = map(mouseY,0,height,60,101);
  //fill(0);
  fill(111,75,41,alpha+150);
  beginShape();
  float x9 = map(mouseX,0,width,180,-350);
  curveVertex(x9, 500);
  curveVertex(x9, 500);
  float x10 = map(mouseX,0,width,266,-78);
  float y10 = map(mouseX,0,width,456,397);
  curveVertex(x10, y10);
  float x11 = map(mouseX,0,width,1415,1070);
  float y11 = map(mouseX,0,width,397,457);
  curveVertex(x11,y11);
  float x12 = map(mouseX,0,width,1685,1158);
  curveVertex(x12, 500);
  curveVertex(x12, 500);
  float x13 = map(mouseX,0,width,1338,865);
  curveVertex(x13, 500);
  curveVertex(x13, 500);
  float x14 = map(mouseX,0,width,1183,813);
  float y14 = map(mouseX,0,width,429,472);
  curveVertex(x14 ,y14);
  float x15 = map(mouseX,0,width,524,154);
  float y15 = map(mouseX,0,width,472,429);
  curveVertex(x15,y15);
  float x16 = map(mouseX,0,width,471,0);
  curveVertex(x16,500);
  curveVertex(x16,500);
  endShape(CLOSE);
}
  
  void mouseDragged(){
  //define brush size
  noFill();
  strokeWeight(2);
  float r1 = map(mouseX+mouseY,0,width+height,61,170);
  float g1 = map(mouseX-mouseY,0,width-height,90,191);
  float b1 = map(mouseX*mouseY,0,width*height,115,209);
  stroke(random(255),random(255),random(255));

  //link.declareInlet("getsize");
  float mZ = millis()%1000/10+10;
  ellipse(mouseX,mouseY,mZ,mZ); 
  //ellipse(mouseX,mouseY,getsize,getsize); 
  
  float mX = map(mouseX,0,width,0,479);
  float mY = map(mouseY,0,height,0,479);
  
  link.output(0,mX);
  link.output(1,mY);
  link.output(4,mZ);
}

void mouseReleased(){
  alpha=200;
  link.output(2,"bang");
}

void mousePressed(){
  alpha=10;
  noFill();
  strokeWeight(2);
  float r1 = map(mouseX+mouseY,0,width+height,61,170);
  float g1 = map(mouseX-mouseY,0,width-height,90,191);
  float b1 = map(mouseX*mouseY,0,width*height,115,209);
  stroke(random(255),random(255),random(255));

  //link.declareInlet("getsize");
  float mZ = millis()%1000/10+10;
  ellipse(mouseX,mouseY,mZ,mZ); 
  //ellipse(mouseX,mouseY,getsize,getsize); 
  
  float mX = map(mouseX,0,width,0,479);
  float mY = map(mouseY,0,height,0,479);
  
  link.output(0,mX);
  link.output(1,mY);
  link.output(4,mZ);
}

