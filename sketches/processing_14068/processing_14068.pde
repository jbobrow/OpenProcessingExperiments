
// a simple eating game

import ddf.minim.*;  
AudioSample bell; 

float score = 0;
Car car;
Food[] food = new Food[36];

void setup()  
{
  size(600,400);           
  smooth();                
  ellipseMode(CORNER);     
  bell = new Minim(this).loadSample("bell.wav");  
  car = new Car ();

  for (int i=0; i < food.length; i++)
  {
    food[i] = new Food();
    food[i].createFood();
  }
}

void draw()  
{
  background(255); 
  fill(0);       
  stroke(0);  
  line(0,30,width,30);  
  checkCollisions();
  for (int i=0; i < food.length; i++) {
    food[i].renderfood();
  }
  car.drawCar();
  //display timer, score and instructions
  fill(0,200,0);                              
  text("score: "+score, 20, 20);            
  text("time: "+millis()/1000, 200, 20);      
  text("use arrow-keys to move", 430, 20);
}


//Create a class for CAR
class Car { 

  //create variables for a 'car'
  float carX=100;      
  float carY=100;     
  float carW=20;       
  float carH=20;       
  float speed = 5;     
  float score = 0;     

  // draw a car
  void drawCar () {
    fill(0,0,200);                      
    rect(carX,carY,carW,carH);          
    fill(0,200,0);                      
    rect(carX+2,carY-4,4,4);           
    rect(carX+2,carY+carH,4,4);        
    rect(carX+carW-6,carY-4,4,4);       
    rect(carX+carW-6,carY+carH,4,4);
  }
}


//create a class for food
class Food
{
  float r=0,g=0,b=0,a=0;
  float radius = 10;
  float x =0;
  float y =0;


  void createFood() {
    x = random(10, width - radius);
    y = random(10, height - 40);


    r = random(0, 255);
    g = random(0, 255);
    b = random(0, 255);
    a = random(50, 200);
    radius = random(5, 20);
  }


  void renderfood() {
    ellipseMode (CENTER);
    fill(r,g,b,a);
    ellipse(x,y, radius*2, radius*2);
  }
}

void checkCollisions() {
  for (int i = 0; i < food.length; i++) {
    if(intersects(car.carX, car.carY, car.carW, car.carH,  food[i].x, food[i].y, food[i].radius, food[i].radius)) {

      bell.trigger();                     
      food[i].x =  random (0, width);  
      food[i].radius = food[i].radius*2;
      score += 10;
      food[i].r=255;
      food[i].g=0;
      food[i].b=0;
      food[i].a=255;
    }
  }
}
//if food = red car doesnt move  

/*void checkForRed (){   
 for (food[i].r==255; food[i].g==0; food[i].b==0; food[i].a==255)  {
 if(intersects(car.carX, car.carY, car.carW, car.carH,  food[i].x, food[i].y, food[i].radius, food[i].radius)) {
 car.speed = 0;
 }
 }
 }
 */


//  Checks whether two rectangles (t and r) overlap
boolean intersects(float tx, float ty, float tw, float th, float rx, float ry, float rw, float rh) 
{
  rw += rx;  
  rh += ry;  
  tw += tx;
  th += ty;


  boolean result =              
    ((rw < rx || rw > tx) &&     
    (rh < ry || rh > ty) &&     
    (tw < tx || tw > rx) &&     
    (th < ty || th > ry));      

  return result;
}





// initialize the processing defined function keyPressed ; when a key is pressed do something specific
void keyPressed()
{
  print(keyCode);  
  if (keyCode == 38)        
  {                         
    car.carY = car.carY - car.speed;
  }
  else if (keyCode == 37)   
  {                         
    car.carX = car.carX - car.speed;
  }
  else if (keyCode == 39)   
  {                         
    car.carX = car.carX + car.speed;
  }
  else if (keyCode == 40)   
  {                         
    car.carY = car.carY + car.speed;
  }
  else if (keyCode == 82) {
    setup();
  }
}


