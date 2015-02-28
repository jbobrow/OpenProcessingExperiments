
PVector pos, spd;

void setup(){
  colorMode(RGB);
  size(512,512,P3D);
  background(0,0,0);
  frameRate(30);
  noStroke();
  smooth();
  pos = new PVector(256,256,-128);
  spd = new PVector(random(-16,16),random(-16,16),-16);
}

void draw(){
  //PImage img;
  //img = loadImage("paddle.png");
  background(128,128,128);
  
  fill(96,96,96);
  beginShape();
  vertex(-64,-64,-1024);
  vertex(576,-64,-1024);
  vertex(576,-64,0);
  vertex(-64,-64,0);
  vertex(-64,-64,-1024);
  endShape();
 
  fill(64,64,64);
  beginShape();
  vertex(576,-64,-1024);
  vertex(576,576,-1024);
  vertex(576,576,0);
  vertex(576,-64,0);
  vertex(576,-64,-1024);
  endShape();
 
  fill(32,32,32);
  beginShape();
  vertex(-64,576,-1024);
  vertex(576,576,-1024);
  vertex(576,576,0);
  vertex(-64,576,0);
  vertex(-64,576,-1024);
  endShape();
  
  fill(64,64,64);
  beginShape();
  vertex(-64,-64,-1024);
  vertex(-64,576,-1024);
  vertex(-64,576,0);
  vertex(-64,-64,0);
  vertex(-64,-64,-1024);
  endShape();
  
  translate(pos.x, pos.y, pos.z);
  fill(256,256,256);
  sphere(64);
  
  translate(-pos.x, -pos.y, -pos.z);
  fill(192,192,192);
  tint(255,128);
  //image(img, mouseX-32,mouseY-32);
  beginShape();
  vertex(mouseX-32,mouseY-32,0);
  vertex(mouseX+32,mouseY-32,0);
  vertex(mouseX+32,mouseY+32,0);
  vertex(mouseX-32,mouseY+32,0);
  vertex(mouseX-32,mouseY-32,0);
  endShape();
  
  
  if(pos.z>-64){
    if(pos.x>mouseX-48 && pos.y>mouseY-48 && pos.x<mouseX+48 && pos.y<mouseY+48){
      spd.z*=-1;
      
    }
    else{
      pos.set(256,256,-64);
      spd.set(random(-16,16),random(-16,16),-16);
    }
  }  
  if(pos.z<-1024){
    spd.z*=-1;
  }  
  if(pos.x<0||pos.x>512){
    spd.x*=-1;
  }  
  if(pos.y<0||pos.y>512){
    spd.y*=-1;
  }
  //PVector.add(spd,pos,pos);
  pos.x+=spd.x;
  pos.y+=spd.y;
  pos.z+=spd.z;
}


