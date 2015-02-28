
int X, Y; 
int Z, W; 
int Rnd;  

void setup() {
  size(480, 360);
  background(255);
  X = width/2; 
  Y = height/2; 
  
  frameRate(15); 
}

void draw() {
  
  Z = X;
  W = Y;
  
  Rnd = int(random(0, 4));

switch (Rnd) {
  case 0 : 
  X = X + 8;
  Y = Y;
  break;
  
  case 1 :
  X = X - 8;
  Y = Y;
  break;
  
  case 2 : 
  X = X ;
  Y = Y + 8;
  break;
  
  case 3 :
  X = X;
  Y = Y - 8;
  break;
}
  
fill(100);
rectMode(CENTER);
rect(X, Y, 1, 1);

noFill();
line(X, Y, Z, W);
}
      
                
