
int sides=3;
float seed=.01;

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
float my=map(mouseY,0,height,0,360);
rotateX(radians(my));
noFill();

beginShape();
vertex(-50,0,50);
vertex(-40,0,30);
vertex(20,10,30);
vertex(-50,0,50);
curveVertex(100,-30,20);
curveVertex(0,60,-20);
curveVertex(-100,-30,20);
curveVertex(100,-30,20);
endShape();


}
 
 
 
