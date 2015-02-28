
PImage myPic;
int num=200;
  
walk[] myWalk = new walk[num];
  
void setup(){
  size(400,400,P3D);
  background(255);
  myPic = loadImage("green.jpg");
  
  for(int i=0;i<myWalk.length;i++){
   myWalk[i]= new walk();
 }
  smooth();
}
  
void draw() {
  for(int i=0; i < myWalk.length; i++) {
    myWalk[i].update();
    myWalk[i].draw();
  }
}
  
  
class walk {
  
  float xpos = random(width);
  float ypos = random(height);
  
  walk() {
  }
 void update() {
    xpos=xpos+random(-2,2);
    ypos=ypos+random(-2,2);
    
    camera(250,-50,200,100,200,-100,0,-1,0); //camera adjust
    
   if(xpos > width) {
   xpos =xpos-1;
    }
    if(xpos <0) {
   xpos =xpos+1;
    }
    if(ypos > height) {
   ypos =ypos-1;
    }
    if(ypos < 0) {
   ypos =ypos+1;
    }
  }
  
  void draw() {
    color myColor=color(myPic.pixels[floor(random(width)) + floor((random(height)) * 400)]);
    stroke(myColor,100);
    strokeWeight(random(1,3));
    ellipse(xpos,ypos,3,3);
    stroke(255,255,0);
    line(xpos,ypos,xpos+1,ypos+1);
  }
}
void keyPressed(){
  if((key == 'S') || (key == 's')){
   save("image.jpg");
  }
}

