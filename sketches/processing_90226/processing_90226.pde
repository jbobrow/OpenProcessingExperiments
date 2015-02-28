
//Ball

int xbLoc;
int ybLoc=200;
int bSpeed =3;
int ballHit;

//PaddleLeft
//Controlled by MouseX, MouseY

//PaddleRight
int xpLoc = 785;
int ypLoc = 250;
int pSpeed = 3;
int paddleHit;

void setup(){
 smooth();
  size(800,500);
  background(0);
  mousePressed = true;
  
}

void draw (){
    background(0);
    
  //PaddleL
 rect (mouseX, mouseY, 15, 80);
 
  //Paddle R ("automated Paddle moving up and down")
  
  if (ypLoc <=0){
    pSpeed = pSpeed* -1;

  }
  
  else if (ypLoc>=height || ypLoc <=0){
   pSpeed = pSpeed* -1;
   
  }
  
  ypLoc-=pSpeed;
  rect (xpLoc, ypLoc, 15,80);
  
  //Ball
  if
  (mousePressed = true){
   ellipse(0,0,40,40); 
  }
  if (xbLoc <=0){
    bSpeed = bSpeed* -1;
   
  }
  
  else if (xbLoc>=width || xbLoc<0){
    bSpeed = bSpeed*-1;
  }
  
  
  xbLoc-=bSpeed;
  fill(255,255,255);
  ellipse(xbLoc, ybLoc, 40,40);
  
  }
  




