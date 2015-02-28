


//first balloon
float x1 = 100;
float y1 = 100;
float x1speed = 0.5;
float y1speed = 0.75;
float x1wide = 200;
float y1tall = 200;

//second balloon
float x2 = 600;
float y2 = 400;
float x2speed = -0.9;
float y2speed = 0.001;
float x2wide = 200;
float y2tall = 200;

//third balloon
float x3 = 0;
float y3 = 300;
float x3speed = 0.7;
float y3speed = 0.25;
float x3wide = 200;
float y3tall = 200;

//fourth balloon
float x4 = 300;
float y4 = 0;
float x4speed = -0.1;
float y4speed = 1;
float x4wide = 200;
float y4tall = 200;

//fifth balloon
float x5 = 0;
float y5 = 600;
float x5speed = 0.75;
float y5speed = -0.5;
float x5wide = 200;
float y5tall = 200;

//sixth balloon
float x6 = 600;
float y6 = 0;
float x6speed = -0.85;
float y6speed = 1.05;
float x6wide = 200;
float y6tall = 200;

//seventh balloon
float x7 = 500;
float y7 = 600;
float x7speed = -0.5;
float y7speed = -0.5;
float x7wide = 200;
float y7tall = 200;

//speed of shrinking
float shrinkspeed = 0.5;

void setup() {
 
  size(600,600);
 
  stroke(0);
 
}

void draw() {
  background(236, 255, 255);
  
//first balloon
  x1 = x1 + x1speed;
  y1 = y1 + y1speed;
  x1wide = x1wide - shrinkspeed;
  y1tall = y1tall - shrinkspeed;
    fill(255,104,104);
    noStroke();
    ellipse(x1,y1,x1wide,y1tall);
    
  if (x1wide < 0){
    x1 = 100;
    y1 = 100;
    x1wide = 200;
    y1tall = 200;}
  
//second balloon
  x2 = x2 + x2speed;
  y2 = y2 + y2speed;
  x2wide = x2wide - shrinkspeed;
  y2tall = y2tall - shrinkspeed;
    fill(223,72,72);
    noStroke();
    ellipse(x2,y2,x2wide,y2tall);
    
  if (x2wide < 0){
    x2 = 600;
    y2 = 400;
    x2wide = 200;
    y2tall = 200;}
    
//third balloon
  x3 = x3 + x3speed;
  y3 = y3 + y3speed;
  x3wide = x3wide - shrinkspeed;
  y3tall = y3tall - shrinkspeed;
    fill(239,88,88);
    noStroke();
    ellipse(x3,y3,x3wide,y3tall);
    
  if (x3wide < 0){
    x3 = 0;
    y3 = 300;
    x3wide = 200;
    y3tall = 200;}
    
    //fourth balloon
  x4 = x4 + x4speed;
  y4 = y4 + y4speed;
  x4wide = x4wide - shrinkspeed;
  y4tall = y4tall - shrinkspeed;
    fill(215,64,64);
    noStroke();
    ellipse(x4,y4,x4wide,y4tall);
    
  if (x4wide < 0){
    x4 = 300;
    y4 = 0;
    x4wide = 200;
    y4tall = 200;}
    
//fifth balloon
  x5 = x5 + x5speed;
  y5 = y5 + y5speed;
  x5wide = x5wide - shrinkspeed;
  y5tall = y5tall - shrinkspeed;
    fill(199,48,48);
    noStroke();
    ellipse(x5,y5,x5wide,y5tall);
    
  if (x5wide < 0){
    x5 = 0;
    y5 = 600;
    x5wide = 200;
    y5tall = 200;}
    
//sixth balloon
  x6 = x6 + x6speed;
  y6 = y6 + y6speed;
  x6wide = x6wide - shrinkspeed;
  y6tall = y6tall - shrinkspeed;
    fill(231,80,80);
    noStroke();
    ellipse(x6,y6,x6wide,y6tall);
    
  if (x6wide < 0){
    x6 = 600;
    y6 = 0;
    x6wide = 200;
    y6tall = 200;}
     
     
//seventh balloon
  x7 = x7 + x7speed;
  y7 = y7 + y7speed;
  x7wide = x7wide - shrinkspeed;
  y7tall = y7tall - shrinkspeed;
    fill(191,40,40);
    noStroke();
    ellipse(x7,y7,x7wide,y7tall);
    
  if (x7wide < 0){
    x7 = 500;
    y7 = 600;
    x7wide = 200;
    y7tall = 200;}
    
    
    
}                                                               
