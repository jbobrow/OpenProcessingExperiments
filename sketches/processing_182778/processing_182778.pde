
int sides=50;
float angle=180/sides;
int r=40;

void setup(){
  size(500,500,P3D);
 
 
}

void draw(){
   background(0);
   translate(width/2, height/2, 0);
stroke(255);
rotateX(PI/2);
float mx=map(mouseX,0,width,0,360);
rotateZ(radians(mx));
float my=map(mouseY,0,height,0,180);
rotateX(radians(my));
noFill();

beginShape();
vertex(-100, -100, -100);
vertex( 100, -100, -100);
vertex(   0,    0,  100);

vertex( 100, -100, -100);
vertex( 100,  100, -100);
vertex(   0,    0,  100);

vertex( 100, 100, -100);
vertex(-100, 100, -100);
vertex(   0,   0,  100);

vertex(-100,  100, -100);
vertex(-100, -100, -100);
vertex(   0,    0,  100);
endShape();
  
}
 
 
 
