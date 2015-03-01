
float delta = 3;
float r = 70;

void setup()
{
 size(1000,1000,P3D); 

}

void draw()
{
  background(0);
  
  translate(width/2, height/2, 0);
 rotateX(radians(mouseY));
  
  for(float z=0; z<3050; z+=2){
      
    rotateY(radians(2));
   for(float deg=0; deg<360; deg+=delta){
  float theta = radians(deg);
  float x = r*cos(theta);
  float y = r*sin(theta);
  float a = random(0,255);
float b = random(0,255);
float c = random(0,255);
strokeWeight(2);
  stroke(a,b,c);
  point(x,y,z);
   } 
  }
  
}
