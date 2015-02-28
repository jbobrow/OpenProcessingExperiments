
/*@pjs preload="bg1.png, illast.png, apple_white.png";*/
PImage img;
PImage apple;
PImage bird;
float x;
float y = 0;
int speed = 3;
int c;
int eSize = 3;
int ypos;
int xpos;


void setup() {
  size(450, 450);//size
  noStroke();
  smooth();
  frameRate(30);
  c = 0;
  ypos=0;
  xpos=0;
  x=0;
}

void draw() {
  tint(255);
  img= loadImage("bg1.png"); 
  
  apple = loadImage("apple_white.png");//apple
  image(img, 0, 0); //background
  tint(c,c,c);
  
  noSmooth();
    xpos = xpos + speed;
if (xpos >= height/5) {
  xpos  = height/5;
}
  image(apple, 120, xpos, 200,200);


 
  bird = loadImage("illast.png");//bird
  tint(0,0,0);
  ypos = ypos + speed+2;
  if (ypos >= width){
    ypos = 0;
  }
    image(bird, ypos ,3 ,90, 90);
    
    //println(y);
  
  for(int y = 0; y <= height; y +=10){
   for(int x = 0; x <= width; x +=10){
    if (x <= height){
      ellipse(x,y,eSize,eSize);
  }
 }
}
}
void mouseMoved(){//mouse drag is deleate
 c ++;
  if(c > 250){
    c = 250;
  }
}

void mouseDragged(){
  c --;
  if(c < 25){
    c = 25;
  }
}


   




