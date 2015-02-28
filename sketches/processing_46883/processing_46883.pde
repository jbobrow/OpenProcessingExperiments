
/*
* SnowFlakes
* A small christmas themed experiment to understand particles
* 
* Coded by Rodrigo Amaya followe me @ramayac.
*/
int OFFSET = 20;
int PARTICULAS = 100;

int teta = 0;

class Flake{
  float x;
  float y;
  
  float xVel;
  float yVel;
  
  PImage img;
  
  float size;
  
  Flake(float _x, float _y, float _xVel, float _yVel, float _size, PImage _img){
    x = _x;
    y = _y;
    xVel = _xVel;
    yVel = _yVel;
    size = _size;
    img = _img;
  }
  
  void draw(){    
    pushMatrix();
    translate(x, y);
    rotate(teta*TWO_PI/360);
    image(img, 0, 0, size, size);
    popMatrix();
    //ellipse(x, y, size, size);
  }
  
  void update(float _wind){
    x+=xVel;
    y+=yVel;
    
    x += _wind * size;
    
    if(y > height + OFFSET) y = 0;
    if(x < 0 - OFFSET) x = width;
    else if(x > width + OFFSET) x = 0;
  }
}

ArrayList flakes = new ArrayList();

void setup(){
  size(600, 400);
  
  PImage[] imagenes = new PImage[0];
  for(int i = 0; i < 8; i++){
    imagenes = (PImage[])append(imagenes, loadImage("sc-glowflake" + i + ".png"));
  }
  
  
  for(int i = 0; i < PARTICULAS; i++){
    float x = random(0, width);
    float y = random(0, height);
    float z = random(0, 1)*300-250;
    float s = perspectiva(z);
    
    float xVel = random(0, 1)*2-1; 
    float yVel = 1.5;
    
    xVel*=s; 
    yVel*=s; 
    
    int r = (int)random(0, 7); 
    
    //el 5.5 es ley del llegue
    Flake f = new Flake(x, y, xVel, yVel, s*8, imagenes[r]);
    flakes.add(f);
  }
  
  smooth();
  frameRate(24);
}

float perspectiva(float z){
  int fov = 300;
  return fov/(z+fov);
}

void draw(){
  teta++;
  background(255);
  for(int i = 0; i < PARTICULAS; i++){
    Flake f = (Flake) flakes.get(i);
    f.update(wind());
    f.draw();
  }
}

float wind(){
  float x = constrain(mouseX, 0, width);
  if(x < (width/2)){
    return -0.1;
  } else {
    return 0.1;
  }
}

