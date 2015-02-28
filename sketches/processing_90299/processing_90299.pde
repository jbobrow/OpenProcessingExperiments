
/* @pjs preload="spaceship.png"; */
 
float score=0.0;
PImage spaceship;
PImage explosion;
float prevx;
float prevy;
float[] astx = new float[10];
float[] asty = new float[10];


void setup(){
  size(1000,1000);
  background(0,0,0);
  smooth();
  explosion=loadImage("explosion.jpg");
  spaceship=loadImage("spaceship.png");
  for (int i = 0; i < 10; i++) {
    astx[i] = random(0, 1000);
    asty[i] = random(-300, -30);
  }
}
  
  
  void draw(){
    background(0);
    for (int i =0; i < 10; i++) {
      asteroid(astx[i], asty[i]);
      asty[i] += 7.0;
      if (asty[i] > height) {
        asty[i] = -30;
      }
      if(mouseX==astx[i]||mouseY==asty[i]){
       score=-1.0;
       }
}
if(score==-1.0){
image(explosion,mouseX-50,mouseY-50,100,100);}
image(spaceship,mouseX,mouseY,30,30);
  }
 
  
  void asteroid(float x, float y){
   fill(121,61,0);
   ellipse(x,y,100,100);
  }
  
    
    
    


