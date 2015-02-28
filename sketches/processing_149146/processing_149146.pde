
PImage tapir;
PImage forest;
PImage jaguar;
PImage sloth;

float jaguar_x;
float jaguar_y;
boolean jaguar_grow = false;
float tapir_x;
float tapir_y;



void setup(){
  size(700,700);
  tapir = loadImage("tapir.jpg");
  jaguar = loadImage("jaguar.jpg");
  sloth = loadImage("sloth.jpg");
  forest = loadImage("forest.jpg");
  tapir1 = new Tapir(random(width),random(height),1,0.5);
  jaguar1 = new Jaguar(random(width),random(height),1,0.5);
  sloth1 = new Sloth(random(width),random(height),1,0.5);
}

void checkCoords() {
  if(
    tapir_x < jaguar_x 
    && tapir_x+328 > jaguar_x 
    && tapir_y < jaguar_y 
    && tapir_y+154 > jaguar_y
  ) {
    tapir1.hide();
    jaguar1.grow();
  }
}

void hideSloth(){
  window.setTimeout(sloth1.sleep(), 10000);
}
 
void draw(){
  image(forest,0,0);
  tapir1.move();
  tapir1.draw();
  jaguar1.move();
  jaguar1.draw();
 sloth1.move();
 sloth1.draw();
 checkCoords();
 hideSloth();
}






 
class Tapir {
  float x;
  float y;
  float x_speed;
  float y_speed;
   
  Tapir (float CLASS_X,float CLASS_Y,float X_Speed,float Y_Speed){
    x = CLASS_X;
    y = CLASS_Y;
    x_speed = X_Speed;
    y_speed = Y_Speed;
  }
   
  void draw(){
    image(tapir,x,y);
  }
   
  void move(){
    if (x > width || x < 0) {
      x_speed = -x_speed;
    }
    if (y < 150) {
      y_speed += 1;
    }
    if (y > 200) {
      y_speed -= 1;
    }
    x += x_speed;
    y += y_speed;
    tapir_x = x;
    tapir_y = y;
  }
  
  void hide(){
    x = 999999;
    y = 999999;
    x_speed = 0;
    y_speed = 0;
  }
  
}

class Jaguar{
    float x;
    float y;
    float x_speed;
    float y_speed;
    
    Jaguar (float CLASS_X,float CLASS_Y,float X_Speed,float Y_Speed){
    x = CLASS_X;
    y = CLASS_Y;
    x_speed = X_Speed;
    y_speed = Y_Speed;
  }
  void draw(){
    if(jaguar_grow) {
      image(jaguar,x,y,460,246);
    } else {
      image(jaguar,x,y);
    }
  }
  
  void move(){
    if (x > width || x < 0) {
      x_speed = -x_speed;
    }
    if (y < 150) {
      y_speed += 1;
    }
    if (y > 200) {
      y_speed -= 1;
    }
    x += x_speed;
    y += y_speed;
    jaguar_x = x;
    jaguar_y = y;
  }
  
  void grow() {
    jaguar_grow = true;
    draw(); 
  }
}





 class Sloth{
    float x;
    float y;
    float x_speed;
    float y_speed;
    
    Sloth (float CLASS_X,float CLASS_Y,float X_Speed,float Y_Speed){
    x = CLASS_X;
    y = CLASS_Y;
    x_speed = X_Speed;
    y_speed = Y_Speed;
  }
  void draw(){
    image(sloth,x,y);
  }
  
  void move(){
    if (x > width || x < 0) {
      x_speed = -x_speed;
    }
    if (y < 150) {
      y_speed += 1;
    }
    if (y > 200) {
      y_speed -= 1;
    }
    x += x_speed;
    y += y_speed;
  }
  
  void sleep(){
    x_speed = 0;
    y_speed = 0;
  }
}


