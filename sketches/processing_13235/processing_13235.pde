
//ASSIGNMENT 3 OLIVER HENSEL-BROWN 


int x = 245;   //bowie starting x coordinate
int y = 10;   //bowie y coordinate

int speed = 3; // the speep at which bowie travels

PImage img1;   //front bowie
PImage img2;   //bowie turned left
PImage img3;   //bowie turned right
PImage img4;   //bowie turns green
PImage img5;   //bowie turns blue


void setup(){
  size(800,500);
  smooth();
  img1 = loadImage("DAVID front on.jpg");
  img2 = loadImage("DAVID to the left.jpg");
  img3 = loadImage("DAVID to the right.jpg");
  img4 = loadImage("DAVID front on green.jpg");
  img5 = loadImage("DAVID front on blue.jpg");
 
}

void draw(){
  background(255);
  if (keyPressed && (key == CODED)){
    
    if (keyCode == LEFT) { 
      x = x-speed;
      image(img2, x, y);             // bowie goes left
      
    } else if(keyCode == RIGHT){
      x = x + speed;
      image(img3, x, y);             // bowie goes right
    } 
      else if(keyCode == UP){
        image(img4, x, y);           //bowie turns green
    }
      else if(keyCode == DOWN){
        image(img5, x, y);           //bowie turns blue
      }
    
    
  } else{
    image( img1, x, y);               //normal front on bowie 
  
  }
  
  if (x>width){
    x = -300;        //bowie wraps around from right to left
  }
  if (x < -300){
    x = 800;         //bowie wraps around from left to right
  }
  
}





