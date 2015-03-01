
float delta = 3;
float r = 200;

void setup()
{
  size(600,600,P3D);
}

void draw()
{
  background(255);
  
  translate(width/2,height/2,0);
  rotateX(radians(mouseY));
  
  for(float z =0; z<200; z+=5){
    if (mousePressed){
      background(0);
      ellipse(0,0,200,200);
    }
    if (z>0){
    z--;
  }
    else if (z<5){
    z--;
  }
    
    for(float deg = 0; deg<360; deg+=delta){
      float theta = radians(deg);
      float x = r*cos(theta);
      float y = r*sin(theta);
      point(x,y,z);
    }
  }
}
