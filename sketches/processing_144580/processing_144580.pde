

/*
 * Taller Programación MDI Veritas
 * Tarea #3
 * Modificar el sistema base de partículas que incluya una o todas las siguientes opciones:
 *
 *  1. Rebotar en los bordes u otros objetos
 *  2. Rebotar entre ellas
 *  3. Que exista atracción y/o repulsión
 *  4. Crear una clase "partcicleSystem" que contenga objetos de clase partículas
 *
 */

/**
 * main program file
 *
 * @author Eric Marin
 * @date 23/4/14
 * @version 1.0
 */

//variables
int cantPart = 200;
particula[] bosson = new particula[cantPart];

void setup(){
  size(960, 620, P2D);
  background(0);
  PVector ini = new PVector(width/2, height/2);
  
  for(int i = 0; i < cantPart; i++){
    bosson[i] = new particula(ini, 960, 620);
  }
    
}

void draw(){
  background(0);
  
  //call particual functions
  for(int i = 0; i < cantPart; i++){
    bosson[i].display();
    bosson[i].update();
  }
  
  
  
}



/**
 * class particula
 *
 * @author Eric Marin
 * @date 23/4/14
 * @version 1.0
 */

class particula{
  
  //variables
  PVector position;
  PVector velocity;
  PVector acceleration;
  color particleColor;
  int radio;
  int limitX;
  int limitY;
  PImage img;
  int numParts = 80;
  
  int creationTime;
  int liveTime = (int)random(15000, 35000);
  int passedTime;

  //constructor
  particula(PVector ini, int x, int y){
    position = ini.get();
    velocity = new PVector(random(-1, 1), random(-1, 1));
    acceleration = new PVector(random(-0.005, 0.005), random(-0.005, 0.005));
    particleColor = color(random(0,255), random(0,255), random(0,255));
    radio = (int)random(20, 35);
    limitX = x;
    limitY = y;
    img = loadImage("images.jpeg");
    creationTime = millis();
  }
  
  //update function
  void update(){
    
    if(position.x >= limitX || position.x <= 0){
      acceleration.x = -acceleration.x;
      velocity.x = - velocity.x;
    }
    
    if(position.y >= limitY || position.y <= 0){
      acceleration.y = -acceleration.y;
      velocity.y = - velocity.y;
    }
    
    position.add(velocity);
    velocity.add(acceleration);
    
    passedTime = millis() - creationTime;
  }
  
  //display function
  void display(){
    
    if (passedTime < liveTime) {
    
      fill(255);
      stroke(255);
      
  //    pushMatrix();
  //    translate(position.x, position.y, 0);
  //    sphere(radio);
  //    popMatrix();
      
      pushMatrix();
      translate(position.x, position.y);
      beginShape();
      texture(img);
      float theta = TWO_PI / numParts;
      for (int i=0; i<numParts; i++) {
        float angle = theta * i;
        float x = cos(angle);
        float y = sin(angle);
        vertex(x * radio, y * radio, (x+1)/2, (y+1)/2);
      }
      endShape();
      popMatrix();
    
    
    

      //creationTime = millis(); // Save the current time to restart the timer!
    }
    
  }
}
