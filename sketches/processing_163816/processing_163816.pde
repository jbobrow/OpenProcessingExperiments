
int l, s, n, rT;
float delta = 30;
float r = 100;
float x2, y2, z2;
int constant=300;
float angle=0.05;
int scalar=300;
float speed=0.05;
float rot=0;
 
void setup() {
    size(800, 600, P3D);
    background(20);
    frameRate(60);
    smooth();
    noStroke();
     
    l = 40;
    s = 10;
    n = 9;
    rT = 2500;
    
}

void mousePressed(){
  rotateY(PI/2);
}

void draw() {
    background(20);
      
    //float t = (millis()/rT)%TWO_PI;
    float x=constant+sin(angle)*scalar;
    float y=constant+cos(angle)*scalar;
    
    if (mousePressed) {
        pointLight(255, 255, 255, mouseX, mouseY, width/2);
    } else {
        lights();
        directionalLight(255, 0, 0, 1, 1, 0);
    }
 
    translate(width/2, height/2, 0);
  
    //rotateX(t);
    //rotateY(t);
    //rotateZ(t);
    rotateX(30);
    //rotateY(mouseY);
 
    for(float deg=0; deg<360; deg += delta)
    {
      float theta = radians(deg);
        
      for(float deg2 = 0; deg2 < 360; deg2 += delta){     
       float phi = radians(deg2);
        float x2 = r * sin(phi) * cos(theta);
        float y2 = r * sin(phi) * sin(theta);
        float z2 = r * cos(phi);
        drawSphere(5, x2, y2, z2);
           
      }
    }
  
  noStroke();
  lights();
  fill(255,246,142);
  translate(x-(width/2),y-(height/2)-150,50);
  sphere(50);
  angle=angle+speed;
}
 
void drawSphere(float r, float X, float Y, float Z)
{
  for(float deg=0; deg<360; deg += delta)
  {
      float theta = radians(deg);
        
      for(float deg2 = 0; deg2 < 360; deg2 += delta){     
       float phi = radians(deg2);
        float x = r * sin(phi) * cos(theta);
        float y = r * sin(phi) * sin(theta);
        float z = r * cos(phi);
        point(x+X,y+Y,z+Z);
        stroke(8,187,255);
        
      }
    }
}
