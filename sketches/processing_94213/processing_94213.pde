
/* @pjs preload="sheep.png, scared.png, flashlight.png,boo.png,boo_scared.png"; */

timid sheep;
Ghost ghost;
int minx = 50;
int miny = 50;
int maxx = 50;
int maxy = 50;
PImage img;
PImage img2;
PImage boo1;
PImage boo2;


class TopDownRotater{
  PImage image;
  PVector position;
  PVector direction;
  PVector velocity;
  float rotateSpeed;
  float speed;
}

TopDownRotater flashlight;
 
float left = 0;
float right = 0;
float down = 0;
float up = 0;

boolean flashlightOn = false;
boolean lit = false;
boolean lose = false;
boolean winning = true;
boolean won = false;

 
void setup() {
    size(800, 700);
    background(0);
    smooth();
    sheep = new timid();
    ghost = new Ghost();
    img = loadImage("sheep.png");
    img2 = loadImage("scared.png");
    boo1 = loadImage("boo.png");
    boo2 = loadImage("boo_scared.png");
    imageMode(CENTER);
    
    flashlight = new TopDownRotater();   
    flashlight.image = loadImage("flashlight.png");   
    flashlight.position = new PVector(400, 400);  
    flashlight.direction = new PVector(0, 1);
    flashlight.velocity = new PVector(0, 0);
    flashlight.speed = 3;
    flashlight.rotateSpeed = .1;   
}
 
void draw() {
    fill(0, 50);
    rect(0, 0, width, height);
    sheep.draw();
    ghost.draw();
    
    if (winning = true){
             
        fill(0,255,0);
        rect(0,0,200,100);
        fill(255);
        textSize(60);
        text("GOAL", 20, 60);
        textSize(30); 
    }
    
    
    rotate2D(flashlight.direction, flashlight.rotateSpeed * (left + right));
  flashlight.velocity.x = flashlight.direction.x * (flashlight.speed * (up + down));
  flashlight.velocity.y = flashlight.direction.y * (flashlight.speed * (up + down));
  flashlight.position.add(flashlight.velocity);
 
  pushMatrix();

  translate(flashlight.position.x, flashlight.position.y);
  rotate(flashlight.direction.heading2D());
  imageMode(CENTER);
  image(flashlight.image, 0, 0);
   
  popMatrix(); 
  
  if(lose == true){
    fill(0);
    rect(0,0,width,height);
    fill(255);
    text("BOO! Got your sheep!", 200, 400);
  }
  else{
  }
  
    if(won == true){
    textSize(70);
    fill(0,255,0);
    rect(0,0,width,height);
    fill(0);
    text("YOUR SHEEP IS SAFE", 100, 400);
  }

  
  if (flashlightOn == true) 
  {
    winning = false;
    float x0 = 0;
    float y0 = 0;
    float x1 = 0;
    float y1 = 600;
  
          fill(249,255, 88, 100);
          noStroke();
           
          pushMatrix();
        
          translate(flashlight.position.x + (flashlight.direction.x * 120), flashlight.position.y + (flashlight.direction.y * 120));
          rotate(flashlight.direction.heading2D() + radians(-90));
          
          
          line(x0,y0,x1,y1);
          
          
          triangle(0, 0, 80, 600, -80, 600);
          popMatrix();
  }
}
 
public class timid {
    float x, y;
    int w, h;
    float speedx, speedy;
    float accel;
 
    timid() {
        x = width  / 2;
        y = height / 2;
 
        w = 100;
        h = 100;
 
        speedx = 0;
        speedy = 0;
        accel  = 0.1;
    }
 
    void draw() {
      if (speedy < 3 && speedy > -3 && speedx < 3 && speedx > -3){
        image(img, x, y, w, h);
      }
      else{
        image(img2, x, y, w, h);
      }
 
        if (mouseX < x) {
            speedx += accel;
        }
        else if (mouseX > x) {
            speedx -= accel;
        }
        x += speedx;
 
        if (mouseY < y) {
            speedy += accel;
        }
        else if (mouseY > y) {
            speedy -= accel;
        }
       
        y += speedy;
        
        if(x <= ghost.x2+100 && x >= ghost.x2-100 && y <= ghost.y2+100 && y >= ghost.y2-100 && lit != !lit){
          lose = true;
        }
 
        speedx = constrain(speedx, -5, 5);
        speedy = constrain(speedy, -5, 5);
        x      = constrain(x, minx, width-maxx);
        y      = constrain(y, miny, height-maxy);
 
        if (x == minx || x == width-maxx) speedx = 0;
        if (y == miny || y == width-maxy) speedy = 0;
        
        if(winning = true && x < 200 && y < 100){
          won = true;
        }
    }
}

public class Ghost {
    float x2, y2;
    int r;
    float speedx, speedy;
 
    Ghost() {
        x2 = 50;
        y2 = 50;
 
        r = 400;
 
        speedx = 10;
        speedy = 2;
    }
 
    void draw() {
      if (lit == true){
        image(boo2, x2, y2, r, r);
      }
      else{
        image(boo1, x2, y2, r, r);
      }
 
       if (lit == true){
        x2 += speedx/4;
        y2 += speedy/4;
       }
       else{
         x2 += speedx;     
         y2 += speedy;
       }
       
        x2      = constrain(x2, minx, width-maxx);
        y2      = constrain(y2, miny, height-maxy);
 
        if (x2 == minx || x2 == width-maxx) speedx = -speedx;
        if (y2 == miny || y2 == width-maxy) speedy = -speedy;
    }
}

void rotate2D(PVector v, float theta)
{
  float m = v.mag();
  float a = v.heading2D();
  a += theta;
  v.x = m * cos(a);
  v.y = m * sin(a);
}
 
void keyPressed(){
    if (keyCode == RIGHT){
      right = 1;
    }
    if (keyCode == LEFT){
      left = -1;
    }
    if (keyCode == UP){
      up = 1;
    }
    if (keyCode == DOWN){
      down = -1;
    }
    if (key  == ' ') {


    } 
}
 
void keyReleased()
{
    if (keyCode == RIGHT){
      right = 0;
    }
    if (keyCode == LEFT){
      left = 0;
    }
    if (keyCode == UP){
      up = 0;
    }
    if (keyCode == DOWN) {
      down = 0;
    }
   if (key  == ' ') {
     if (flashlightOn == true)
     {
        flashlightOn = false;
        lit = false;
        winning = true;
     }
     else if (flashlightOn == false)
     {
        flashlightOn = true;
        lit = true;
        winning = false;
     }
   }    
}


