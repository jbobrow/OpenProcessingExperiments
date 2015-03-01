
float delta = 3;
float r = 200;
void setup()
{
  size(1200,1200,P3D);
  noLoop();
  
}
 void draw()
 {
   background(255);
    translate(width/2, height/2, 0);
    rotateX(radians(mouseY));
    rotateY(radians(mouseX));
    
    for (float z = 0; z<200; z+=5) {
      for (float deg = 0; deg< 360; deg+= delta) {
        float theta = radians(deg);
        float x = r * cos(theta);
        float y = r * sin(theta);
        sphere(r);
        stroke(x,y,z);
        strokeWeight(2);
        z= z-1;
        if(z<0) {
          z= height;
        }
      }
    }
 }
 
 void mousePressed() {
   loop();
 }
