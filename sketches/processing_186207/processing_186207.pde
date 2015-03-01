
ArrayList<Ball> balls = new ArrayList<Ball>();
void setup(){
  size(1200,1000);
  mouseX = width/2;
  mouseY = height/2;
}
void draw(){
  background(255,255,255);
   
   for(int i =0; i < balls.size();i++) {
    Ball m = (Ball) balls.get(i);
    m.run();}
    if(mousePressed){
      if(frameCount%1 == 0){
     //   x,y,rad,xvel,yvel,xaccel,yaccel,mass
  Ball b = new Ball(mouseX,mouseY,12,0,0,0,0,2);
    balls.add(b);
    }
}
}
void mouseMoved() {
   if(mousePressed){
      if(frameCount%1 == 0){
     //   x,y,rad,xvel,yvel,xaccel,yaccel,mass
  Ball b = new Ball(mouseX,mouseY,5,0,0,0,0,0.001);
    balls.add(b);
    }
}
}

class Ball {
  PVector velocity;
  PVector acceleration;
  PVector position;
  PVector momentum;
  float radius, m;
  float absorbtion = 0.4;
  PVector myColor;
  PVector newVelocity;
  Ball(float x, float y, float rad, float xvel, float yvel, 
  float xaccel, float yaccel, float _mass) {
    position = new PVector(x, y);
    velocity = new PVector(xvel, yvel);
    acceleration = new PVector(xaccel, yaccel);
    myColor = new PVector(255, 255, 255);
    m = _mass;
    radius = rad;
  }
  void run() {
     move();
checkCollision();
    
    collisions();
    
    display();
    wallCollisions();
  
  }
  void display() {
    fill(myColor.x, myColor.y, myColor.z);
    ellipseMode(RADIUS);
    ellipse(position.x, position.y, radius, radius);
  }
  void move() {
    position.add(velocity);
    velocity.add(acceleration);
    balls.get(0).position.add(balls.get(0).velocity);
    balls.get(0).velocity.add(balls.get(0).acceleration);
    balls.get(0).myColor = new PVector(0,0,0);
    for(int i = 1; i < balls.size(); i++){
    balls.get(i).position.add(balls.get(i).velocity);
    balls.get(i).velocity.add(balls.get(i).acceleration);
    balls.get(i).myColor = new PVector( random((i%255)-90,i+10), random((i%255),(i%255)), (i%255) * 4);
    }
  }
  void wallCollisions() {
    if (position.x + radius > width && velocity.x > 0)
    {
      velocity.x *= -absorbtion;
      position.x = width - radius;
    }
    if (position.x - radius < 0 && velocity.x < 0)
    {
      velocity.x *= -absorbtion;
      position.x = radius;
    }
    if (position.y + radius > height && velocity.y > 0)
    {
      velocity.y *= -absorbtion;
      position.y = height - radius;
    }
    if (position.y - radius < 0 && velocity.y < 0)
    {
      velocity.y *= -absorbtion;
      position.y = radius;
    }
  }
  void collisions() {
    for (int i = 0; i < balls.size (); i++) {

  PVector dir = PVector.sub(position,balls.get(i).position);
      
      float distance = dir.mag();
      
      
      if (distance < radius + balls.get(i).radius && (distance) > 0 ) {
        float overlap = distance-(radius + balls.get(i).radius);
        dir.setMag(overlap/2);
        position.sub(dir);
        balls.get(i).position.add(dir);
      }
      if(distance> radius +balls.get(i).radius){
      dir.setMag((m*balls.get(i).m)/sq(distance));
      acceleration = dir;
      balls.get(i).acceleration = dir;
      }
  }
}
    void checkCollision() {
  for(int i = 0; i < balls.size(); i++){
  
    PVector bVect = PVector.sub(balls.get(i).position, position);

    
    float bVectMag = bVect.mag();

    if (bVectMag < radius + balls.get(i).radius) {
   
      float theta  = bVect.heading();
    
      float sine = sin(theta);
      float cosine = cos(theta);

      PVector[] bTemp = {
        new PVector(), new PVector()
        };

        bTemp[1].x  = cosine * bVect.x + sine * bVect.y;
      bTemp[1].y  = cosine * bVect.y - sine * bVect.x;

      PVector[] vTemp = {
        new PVector(), new PVector()
        };

        vTemp[0].x  = cosine * (velocity.x/2) + sine * (velocity.y/2);
      vTemp[0].y  = cosine * (velocity.y/2) - sine * (velocity.x/2);
      vTemp[1].x  = cosine * (balls.get(i).velocity.x/2) + sine * (balls.get(i).velocity.y/2);
      vTemp[1].y  = cosine * (balls.get(i).velocity.y/2) - sine * (balls.get(i).velocity.x/2);

      PVector[] vFinal = {  
        new PVector(), new PVector()
        };

      vFinal[0].x =  ((m - balls.get(i).m) * vTemp[0].x + 2 * balls.get(i).m * vTemp[1].x) / (m + balls.get(i).m);
      vFinal[0].y =  vTemp[0].y;

      
      vFinal[1].x = ((balls.get(i).m - m) * vTemp[1].x + 2 * m * vTemp[0].x) / (m + balls.get(i).m);
      vFinal[1].y =  vTemp[1].y;

      bTemp[0].x += vFinal[0].x;
      bTemp[1].x += vFinal[1].x;

      PVector[] bFinal = { 
        new PVector(), new PVector()
        };

      bFinal[0].x = (cosine * bTemp[0].x - sine * bTemp[0].y);
      bFinal[0].y = (cosine * bTemp[0].y + sine * bTemp[0].x);
      bFinal[1].x = (cosine * bTemp[1].x - sine * bTemp[1].y);
      bFinal[1].y = (cosine * bTemp[1].y + sine * bTemp[1].x);

      balls.get(i).position.x = position.x + bFinal[1].x;
      balls.get(i).position.y = position.y + bFinal[1].y;

      position.add(bFinal[0]);

     
      velocity.x = cosine * vFinal[0].x - sine * vFinal[0].y;
      velocity.y = cosine * vFinal[0].y + sine * vFinal[0].x;
      balls.get(i).velocity.x = cosine * vFinal[1].x - sine * vFinal[1].y;
      balls.get(i).velocity.y = cosine * vFinal[1].y + sine * vFinal[1].x;
    }
  }
    }
} 

