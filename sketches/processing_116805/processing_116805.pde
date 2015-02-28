
PImage image;
String name = "Okami_wallpaper";
 
void setup() {
  size(1600, 1200);
  image = loadImage(name+".jpg");
  noStroke();
  background(255);
  frameRate(45);
  smooth();
}
 

  

int elapsedFrames = 0;
ArrayList points = new ArrayList();
boolean drawing = false;
 


 
void draw(){
    
    if (mousePressed){
  color c = image.get(mouseX, mouseY);
  
    PVector pos = new PVector();
    pos.x = mouseX;
    pos.y = mouseY;
 
    PVector vel = new PVector();
    vel.x = (0);
    vel.y = (0);
   
    Point punt = new Point(pos, vel, 250);
    points.add(punt);
    //changes the color of lines
    stroke(c,63);
  }
   
   
  for(int i = 0; i < points.size(); i++){
   Point localPoint = (Point) points.get(i);
   if(localPoint.isDead == true){
    points.remove(i);
   }
   localPoint.update();
   localPoint.draw();
  }
   
  elapsedFrames++;
}
 

 

 
void mouseReleased(){
  drawing = false;
}
 
 
 
class Point{
   
  PVector pos, vel, noiseVec;
  float noiseFloat, lifeTime, age;
  boolean isDead;
   
  public Point(PVector _pos, PVector _vel, float _lifeTime){
    pos = _pos;
    vel = _vel;
    lifeTime = _lifeTime;
    age = 0;
    isDead = false;
    noiseVec = new PVector();
  }
   
  void update(){
    noiseFloat = noise(pos.x * 0.0025, pos.y * 0.0025, elapsedFrames * 0.001);
    noiseVec.x = cos(((noiseFloat -0.3) * TWO_PI) * 10);
    noiseVec.y = sin(((noiseFloat - 0.3) * TWO_PI) * 10);
     
    vel.add(noiseVec);
    vel.div(2);
    pos.add(vel);
     
    if(1.0-(age/lifeTime) == 0){
     isDead = true;
    }
     
    if(pos.x < 0 || pos.x > width || pos.y < 0 || pos.y > height){
     isDead = true;
    }
     
    age++;   
  }
   
  void draw(){   
    fill(0,20);
    //noStroke();
    ellipse(pos.x, pos.y, 1-(age/lifeTime), 1-(age/lifeTime));
  
}
};

void keyPressed(){
  //filters
  if (key == 'b'){
    filter(BLUR); //blurry filter
  }
  if (key == 'g'){
    filter(GRAY); //shift to grayscale
  }
  if (key == 't'){
    filter(THRESHOLD); //black & white
  }
  if (key == 'e'){
    filter(ERODE); //reduce the light areas
  }
  if (key == 'd'){
    filter(DILATE); //increase the light areas
  }
   
  //Reset image
  if( key =='w'){
    background(255); //paint screen black
  }
  if( key =='z'){
    background(0); //paint screen white
  }
  if(key == 'i'){
     
     background(image); //show image
 
 
 
  }
   
  //save image
  if (key == 's'){
    saveFrame(image+".tif"); //save image as .tif
  }}


