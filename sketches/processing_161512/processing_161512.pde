
PFont font;
ArrayList<Paint> paintParticles;
ArrayList<Clearings> clearings;
int count = 0;

void setup(){
  font = createFont("Arial", 88, false);
  size(400,400);
  background(0);
  colorMode(HSB);
  fill(255);
  noSmooth();
  textFont(font, 88);
  textAlign(CENTER);
  text("Paint", width/2,height/2 + 8);
  loadPixels();
  paintParticles = new ArrayList<Paint>();
  clearings = new ArrayList<Clearings>();
  frameRate(30);
  loadPixels();
}

void draw(){
  if(clearings.isEmpty() == false){
    for(int i=0; i < clearings.size(); i++){
      Clearings particle = clearings.get(i);
      particle.update();
      if(particle.y > height){
        clearings.remove(i);
      }
      else{
        particle.display();
      }
    }
    if(clearings.isEmpty()){
      loadPixels();
    }
  }

  if(paintParticles.isEmpty() == false){
    // update loop for text first due to updatePixels()
    for(int i=0; i < paintParticles.size(); i++){
      Paint particle = paintParticles.get(i);
      particle.update();
      if(particle.y > height){
        paintParticles.remove(i);
      }
      else{
        particle.collision();
      }
    }
    //draw paint particles after updatePixels()
    for(int i=0; i < paintParticles.size(); i++){
      Paint particle = paintParticles.get(i);
      particle.display();
    }
  }
  if(mousePressed && clearings.isEmpty()){
    paintParticles.add(new Paint(random(mouseX-2,mouseX+2),random(mouseY-2,mouseY+2)));
  }
}
void keyPressed(){
  if(key == 'r' && mousePressed == false && clearings.isEmpty()){
    paintParticles.clear();
    loadPixels();
    for (int i = 0; i < (width*height); i++) {
      if(pixels[i] != color(0)){
        clearings.add(new Clearings(i%400,ceil(i/400), pixels[i]));
        pixels[i] = color(0);        
      }
    }
    updatePixels();
  }
  if(clearings.isEmpty() && mousePressed == false){
    background(0);
    text("Paint", width/2,height/2 + 8);
    loadPixels();
  }
}


class Clearings {
  float x, y;
  int count = 0;
  color colour = (255);
  float yVelocity;
  int i = 0;
  int target;
  boolean fallen;
  
  Clearings(float x_, float y_, color colour_){
    x = x_;
    y = y_;
    target = round(random(0,15));
    yVelocity = 0;
    colour = colour_;
  }
  
  void display(){
    stroke(colour);
    point(x, y);
  }
  
  void update(){
   stroke(0);
   point(x, y);
   if(i==target){
     fallen = true;
     count = 0;
   }
   y += yVelocity;
   if(count%5 == 0 && fallen == true){
     yVelocity += 1;
   }       
  count ++;
  i++;  
  }
  
}

class Paint {
  float x, y;
  color colour = color((2*mouseY)%255,255,255);
  float yVelocity;
  
  Paint(float x_, float y_){
    x = x_;
    y = y_;
    yVelocity = 5;
  }
  
  void display(){
    stroke(colour);
    point(x, y);
  }
  
  void update(){
   stroke(0,0,0);
   point(x, y);
   y += yVelocity;      
  }
  
  void collision(){
    //begins with bounding box for text
    if(x > width/2 - 102 && x < width/2 + 102 && y < height/2 + 20 && y > height/2 - 70){
      for(int i = floor(y); i > y - 5; i--){
        if(pixels[i*width+round(x)] != color(0)){
          pixels[i*width+round(x)] = colour;
        }
      }
      updatePixels();
    }   
  }

  
}



