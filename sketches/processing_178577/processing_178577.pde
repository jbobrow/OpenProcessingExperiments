
float counter;
ArrayList<Circle> circles = new ArrayList();
int STATE = 0;

void setup() {  //setup function called initially, only once
  size(500,500, P3D);
//  smooth(8);
  noFill();
 

}

void draw() {  //draw function loops 
  background(30);
  translate(width/2, height/2,0);
  rotateY(counter);
  counter+=0.01;
  
  if (STATE == 0)
  {
      if ((int) random(0,4) == 2){
       circles.add(new Circle(random(0, TWO_PI), random(0, TWO_PI), 200, random(0, 10)));
       
       if (circles.size() > 50)
       {
           STATE = 1;
       }
      }
  }
   //drawSphere(100);
  for (Circle c : circles)
  {
    c.draw();
    c.update();
    if (c.STATE == 1){
    c.regenerate();
    }
  }
  
  
  }
  

    void drawSphere(float radius){
  float divs = TWO_PI/12;
  
  for (float v = 0; v < TWO_PI; v+=divs){
      for (float u = 0; u < TWO_PI; u+=divs){
          float x = radius * cos(u) * sin(v);
          float y = radius * sin(u) * sin(v);
          float z = radius * cos(v);
          pushMatrix();
              translate(x,y,z);
              sphere(5);
          popMatrix();
      }
  }
  

  }
  
  class Circle{
  float u;
  float v;
  float radius;
  float parentRadius;
  int STATE = 0;
  
  public Circle(float uu, float vv, float pr, float r)
  {
    this.u = uu;
    this.v = vv;
    this.parentRadius = pr;
    this.radius = r;
  }
  
  void update()
  {
   
   if (radius < parentRadius* 0.5)
   {
     radius+=1;
   } 
   else
   {
    STATE = 1; 
   }
  }
  
  void regenerate()
  {
    u = random(0, TWO_PI);
    v = random(0, TWO_PI);
    radius = random(0, 30);
    STATE = 0;
  }
  
  void draw()
  {
    drawEllipse(u,v, parentRadius, radius);
  }
  
  
   void drawEllipse(float uu, float vv, float r, float r2){
   float x = r * cos(uu) * sin(vv);
   float y = r * sin(uu) * sin(vv);
   float z = r * cos(vv);
   
    float rho = sqrt(x*x + y*y + z*z);
    float phi = 2* acos(z/rho);
    float theta = 2* atan(y/x);
    float b = sqrt(((r * r) - (r2 * r2)));
    
  //  stroke(255,0,0);
    //    line(0,0,0, x, y, z);
        
    pushMatrix();
 //   rotateY(PI/2)
   
      //  rotateX(rho);
      
   rotateZ(theta);
   rotateY(phi);    
   stroke(0,0,255);
    stroke(0,255,0);
    translate(0,0,b);
    ellipse(0,0,r2*2,r2*2);
    popMatrix();
  }
  
}

