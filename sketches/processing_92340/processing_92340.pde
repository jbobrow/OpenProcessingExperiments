
class stick
{
  float x1;
  float y1;
  float x2;
  float y2;
  float len;
  
  stick(float x, float y, float l)
  {
    x1=x;
    x2=x;
    y1=y;
    y2=y+l;
    len=l;
  }
  
  void create()
  {
    pushMatrix(); 
    translate(x1,y1);
    rotate(PI/2-(atan((y1-mouseY)/(mouseX-x1))));
    strokeWeight(2);
    stroke(25,90,100);
    line(0,0,0,len);
    popMatrix();
  }
}
    
stick[][] myStick;
void setup() {
  size(1000,1000);
  smooth();
  myStick = new stick[100][100];
  for (int i = 0; i < 100; i++) {
    for (int j = 0; j < 100; j++) {
      // Initialize each object
      myStick[i][j] = new stick(30*i+15,30*j,20);
    }
  }
}

void draw() {
  background(225,100,30);
   
  for (int i = 0; i < 100; i++) {
    for (int j = 0; j < 100; j++) {
      
     
      myStick[i][j].create();
      }
  }
}



