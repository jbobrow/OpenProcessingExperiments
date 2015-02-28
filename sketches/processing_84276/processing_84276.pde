
Balloon[] balloons = new Balloon[55];

int mouseVector = -1;

//background color and color of the balls
color ballColor = color(130);

//controls the wind
float xoff = 10000;
float yoff = 0;

void setup() {
  size(700 , 400);
  smooth();
  background(255);
  //initialize our balls
  for (int i = 0; i < balloons.length; i++) { 
    balloons[i] = new Balloon(random(50, 250.0),random(50, width - 50),random(height/2 - 10, height/2 + 10), ballColor);
  }
 }

void draw() {
  background(255);
  //for every balloon 
  for (int i = 0; i < balloons.length; i++) {
    
    //add some wind, so they blow around, mapped to perlin noise
    //PVector wind = new PVector(map(noise(xoff),0,1,-4,4),map(noise(yoff),0,1,-1,1));
    PVector wind = new PVector(map(noise(xoff),0,1,-16,16),map(noise(yoff),0,1,-8,8));
    balloons[i].applyForces(wind);
    
    //interact with the mouse
    balloons[i].mouseAction();
    
    //go towards the sine wave
    PVector center = new PVector(balloons[i].location.x,  height/2 + (60 * sin(balloons[i].location.x/90)));
    center.sub(balloons[i].location);
    center.normalize();
    center.mult(3);
    balloons[i].applyForces(center);
    
    //update the location, check to see if they are over the edge, display!
    balloons[i].update();
    balloons[i].checkEdges();
    balloons[i].display();

    //draw lines connecting the ball to near ones
    for (int j = 0; j < balloons.length; j++) {
     balloons[i].drawLine(balloons[j]); 
    }

  }

  
  //update our perlin noise-controlling variables
  xoff += 0.004;
  yoff += 0.006;
  

}


class Balloon{
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float topspeed = 1.4;
  float size;
  color balloonColor;
  float angle, aVelocity, aAcceleration;
  
  //construct our balloons
  Balloon(float tempM, float tempX, float tempY, color tempFillColor) {
    location = new PVector(tempX,tempY);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    mass = tempM;
    size = tempM/8;
    balloonColor = tempFillColor;
    angle = 0;
    aVelocity = 0;
    aAcceleration = 0;
  }
  
  //generic add force function (so handy!)
  void applyForces(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }
  
  //motion 101
  void update() {
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
   
    aAcceleration = acceleration.x / 10.0;
    aVelocity += aAcceleration;
    aVelocity = constrain(aVelocity, -0.04,.04);
    angle += aVelocity;
    
    acceleration.mult(0);
  }
  
  void display() {
    fill(balloonColor, 160);
    stroke(20);
    strokeWeight(.5);
    ellipseMode(CENTER);
    pushMatrix();
    translate(location.x,location.y);
    
    ellipse(0, 0, size, size);
    ellipse(0, 0, size/10, size/10);
    
    popMatrix();
  }
  
  void checkEdges() {
   
    if (location.x < 0) {
      location.x = width; 
    } else if (location.x > width) {
      location.x = 0; 
    }
    
    if (location.y < size/2) {
      location.y = size/2;
      velocity.y *= -.75; 
    } else if (location.y > height - size/2) {
      location.y = height - size/2;
      velocity.y *= -.75;  
    }
  }
  
  
  void mouseAction() {
    PVector mouse = new PVector(mouseX, mouseY);
    mouse.sub(location);
    float distance = mouse.mag();
    if (distance < 80 && distance > 20) {
      //change the number here for the gravitational constant
      float G = -.8;
      float grav = (G * mass) / (distance * distance);
      mouse.normalize();
      mouse.mult(grav);
      acceleration.add(mouse);
    }
  }
  
  void drawLine(Balloon b) {
    
    stroke(0);
    strokeWeight(1);
    PVector lineVector = PVector.sub(location,b.location);
    float test = lineVector.mag();
    
    if (test < 50){
      line(location.x,location.y,b.location.x,b.location.y);
    }
    
  }  
}




