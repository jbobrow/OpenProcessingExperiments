

//varialbles//
int fruitx = 0;
int fruity = 200;

int rad = 50;
int vel = 1;

//my images 
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

banana = loadImage ("banana.gif");
apple = loadImage ("apple.gif");
orange = loadImage ("orange.gif");
grape = loadImage ("grape.gif");
pineapple = loadImage ("pineapple.gif");
strawberry = loadImage ("strawberry.gif");
cherry = loadImage ("cherry.gif");
}


void draw(){   
   
   colorMode(RGB,255);
for(int j=0; j<500; j+=1){
  for (int i=0; i<500; i+=1){
    stroke(i,j,0);
    point(i,j);
  }
} 
    //(start; end; increment)//
  for(int i=0; i<200; i++)
    for (int j =0; j<200; j++){ 
    image(banana, fruitx-200, fruity);
    fruitx = fruitx + vel;
  }
  
   for(int i=0; i<400; i++)
    for (int j =0; j<400; j++){  
    image(apple, fruitx-400, fruity);
    fruitx = fruitx + vel;
   }
  
  
   for(int i=0; i<600; i++)
    for (int j =0; j<600; j++){
    image(orange, fruitx-600, fruity);
    fruitx = fruitx + vel;
   }
   
   for(int i=0; i<800; i++)
    for (int j =0; j<200; j++){
    image(grape, fruitx-800, fruity);
    fruitx = fruitx + vel;
    }
  
  for(int i=0; i<1000; i++)
    for (int j =0; j<200; j++){
    image(pineapple, fruitx-1000, fruity);
    fruitx = fruitx + vel;
    }
  
  for(int i=0; i<1200; i++)
    for (int j =0; j<200; j++){
    image(strawberry, fruitx-1200, fruity);
    fruitx = fruitx + vel;
    }
  
  for(int i=0; i<12; i++)
    for (int j =0; j<200; j++){
    image(cherry, fruitx-1400, fruity);
    fruitx = fruitx + vel;
    }
  
  futura = createFont("futura.dfont", 30);
  textFont(futura);
  fill(255);
  stroke(5);
  text("THE ATTRACTIVE FRUIT PARADE", 15,50);
  
  }






