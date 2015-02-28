
//simple, mesmerizing UFO game with black holes, gravity
//click-drag to move UFO
//ethan dale
//math, programming & art


float vy = 0;
float vx = 0;
float x = 300;
float y = 300;
float bounceX = 20;
float bounceY = 20;
float debug = 1; //set to 0 for realtime debug
float friction = 1;//will bounce 60% of first bounce
float gravity = .0;
float hgrav = 1;
PImage ufo;


void setup() {
  size(600,600);
  smooth();
ufo = loadImage("adamski.png");  
  frameRate(10);

}

void draw() {
  vy += gravity;
  x += vx; // same as x + vx = x
  y += vy;
  if(y > height) {
    y = height;
    vy = -.5*vy ;
  }
  if(debug == 0){
  println("velocityY " + vy);
}
  if(y < 0) {
    vy = -.5*vy ;

  vy *= friction; //same as vy * friction = vy
  }

  if(x>width) {
    x=width;
    vx = -.5*vx;
  }
  if(debug == 0){
  println("velocityX " + vx);
  println("x " + x);
  println("y " + y);
  }
  if(x<0) {
    x=0;
    vx = -.5*vx;
  vx *= friction;
  }

// fill(0,0,255,5);
// rect(0,0,width,height);

noFill();
  blackHole(400,400,120);
  blackHole(100,100,98);
  blackHole(350,150,250);
  blackHole(200,500,0);
  image(ufo,x,y);
 fill(255,50);
 rect(0,0,width,height);
 
 
  float hdist = dist(x,y,400,400);
if(debug == 0){
  println("hdist " + hdist);
}
}

//senses direction of mouse dragging
void mouseDragged() {
  if (mouseX > pmouseX)
     {vx += 2;}
  if (mouseX < pmouseX)
      {vx += -2;}
  if (mouseY > pmouseY)
      {vy += 2;}
  if (mouseY < pmouseY)
      {vy += -2;} 
}

void blackHole(int bhx, int bhy, int bhc){
  fill(bhc);
  ellipse(bhx, bhy, 50,50);
  
    if(x > bhx + 25 && y > bhy +25) {
    vy += -3;
    vx += -3;
  }
   if(x > bhx + 25 && y < bhy +25) {
    vy += 3;
    vx += -3;
  }
  if(x < bhx + 25 && y > bhy + 25) {
    vy += -3;
    vx += 3;
  }
  if(x < bhx + 25 && y < bhy + 25) {
    vy += 3;
    vx += 3;
   
  } 
}


