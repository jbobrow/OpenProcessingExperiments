
int num=60, step;
float theta, sw;
 
void setup() {
  size(500, 500);
  noFill();
}
 
 
void draw() {
  background(0);
  
  
  sw=20;
  strokeWeight(sw);
  sw = (int) map(sin(theta), -1, 1, -150, 150);



  pushMatrix();
  stroke(255,0,255);
  translate(sw,0);
  Hexagon(width/2,height/2, int(sw));
  popMatrix();
  




   
   pushMatrix();
   stroke(255,255,0);
   translate(-sw,0);
   Hexagon(width/2,height/2, int(sw));
   popMatrix();
    
    
    
    
  theta += 0.0523/2;
 
 
}



 
void Hexagon(int posX, int posY, float radius)
{

  float x, y;
 
 
  beginShape();
 
  for (int i=0;i<6;i++)
  {
    x=cos(radians(60*i))*radius+posX;
    y=sin(radians(60*i))*radius+posY;
    vertex(x, y);
  }
 
  endShape(CLOSE);
  
}

