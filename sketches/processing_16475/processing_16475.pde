
class Car{
  float speed, posX, posY, w, h, angle, redc, greenc, bluec, vx, vy;
  float[] coords = new float[2];
  float speedometer;
  int direction;
  
  Car(float x, float y, float s, int[] carcolor){
   //POSITIONS
   posX = x;
   posY = y;

   //COLORS
   redc = carcolor[0];
   greenc = carcolor[1];
   bluec = carcolor[2];
   
   //SIZE
   w = 30;
   h = 10;
   
   //MOVEMENT SETTINGS
   speed = s;
   angle = radians(0);
   vx = 0;
   vy = 0;
  }
  
  void display(){
    //render settings related
    smooth();
    rectMode(CENTER);
    
    //movement related
    translate(posX,posY);
    rotate(angle);
    
    //color related
    fill(redc, greenc, bluec);
    stroke(100,100,100);
    
    //shape related
    rect(0, 0, w, h);
    
    //DRAWS ARROW THAT INDICATES FRONT OF THE CAR
    stroke(0,0,0,40);
    line(0, 0, 120, 0);
    stroke(0,0,255);
    line(0, 0, 30, 0);
    line(30, 0, 25, 5);
    line(30, 0, 25, -5);
  }
  
  //MOVEMENT FUNCTIONS
  void forward(){
    direction = 1;
    velocity();
  }
  
  void backward(){
    direction = -1;
    velocity();
    this.inertia();
  }
  
  void velocity(){
    float ax = cos(angle) * speed;
    float ay = sin(angle) * speed;
    vx += ax*direction;
    vy += ay*direction;
    move();
    vx=0;
    vy=0;
  }
  
  void inertia(){
   //CODE INERTIA HERE
  }
  
  void left(){ 
    angle -= radians(5);
  }
  
  void right(){ 
    angle += radians(5);
  }
  
  void move() {
      posX += vx;
      posY += vy;
      
      if(posX>width) {
        posX=0;
      }
      else if(posX<0){
        posX = width; 
      }
      
      if(posY>height) {
        posY=0; 
      }
      else if(posY<0){
        posY= height; 
      }
  }
  
  float[] getCoords(){
    coords[0] = posX;
    coords[1] = posY; 
    return coords;
  }
  
  float getSpeed(){
    speedometer = speed;
    return speedometer;
  }
}

