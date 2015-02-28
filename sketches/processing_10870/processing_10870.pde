
class BounceBall{
  float X,Y;
  float Spx,Spy;
  boolean OnDrag = false;
  color ball_color;
  float radius;
  int id;
  float distanceX = 0;
  float distanceY = 0;
 // BounceBall[] others;
  
  //ground
  float x1 = 0;
  float y1 = height-50;
  float x2 = width ;
  float y2 = height-20 ;
  float groundX = (x1 + x2) /2;
  float groundY = (y1 + y2) /2;
  float len;
  float rot;
  
//********************************construcor********************************************
  BounceBall(float _X,float _Y,float _Spx,float _Spy,float _radius,color _ball_color,int _id,BounceBall[] _others) {
    X      = _X;
    Y      = _Y;
    Spx    = _Spx;
    Spy    = _Spy;
    radius = _radius;
    ball_color = _ball_color;
    id = _id;
   // others = _others;
    
  }
//**************************************************************************************
 public void draw(){
    if(OnDrag) {
      X = mouseX - distanceX;
      Y = mouseY - distanceY;
      Spx = mouseX - pmouseX;
      Spy = mouseY - pmouseY;
      
    }else{
      Spy += GRAVITY;
      X += Spx;
      Y += Spy;
      this.bounce();
      this.checkGroundCollision();
    }
    noStroke();
    fill(ball_color);
    ellipse(X,Y,radius*2,radius*2);
    
    noStroke();
    fill(20);
    beginShape(); 
    vertex(x1,y1); 
    vertex(x2,y2); 
    vertex(x2,height); 
    vertex(x1,height); 
    endShape(CLOSE);
  }

  //**************************************************************************************
public void collide() {
    for (int i = id + 1; i < ballTotal; i++) {
      float dx = balls[i].X - X;
      float dy = balls[i].Y - Y;
      float distance2 = sqrt(dx*dx + dy*dy);
      float minDist = balls[i].radius + radius;
      if (distance2 < minDist) { 
        float angle = atan2(dy, dx);
        float targetX = X + cos(angle) * minDist;
        float targetY = Y + sin(angle) * minDist;
        float ax = (targetX - balls[i].X) * FRICTION;
        float ay = (targetY - balls[i].Y) * FRICTION;
        Spx -= ax;
        Spy -= ay;
        balls[i].Spx += ax;
        balls[i].Spy += ay;
        
        if(abs(ax) < 0.55){
          Spx = 0;
        }
        if(abs(ay) < 0.55){
          Spy = 0;
        }
        
      }
    }   
  }
  //**************************************************************************************
 public void bounce(){
    float bounceMinX = radius;
    float bounceMaxX = width - radius;

    float bounceMinY = radius;
    float bounceMaxY = height -radius;

    if(X < bounceMinX || X > bounceMaxX ){
      Spx = -Spx * FRICTION;
      if(abs(Spx) < 1){ Spx = 0;}

      if(X < bounceMinX) X = bounceMinX - (X-bounceMinX);
      if(X > bounceMaxX) X = bounceMaxX - (X-bounceMaxX);
    }
    if(Y > bounceMaxY || Y < bounceMinY){
      Spy = -Spy * FRICTION;
      if(abs(Spy) < GRAVITY){ Spy = 0;}
      //if(Spy == 0){GRAVITY = 0;}
      
      if(Y < bounceMinY) Y = bounceMinY - (Y-bounceMinY);
      if(Y > bounceMaxY) Y = bounceMaxY - (Y - bounceMaxY);
    }
  }

//**************************************************************************************
void checkGroundCollision(){
  
  len = dist(x1, y1, x2, y2); 
  rot = atan2((y2-y1),(x2-x1));
  
  float deltaX = X - groundX; 
  float deltaY = Y - groundY;

  float cosine = cos(rot); 
  float sine = sin(rot); 

  float groundXTemp = cosine * deltaX + sine * deltaY; 
  float groundYTemp = cosine * deltaY - sine * deltaX; 
  float velocityXTemp = cosine * Spx + sine * Spy; 
  float velocityYTemp = cosine * Spy - sine * Spx; 

  if(groundYTemp > -radius){
    velocityYTemp *= -1; 
    groundYTemp= -radius; 
    velocityYTemp *=FRICTION;  
} 
  deltaX = cosine * groundXTemp - sine * groundYTemp; 
  deltaY = cosine * groundYTemp + sine*groundXTemp; 
  Spx = cosine * velocityXTemp - sine * velocityYTemp; 
  Spy = cosine*velocityYTemp + sine * velocityXTemp;
  X = groundX + deltaX; 
  Y = groundY + deltaY; 
}
//**************************************************************************************

//**************************************************************************************
 public void dragOffset(){
      distanceX = mouseX - X;  //itino keisan
      distanceY = mouseY - Y;

      OnDrag = true;
  }

//**************************************************************************************
  void undragOffset(){
      distanceX = 0;  //itino keisan
      distanceY = 0;  
  
      OnDrag = false;
  }

//**************************************************************************************


}


