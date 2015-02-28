
/* credit: Ren Bettendorf */
class Box
{
    float x;
    float y;
    float dx;
    float dy;
    float wid;
    float hei;
    float r,g,b, opac;
    
    Box(float xpos, float ypos, float xVel, float yVel, float w, float h)
    {
       x = xpos;
       y = ypos;
       dx = xVel;
       dy = yVel;
       wid = w;
       hei = h;
       r = 0;
       g = 0;
       b = 0;
       opac = 0;
       
    }
    float getX(){
      return x;
    }
    
    float getY(){
      return y;  
    }
    
    float getRad(){
      return wid/2;  
    }
    
    void oppDir(){
      dx *= -1;
      dy *= -1;  
    }
    
    void update()
    {
      fill(r,g,b,opac);
      ellipse(x,y,wid,hei);
      
      x += dx;
      y += dy;
      
      if ( x < 0 || x > width )
      {
        dx = -1 * dx;  
      }
      if ( y < 0 || y > height )
      {
        dy = -1 * dy;  
      }
  }
  
  void changeColor(){
    //Change color of ball 
    /*HINT: Create a variable for R,G,B and store random values*/
    r = random(255);
    g = random(255);
    b = random(255);
  }
  
  void changeOpac(){
     //Change opacity of ball
     opac = random(100);
  }

}
boolean isColliding(
      float cX1,
      float cY1,
      float rad1,
      float cX2,
      float cY2,
      float rad2)
{
    float circleDistanceX = abs(cX1 - cX2 - rad2);
    float circleDistanceY = abs(cY1 - cY2 - rad2);
 
    if (circleDistanceX > (rad1 + rad2)) { return false; }
    if (circleDistanceY > (rad1 + rad2)) { return false; }
 
    if (circleDistanceX <= (rad2)) { return true; }
    if (circleDistanceY <= (rad2)) { return true; }
 
    float cornerDistance_sq = pow(circleDistanceX - rad2, 2) +
                         pow(circleDistanceY - rad2, 2);
 
    return (cornerDistance_sq <= pow(rad1,2));
}
int numCir = 10;
Box[] myBox = new Box[numCir];

void setup(){
    size(500,500);
    //frameRate(20);
    background(255);
    for( int i = 0; i < numCir; i++ ){
       Box cube = new Box(random(width),random(height),random(15),random(15),15,15);
       myBox[i] = cube;   
    } 
}

void draw(){
    background(255);
    for( int i = 0; i < numCir-1; i++)   
    {
        for (int j = i+1; j<numCir;j++){
          Box cir1 = myBox[i];
          Box cir2 = myBox[j];
          if (isColliding(cir1.getX(),cir1.getY(),cir1.getRad(),cir2.getX(),cir2.getY(),cir2.getRad())){
            cir1.oppDir();
            cir2.oppDir();  
          }
             
        }
    }
    
    for ( int i = 0; i < numCir; i++){
       myBox[i].update(); 
    }
    
    if (mousePressed == true)
      myBox[(int)random(numCir)].changeColor();
      
    if (keyPressed == true && key == 'a')
      myBox[(int)random(numCir)].changeOpac();
}
