
import processing.opengl.*;

int numOfMetabs = 10;
Metab[] metabs = new Metab[numOfMetabs];
String[] colorElements = {"RED","GREEN","BLUE"};
int colorIndex = 0;

void setup(){
  size(450,450,P2D);
  frameRate(30);
  for(int i = 0;i < numOfMetabs;i++){
    metabs[i] = new Metab((int)random(width),(int)random(height),metabs);
  }
}

void draw(){
  loadPixels();
  for(int x = 0;x < width-1;x++){
    for(int y = 0;y < height-1;y++){
      int d = 0;
      for(int i = 0;i < metabs.length;i++){
        d += metabs[i].getDencity(x,y);
      }
      pixels[x+y*width] = color(0,0,d,0);
    }
  }
  updatePixels();
  for(int i = 0;i < metabs.length;i++){
    metabs[i].update();
  }
}

void mouseMoved(){
  metabs[0].setPosition(mouseX,mouseY);
}

void keyPressed(){
  if(key == 's'){
    save("screenshot.png");
  }
  else if(key == ' '){
    colorIndex++;
    colorIndex %= colorElements.length;
  }
  else if(key == 'f'){
    for(int i = 0;i < metabs.length;i++){
      metabs[i].switchGravityFlag();
    }
  }
}

class Metab{
  PVector position = new PVector();
  PVector velocity = new PVector(random(-5,5),random(-5,5));
  PVector acceleration = new PVector(0,0);
  
  float maxDist = dist(0,0,width,height);
  float radiusRatio = random(2,4);
  
  float dragForce = 0.7;
  float dragCoff = 0.8;
  
  Metab[] metabs;
  boolean gravityFlag = true;
  
  Metab(int x, int y){
    this.position.x = x;
    this.position.y = y;
  }
  
  Metab(int x, int y, Metab[] metabs){
    this.position.x = x;
    this.position.y = y;
    
    this.metabs = metabs;
  }
  
  float getDencity(int x, int y){
    return this.radiusRatio*(this.maxDist)/(dist(this.position.x,this.position.y,x,y)+1);
  }
  
  color getColorDencity(int x, int y, String colorElement){
    float d = getDencity(x,y);
    if(colorElement == "RED"){
      return color(d,0,0,0);
    }
    else if(colorElement == "GREEN"){
      return color(0,d,0,0);
    }
    else if(colorElement == "BLUE"){
      return color(0,0,d,0);
    }
    return color(0,0,0,d);
  }
  
  void setPosition(int x, int y){
    this.position.x = x;
    this.position.y = y;
  }
  
  PVector getPosition(){
    return this.position;
  }
  
  void setVelocity(int vx, int vy){
    this.velocity.x = vx;
    this.velocity.y = vy;
  }
  
  float getRadiusRatio(){
    return this.radiusRatio;
  }
  
  void switchGravityFlag(){
    this.gravityFlag = !this.gravityFlag;
    if(this.gravityFlag){
      this.setDragForce(0.7);
    }
    else{
      this.setDragForce(0.95);
    }
  }
  
  void setDragForce(float dragForce){
    this.dragForce = dragForce;
  }
  
  void update(){
    if(metabs != null && this.gravityFlag){
      for(int i = 0;i < this.metabs.length;i++){
        Metab metab = this.metabs[i];
        float d = PVector.dist(this.position,metab.getPosition())+1;
        PVector force = PVector.div(PVector.sub(this.position,metab.getPosition()),d);
        this.acceleration.sub(force);
      }
    }
    
    this.velocity.add(this.acceleration);
    this.position.add(this.velocity);
    
    this.acceleration.mult(this.dragCoff);
    this.velocity.mult(this.dragForce);
    
    if(this.position.x < 0 || width < this.position.x){
      this.velocity.x *= -1;
    }
    if(this.position.y < 0 || height < this.position.y){
      this.velocity.y *= -1;
    }
  }
}


