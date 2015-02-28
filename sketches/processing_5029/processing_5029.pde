
/*
Cubes floating in space
adalau85@gmail.com
October 6, 2009
*/
int x = -180;
int y = 0;

void setup() {
  size(500,500,P3D);
  background(255);
  smooth();
};

void draw() {
  background(255);
  stroke(0,50);
  strokeWeight(2);
  noFill();
  translate(width/2,height/2);
  
  //turn canvas 360 degrees
  rotateY( ((float)mouseX/width) * (PI*2));
  rotateZ( ((float)mouseY/height) * (PI*2));
  
  //the outer lime green cube
  fill(127,255,0,50);
  box(250);
  
  //2nd inner green cube
  fill(0,206,209,50);
  box(200);
  
  //3rd inner pink cube
  fill(255,100,100,50);
  box(150);
  
  //sphere on the top
  translate(x,y);
  fill(148,0,211,50);
  noStroke();
  lights();
  sphere(50);
  
  if(mousePressed) {
     if(( x >= -180) && (x < 0)){
       x += 5;
     }
     if(x == 0) {
       y -= 5;
     }   
  };
};

