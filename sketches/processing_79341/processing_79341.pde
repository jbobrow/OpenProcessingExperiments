
Ball[] balls = new Ball[20];

void setup()  {   
 size(400,400);  
  smooth();  
   //Initialize balls
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball();
    
 }
}   


void draw() {   
  
  background(0);  
 // Run all objects
 for (int i = 0; i < balls.length; i++) {
    balls[i].bounce();
    balls[i].display();
  }
}   




class Ball  {   

  // Two angles
  float xtheta;  
  float ytheta;
  // Increment value for both angles  
  float dxtheta;
  float dytheta;
  float s;
  

  Ball()  {   
    xtheta = 0;  
    ytheta = 0;  
    // Start randomly
    dxtheta = random(-0.05,0.05);
    dytheta = random(-0.05,0.05);
    // satrt ball size
    s =random(50);
    
  }   

  void bounce()  {
    // Increment angles   
    xtheta += dxtheta;
    ytheta += dytheta;
    // Increment ball size and restrain
    s= (s+0.5)%100;
  }   

  void display()  {   
    // Map results of sine / cosine to width and height of window
    float x = (sin(xtheta) + 1) * width/2;   
    float y = (cos(ytheta) + 1) * height/2;
    noStroke();
    fill(random(100,255),random(100,255),random(100,255));
    
    ellipse(x,y,s,s);  
  }

}   










