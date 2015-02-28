
//Mariana Moreno
//March 13, 2012
//Math, Programming & Art
//HW: WK 8

PImage myType;
float vy,vx,x,y,frictiony,frictionx,gravity;
float ellSize = 50;
int mode = 0;
int a,b;

void setup (){
  size (900,600);
  noFill ();
  smooth ();
  myType = loadImage ("startPage.png");
  vy = 0;
  vx = 2;
  x= 0;
  y = 0;
  frictiony= -.6;
  frictionx = 1;
  gravity = .04;
  }

void draw (){
  //begin at start screen
  if (mode == 0){
    startScreen ();
  //to start game
  } else if (mode == 1){
    background (0);
  } else if (mode == 2){
    fun ();
    if (int (millis()/1000) > 60){
      endScreen ();
    }
  } else if (mode == 3){
    restart ();
  }
}

void keyPressed (){
  if (key == '1'){
    mode = 1;
  } else if (key == '2'){
    mode = 2;
  } else if (key == '3'){
    mode = 3;
  }
}

void mouseReleased (){
  vy -= 3;
}

//where instructions can be put for the game
void startScreen (){
  strokeWeight (.5);
  for (int i = 0; i < 10000; i++){
    a = int (random (width));
    b = int (random (height));
    
    color cp = myType.get(a,b);

    float c = brightness(cp);
   
    if (c == 255){
      float ellSize = 1;
      ellipse (a,b,ellSize,ellSize);
    }
  }  
}

void endScreen (){
  noLoop ();
}

void restart (){
  loop ();
}
void fun (){
 //gravity/bounce for ellipse
 vy += gravity;
 vx *= frictionx;
 x += vx;
 y += vy;
 if (y > height){
   y = height;
   vy *= frictiony;
 }
 //bouncing ellipse
 ellipse (x,y,ellSize, ellSize);
 stroke (213,165,255,50);
 
 //static, centered ellipse
 ellipse (width/2,height/2,ellSize,ellSize);
 
 //when moving ellipse touches center ellipse
 for (int i = 0; i < 10; i+=10){
   if (dist (width/2,height/2,x,y) < 25){
     ellipse (width/2,height/2,ellSize++,ellSize++);
   }
 }  
 
 //bounce off walls
 if (x > width){
   x = width;
   vx *= -1;
 }
 if (x == 0){
   x = 0;
   vx *= -1;
 }
}



