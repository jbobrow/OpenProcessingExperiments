
float delta = 1;
float r = 100;

void setup()
{
  size(800,800,P3D);
}

void draw()
{
  background(0);
stroke(0,255,255,255); 
 
  translate(width/1.5, height/1.2, 0);
  rotateX(radians(mouseY));
  

  for (float z = 0; z < 300; z+=1) {
    for (float deg = 0; deg<360; deg +=delta){
    float theta = radians(deg);
    float x1 = r * cos(theta);
    float y1 = r * sin(theta);
    point(x1, y1, z);
    stroke(#744C2C);
    }
  }
    for (float z = 0; z<900; z+=50){
      for (float deg = 0; deg< 300; deg +=delta){
        float theta = radians(deg);
    float x2 = r * cos(theta);
    float y2 = r * sin(theta);
    point (x2,y2,z);
    stroke(#FCEC4F);
      }
    }
    for (float z = 0; z<600; z+=10){
      for (float deg = 0; deg< 300; deg +=delta){
        float theta = radians(deg);
    float x3 = r * cos(theta);
    float y3 = r * sin(theta);
    point (x3,y3,z);
    stroke(#CBCBCB);
    
  }
}
}
