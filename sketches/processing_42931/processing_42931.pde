
//count program

//PImage lemon;
//lemon = loadImage("lemon.jpg");
//image(lemon,0,0);
//tried to make the moving image a lemon , not sure how !

//Drag mouse over rectangle to change value of fill .


int x;
int directionx;
int y;
int directiony;


void setup(){
  size(600,600);
  smooth();
  x = 17;
  y = 428;
  directionx = 1;
  directiony = -2; 
}

int value = 0;

void mouseDragged() 
{
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
}  

void draw(){
  background(72);
  fill(value);
  stroke(17,214,143);
  rect(x,y,50,50);
  x += directionx;
  y += directiony;
  if(x > width){
    directionx = -1;
    //directiony = 1;
    
  }
  
  if(y > height){
    //directionx = -1;
    directiony = -1;
  }
  
  if(x > width){
    directionx = -10;
  }
  
  if(y < 0){
    directiony = +10;
  }
 
 if(x < 0){
   directionx = +5;
 }
  
println(y); 
}

     


