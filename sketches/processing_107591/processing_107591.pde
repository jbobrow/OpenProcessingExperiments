
// Mangueira colorida
// Inspirado nos aprendizados do livro Nature of Code
// Use as teclas w,a,s,d para movimentar o emissor
// qualquer dúvida entre em contato rafaelgcrespo@gmail.com


Cannon cannon;
boolean isPressed = false;
char keyValue;


void setup() {
  
  size(1024,768);
  cannon = new Cannon(int(random(width)),int(random(height)));
  smooth();
  
}

void draw() {
  
  pushStyle();
  fill(255,255,255,30);
  rect(0,0,width,height);
  popStyle();
  
  
  cannon.update();
  cannon.display();
  
  if(keyPressed==true) {
    cannon.walk(key);
  }
  
  if(mouseX>0 && mouseY>0){
  cannon.shoot();
  }
  
}


void keyPressed() {
 isPressed = true;
 keyValue = key;
  
}
void keyReleased() {
 isPressed = false;
}
 
  

class Bullet {
  
  PVector location = new PVector();
  PVector direction = new PVector();
  PVector acceleration = new PVector();
  PVector stick = new PVector();
  int bulletWidth = int(random(30,40));
  int bulletHeight = int(random(10,20));
  float mass = bulletWidth/2;
  float bulletSpeed;
  float angle;
  boolean rightEdge = true;
  boolean leftEdge = false;
  boolean topEdge = false;
  boolean bottomEdge = true;
  int redColor = int(map(mouseX,0,width,0,255));
  int greenColor = int(map(mouseY,0,height,0,255));
 
  
  
  Bullet(PVector bulletLocation, PVector bulletDirection, PVector stickStart, float rotateAngle ) {
    
    location = bulletLocation.get();
    direction = bulletDirection.get();
    PVector mouse = new PVector(mouseX,mouseY);
    PVector distanceVector = PVector.sub(mouse,location);
    float distance = distanceVector.mag();
    bulletSpeed = distance/random(16,18);
    angle = rotateAngle;
    stick = stickStart.get();

    
  }
  
  void applyForce(PVector force) {
    
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
    
  }
  
  void update() {

    direction.normalize();
    direction.mult(bulletSpeed);
    direction.add(acceleration);
    location.add(direction);
    acceleration.mult(0);

  }
  
  
  void display() {
    float headTo = atan2(direction.y,direction.x);
    pushStyle();
    noStroke();
    fill(redColor,greenColor,255,40);
    pushMatrix();
    translate(location.x,location.y);
    //rotate(angle);
    rotate(headTo);
    ellipse(0,0,bulletWidth,bulletHeight);
    popMatrix();
    popStyle();
    
  }
  
  void checkEdges() {
    
    if (location.x > width && rightEdge) {
      location.x = width;
      direction.x *= -1;
    } else if (location.x < 0 && leftEdge) {
      location.x = 0;
      direction.x *= -1;
    }

    if (location.y > height && bottomEdge) {
      location.y = height;
      direction.y *= -1;
    }  else if (location.y < 0 && topEdge) {
      location.y = 0;
      direction.y *= -1;
    }
  }
  
  
}
class Cannon {
  
  float angle;
  PVector location;
  PVector direction;
  int baseWidth = 50;
  int baseHeight = 50;
  int stickWidth = 30;
  int stickHeight = 10;
  PVector stick = new PVector(0+baseHeight/2, 0-stickWidth/2);
  Bullet[] bullet = new Bullet[500];
  boolean shooted = false;
  int b = 0;
  int b_ = 0;
  boolean maxBullet = false;
  PVector locationBullet;
  float speedChar = 10;
  PVector upMov = new PVector(0,-1*speedChar);
  PVector downMov = new PVector(0,1*speedChar);
  PVector leftMov = new PVector(-1*speedChar,0);
  PVector rightMov = new PVector(1*speedChar,0);
  PVector wind = new PVector(0.002,0);
  PVector gravity = new PVector(0,4);
  

  
  
  Cannon(int cannonX, int cannonY) {
    
    location = new PVector(cannonX, cannonY);
    
  }
  
  
  
  void update() {
    
    if(mouseX > 0 && mouseY > 0) {
      PVector mouse = new PVector(mouseX,mouseY);
      direction = PVector.sub(mouse,location);
      angle = atan2(direction.y,direction.x);
    }
    
   
    
    if(shooted) {
      
      for(int i=0; i<b_;i++){
        
        
        
        bullet[i].update();
         float c = 0.1; 
        PVector friction = bullet[i].direction.get(); 
        friction.mult(-1);
        friction.normalize();
        friction.mult(c); 
        bullet[i].applyForce(friction); 
        bullet[i].checkEdges();
        bullet[i].applyForce(wind);
        bullet[i].applyForce(gravity);
       
        
        bullet[i].display();
      }
    }

  }
  
  
  void display() {
    
    fill(190);
    stroke(0);
    strokeWeight(2);
    noStroke();
    pushMatrix();
    translate(location.x,location.y);
    ellipse(0,0,baseWidth,baseHeight);
    rotate(angle);
    rect(stick.x, stick.y ,stickHeight, stickWidth);
    popMatrix();
    
  }
  
  void shoot() {
    
    shooted = true;
    if(b < bullet.length) {
      
      bullet[b] = new Bullet(location, direction, stick, angle);
      b++;
      
      if(!maxBullet){
        
      b_++;
      
      }
    }
    
    else { 
      
      b = 0;
      bullet[b] = new Bullet(location, direction, stick, angle);
      
      b++;
      b_ = bullet.length;
      maxBullet = true;
      
    }

  }
  
  void walk(char keyValue_) {
    

    
    if(keyValue_ == 'w') {
      
      location.add(upMov);
      
    }
    
    if(keyValue_ == 's') {
      
      location.add(downMov);
      
    }
    
    if(keyValue_ == 'a') {
      
      location.add(leftMov);
      
    }
    
    if(keyValue_ == 'd') {
      
      location.add(rightMov);
      
    }
    
    
    
  }
  
  

}


