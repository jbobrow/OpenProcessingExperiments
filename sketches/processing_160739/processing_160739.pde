
PFont font;
ArrayList<Particle> particles;
int count = 0;

void setup(){
  font = createFont("Arial", 32, false);
  size(400,400);
  background(0);
  fill(255);
  noSmooth();
  textFont(font, 32);
  textAlign(CENTER);
  text("Bang.", width/2,height/2+8);
  loadPixels();
  particles = new ArrayList<Particle>();
}

void draw(){
  if(keyPressed && key == 'r'){
    background(0);
    text("Bang.", width/2,height/2+8);
    loadPixels();
  }
  if(mousePressed == true){
    for (int i = 0; i < (width*height); i++) {
      if(pixels[i] != color(0,0,0)){
        pixels[i] = color(0,0,0);
        particles.add(new Particle(i%400,ceil(i/400)));        
      }
    }    
  }
  updatePixels();
  for(int i=0; i < particles.size(); i++){
    Particle particle = particles.get(i);
    particle.update();
    particle.display();
  }
}

class Particle {
  float x, y;
  int count = 0;
  float velocity;
  float theta;
  color colour = (255);
  float xVelocity;
  float yVelocity;
  
  Particle(float x_, float y_){
    x = x_;
    y = y_;
    velocity = 12;
    theta = atan2((y - mouseY), (x - mouseX));
    xVelocity = velocity * cos(theta);
    yVelocity = velocity * sin(theta);
  }
  
  void display(){
    stroke(colour);
    point(x, y);
  }
  
  void update(){
   stroke(0);
   point(x, y);
   x += xVelocity;
   y += yVelocity;
   if(x<4 && xVelocity < 0){
     x = round(random(5,10));
     xVelocity = round(-1*xVelocity/3);
   }
   else if(x> width -5 && xVelocity > 0){
     xVelocity = round(-1*xVelocity/3);
   }
   if(y<4){
     y = 5;
     yVelocity = round(-1*yVelocity/3);
   }
   else if(y<height -5){
     if(count%5 == 0){
       yVelocity += 1;
     }       
   }
   else {
     y = height - 4;
     yVelocity = floor(-1*yVelocity/3);
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
  
}
