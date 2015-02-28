
void setup() {
  size(400, 400);
  frameRate(8);
}

/////////////////////////////////////////
void draw() {
  background(0, 220, 220);
  translate(200, 200);

  for (int j=0;j<1000;j++) {
    stroke(255, random(55, 255));
    strokeWeight(4);
    point(random(-400, 400), random(-400, 400));
  }
  
 flake();
 
 translate(-100,150);
 scale(.5,.5);
 flake();
 
 translate(450,-150);
 scale(.4,.4);
 flake();
 
 translate(-1800,-200);
 scale(1.9,1.9);
 flake();
  
 translate(400,-550);
 scale(.7,.7);
 flake();
}
/////////////////////////////

void flake(){
  //snowflake
rotate(PI/13);
int sections=6;

for (int i=0; i<6; i++) {
  strokeWeight(5);
  line(0,0,100,0);
  strokeWeight(2);
  rotate(2*PI/sections);
  fill(0,70,150);
  ellipse(70,10,10,10);
  ellipse(70,-10,10,10);
  fill(0,50,170);
  triangle(50,10,10,10,20,20);
  fill(0,150,230);
  rect(90,10,10,10);
  rect(90,-10,10,10);
  line(50,50,100,0);
  line(50,-50,100,0);
}

fill(0,100,random(200));
textSize(45);
text("SNOWFLAKE!",200,180);

}
