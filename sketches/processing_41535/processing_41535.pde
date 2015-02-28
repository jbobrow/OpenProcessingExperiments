
ArrayList particles = new ArrayList();

void setup(){
  size(700,400);
  smooth();
  cursor(CROSS);
  frameRate(50); 
  
}
void draw(){

  
   
    for (int k = 0; k < 20; k++){
       particles.add(new Particle(350,-500));
    }
 
 
    for (int i = 0; i < particles.size(); i++){
    Particle p = (Particle)particles.get(i);
    

    p.update();
    p.rain();
     
  }
}


class Particle{

 float x,y;
 float xSpeed,ySpeed; 
 float gravity;
 
 float bounce;


   Particle(float inX, float inY){

   x = inX;
   y = inY;
 
   gravity = 1;
   bounce = -0.18;
   
//Positions released   
  xSpeed = random(-10,10);
  ySpeed = random(-15,15);
 
 }
 
void update(){
   
   ySpeed += gravity;
   
   x += xSpeed;
   y += ySpeed;

 

  
  if((y >= height + 10)&&(ySpeed > 0)){
    ySpeed *= bounce;
  
  }
 }
 
void rain(){
   
 
  fill(255);
  point(x,y);
  
 }
}

