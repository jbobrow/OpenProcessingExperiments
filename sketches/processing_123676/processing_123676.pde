
void setup(){
  size(800,600);
  frameRate(10);
}

void flake(){
    //rotate (PI/6);
  int sections=6;
  stroke(#B1D5D8);
  
  for (int i=0; i<sections;i++) {
  fill(255,255,255);
  line(0,0,100,0);
  line(0,0,20,68);
  triangle(10,10, 17, 23, 45, 16);
  ellipse(50,25,10,10);
  ellipse(100,-25,10,10);
  rotate(2*PI/sections);
    }
  }


void draw(){
  background(43, 26, 134);
  
  for (int c=0; c<1000;c++){
  stroke(255, random(55,255));
  strokeWeight(2);
  point(random(0,800), random(0,600));
  }
  
  translate(width/2,height/2);

 frameRate(5);
  fill(random (255),0,0);
  textAlign(CENTER);
  textSize(26);
  text("Let it snow!",0,200);

 flake();
 
 translate(203,-61);
 scale(.5,.5);
 flake();
 
 translate(210,-400);
 scale(.8,.8);
 flake();
 
 translate(-1438, 830);
 scale(1.5,1.5);
 flake();
 
translate(30,-425);
 scale(-.5,.5);
 flake();
 
translate(-1672, 1344);
 scale(-1.5,1.5);
 flake();


}
  
  




  




