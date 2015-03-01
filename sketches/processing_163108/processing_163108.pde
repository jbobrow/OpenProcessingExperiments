
float delta=1;
float r=100;
void setup()
{
  size(1000,800,P3D);
}
void draw()
{
background(255);
lights();
 
translate(width/2, height/2, 0);
//rotateX(radians(mouseY));
rotateY(radians(mouseX));
 
for(float z= 0; z< 200; z+=7) {
  for(float deg= 0; deg< 360; deg+= delta){
    float theta= radians(deg);
    float x= r*cos (theta);
    float y= r*sin (theta);
    point(x-150,y,z);
    //ellipse(x-150,y,z,z);
  }
}
 
for(float z2= 0; z2< 200; z2+=7) {
  for(float deg2= 0; deg2< 360; deg2+= delta){
    float theta2= radians(deg2);
    float x2= r*cos (theta2);
    float y2= r*sin (theta2);
    point(x2+150,y2,z2);
    //ellipse(x2-150,y2,z2,z2);
  }
}
fill(0);
box(100, 80, 80);
}
