
/* @pjs preload = "apple_white.png"; */
PImage img;
int Length = 20;
float alpha = 100;
float Xmove = 900;
float Ymove = 1000;
float[] X = new float[Length];
float[] Y = new float[Length];
float[] Ang = new float[Length];
float[] Rot = new float[Length];
float[] C = new float[Length];
float[] Radius = new float[Length];

float Cx, Cy;
float speed = 0;
float Maxspeed = 200;

void setup(){
  size(450,450);
  colorMode(HSB, 100);
  background(99);
  imageMode(CENTER);
  img = loadImage("apple_white.png");
  frameRate(30);
}

void draw(){
  fade();
  if(mousePressed){
    alpha = alpha - 0.3;
    Xmove = Xmove - 2;
    Ymove = Ymove - 2;
    
    
  }else {
    alpha = alpha + 0.5;
    Xmove = Xmove + 2;
    Ymove = Ymove + 2;
  }
   tint(0, alpha);
   image(img, width/2, height/2, Xmove, Ymove);
 
  
  if(speed > 0){
    for(int i=0 ; i < Length ; i++){
      Ang[i] += Rot[i] * (speed  / 10);
      X[i] = Cx + ( speed * sin(radians(Ang[i])) );
      Y[i] = Cy + ( speed * cos(radians(Ang[i])) );
       
      noStroke();
      tint(C[i],80,100, min(speed,80));
      image( img,X[i], Y[i], Radius[i], Radius[i]);
    }
  }
  
  if(mousePressed){
    Cx = width/2;
    Cy = height/2;
    if(speed < Maxspeed) speed = speed += 1;
    
  }else{
    
    if(speed > 1) speed = speed * 0.98;
    else speed = 0;
  }
}

void fade(){
  noStroke();
  fill(99, 30);
  rectMode(CORNER);
  rect(0, 0, width, height);
 
}

void mousePressed(){
  //speed = 0;
  for(int i=0 ; i < Length ; i++){
    Radius[i] = random(10, 30);
    C[i] = random(100);
    Rot[i] = random(-5, 5);
  }
}





