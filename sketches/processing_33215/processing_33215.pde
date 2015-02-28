

//varialbles//
int fruitx = 0;
int fruity = 200;

int rad = 50;
int vel = 1;

//my images 
PImage grass;
PImage banana;
PImage apple;
PImage orange;
PImage grape;
PImage pineapple;
PImage strawberry;
PImage cherry;
PFont futura;


//set up//
void setup(){
size(500,500);
smooth();

frameRate(30);
 
//load images and font//
grass = loadImage ("grass.jpg");
banana = loadImage ("banana.gif");
apple = loadImage ("apple.gif");
orange = loadImage ("orange.gif");
grape = loadImage ("grape.gif");
pineapple = loadImage ("pineapple.gif");
strawberry = loadImage ("strawberry.gif");
cherry = loadImage ("cherry.gif");
}


void draw(){
  background(grass); 
  
  image(banana, fruitx-200, fruity);
  fruitx = fruitx + vel;
   
  image(apple, fruitx-400, fruity);
  fruitx = fruitx + vel;
  
  image(orange, fruitx-600, fruity);
  fruitx = fruitx + vel;
  
  image(grape, fruitx-800, fruity);
  fruitx = fruitx + vel;
  
  image(pineapple, fruitx-1000, fruity);
  fruitx = fruitx + vel;
  
  image(strawberry, fruitx-1200, fruity);
  fruitx = fruitx + vel;
  
  image(cherry, fruitx-1400, fruity);
  fruitx = fruitx + vel;
  
  futura = createFont("futura.dfont", 30);
  textFont(futura);
  fill(255);
  stroke(5);
  text("THE ATTRACTIVE FRUIT PARADE", 15,50);


}



