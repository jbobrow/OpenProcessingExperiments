
//help from code of misplace_tween on openprocessing by Celeste Martin
//http://openprocessing.org/sketch/56816 - Celeste's original code

boolean inside = false;

//Easing for each letter
float e_easing = 0.3;
float x_easing = 0.2;
float p_easing = 0.2;
float l_easing = 0.4;
float o_easing = 0.2;
float d_easing = 0.3;
float ez_easing = 0.5;

float targetX, targetY;

//Target locations for letters
float e_x;
float e_y;
float x_x;
float x_y;
float p_x;
float p_y;
float l_x;
float l_y;
float o_x;
float o_y;
float d_x;
float d_y;
float e_z;
float e_w;



void setup()
{
  size(600, 600);
  smooth();
  PFont font = loadFont("Knockout-HTF71-FullMiddlewt-48.vlw");
  textFont(font);
  
  textAlign(CENTER,CENTER); //added
  
  e_x = 80;//E
  e_y = 65;
  x_x = 70;//X
  x_y = 90;
  p_x = 30;//P
  p_y = 10;
  l_x = 20;//L
  l_y = 30;
  o_x = 80;//O
  o_y = 20;
  d_x = 30;//D
  d_y = 20;
  e_z = 50;//E
  e_w = 65;

 
}

void draw()
{
  background(255);
  noFill();
  //rect(300,300,50,20); //I drew this so I could see your "hit zone"
  
  
  //One nice boolean to check if we're inside "the zone", to reduce our code
  if(mouseX>300 && mouseX<350 && mouseY>300 && mouseY<320){
     inside=true; 
  } else {
     inside=false; 
  }
  
  
  
  //functions for moving letters
  fill(0);
  E_move();
  X_move();
  P_move();
  L_move();
  X_move();
  P_move();
  L_move();
  O_move();
  D_move();
  EZ_move();

  
}
  
  

