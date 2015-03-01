
float delta = 8;
float  X1, Y1 =0;



 
void setup()
{
  size(600,800, P3D);
  smooth();
}
 
void draw()
{
  background(90,45,30);
  directionalLight(100, 60, 40, 300, 200, -100);
  ambientLight(100, 100, 100);
 
  rotateX(81);
  //rotateY(X1);
   
  //Y1 += 0.002;
  //X1 += 0.002;

  translate(width/2, 800-mouseY, 0);
    
  drawOreo();
  
  translate(0, height/2, 0);
  if(mouseY<=600)
    drawSphere(600-mouseY,0,0,0);
  else
    drawSphere(0,0,0,0);
   
 
    lights();

 
}
void drawOreo(){
   fill(255);
   noStroke();
   box(20,140,90);
   translate(-20, 0, 0);
   fill(0);
   noStroke();
   box(20,160,100);  
   translate(40, 0, 0);
   fill(0);
   noStroke();
   box(20,160,100);  
   translate(-20, 0, 0);
} 


void drawSphere(float r, float X, float Y, float Z)
{
   strokeWeight(18);
   stroke(255); 
  for(float deg=0; deg<360; deg += delta)
  {
      float theta = radians(deg);
        
      for(float deg2 = 0; deg2 < (360 - mouseY); deg2 += delta){     
        stroke(180, 130, 100);       
        float phi = radians(deg2);
        float x = r * sin(phi) * cos(theta);
        float y = r * sin(phi) * sin(theta);
        float z = r * cos(phi);
        point(x+X,y+Y,z+Z);
      }
    }
}

