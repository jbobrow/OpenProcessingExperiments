
PFont font;
ArrayList<Particle> particles;
int count = 0;

void setup(){
  font = createFont("Arial", 64, true);
  size(400,400);
  background(0);
  fill(255);
  noSmooth();
  textFont(font, 64);
  textAlign(CENTER);
  text("Destroy", width/2,height/2 + 8);
  loadPixels();
  particles = new ArrayList<Particle>();
  for (int i = 0; i < (width*height); i++) {
      if(pixels[i] != color(0,0,0)){
        pixels[i] = color(0,0,0);
        particles.add(new Particle(i%400,ceil(i/400)));        
      }
    }
  updatePixels();
}

void draw(){
  if(keyPressed && key == 'r'){
    particles.clear();
    background(0);
    text("Destroy", width/2,height/2 + 8);
    loadPixels();
    particles = new ArrayList<Particle>();
    for (int i = 0; i < (width*height); i++) {
      if(pixels[i] != color(0,0,0)){
        pixels[i] = color(0,0,0);
        particles.add(new Particle(i%400,ceil(i/400)));        
      }
    }
    updatePixels();
    
  }
  for(int i=0; i < particles.size(); i++){
    Particle particle = particles.get(i);
    particle.collision();
    if(particle.touched){
      particle.update();
    }
    particle.display();
  }
}

class Particle {
  float x, y;
  int count = 0;
  float velocity, distX, distY;
  float theta;
  color colour = (255);
  float xVelocity;
  float yVelocity;
  boolean touched;
  
  Particle(float x_, float y_){
    x = x_;
    y = y_;
    velocity = 5;
    touched = false;
  }
  
  void display(){
    stroke(colour);
    point(x, y);
  }
  
  void update(){
   stroke(0,0,0);
   point(x, y);
   x += xVelocity;
   y += yVelocity;
   if(x<4 && xVelocity < 0){
     x = round(random(5,10));
     xVelocity = -1*xVelocity/6;
   }
   else if(x> width -5 && xVelocity > 0){
     xVelocity = -1*xVelocity/4;
   }
   if(round(xVelocity) ==0){
     xVelocity = 0;
   }
   if(y<4){
     y = 5;
     yVelocity = -1*yVelocity/4;
   }
   else if(y<height -5){
     if(count%5 == 0){
       yVelocity += 1;
     }       
   }
   else {
     y = height - 4;
     yVelocity = -1*yVelocity/4;
     if(count%15 == 0){
       if(xVelocity > 0){
         xVelocity -= 1;
       }
       else if(xVelocity < 0){
         xVelocity += 1;
       }
     }
   }
  count ++;    
  }
  
  void collision(){
    distX = mouseX - x;
    distY = mouseY - y;
    velocity = sqrt(sq(mouseX-pmouseX)+sq(mouseY-pmouseY));
    if(velocity > 25){
      velocity = 25;
    }
    if(sq(distX/velocity)+sq(distY/velocity)<1){
      touched = true;
      theta = atan2((y - pmouseY), (x - pmouseX));
      xVelocity = velocity * cos(theta);
      yVelocity = velocity * sin(theta);
    }
  }
  
}



