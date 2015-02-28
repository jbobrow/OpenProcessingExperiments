
// Sergio Ullod  Práctica 3
//Moviment del personatge dins de la pantalla
 
//definim variables
int _x;
int _y;
int velX;
int velY;
int colorback; 
//donem valor a les variables, i diem aixi la posició i la velocitat en els 2 vectors
 
void setup(){
size(1000,700);
  _x = width/2;
  _y = height/2;
  velX = 10;
  velY = 7;
   
  
    
}
 
void draw(){
   
background(colorback);
int a;
int b;
 
a=300;
b=300;
 
//diem que la posicio anira variant, sumant-li cada cop la velocitat en x i y
 
//posició 
  _x = _x+velX;
  _y = _y+velY;
 
strokeWeight(4);
stroke(0,0,0);
fill(35,175,14);
 
//orelles
triangle(_x-150,_y-250,_x-10,_y+10,_x-200,_y+10);
triangle(_x+150,_y-250,_x+10,_y+10,_x+200,_y+10);
 
//cap
ellipse(_x,_y,a+a/2,b+b/2);
 
//front
arc(_x,_y-170,a/1.6, b/1.7, -PI, 0);
 
//ull
fill(255,255,255);
ellipse(_x,_y-80,a/1.5,b/1.5);
 
//blau Ull
fill(27,178,203);
ellipse(_x,_y-80,a/3,b/3);
 
//nineta Ull
fill(0,0,0);
ellipse(_x,_y-80,a/6,b/6);
 
//Brillo Ull
fill(255,255,255);
ellipse(_x+10,_y-90,a/20,b/20);
 
 
//boca
fill(35,175,14);
arc(_x,_y+60,a/1.2,b/1.2,0,PI*1);
 
//establim els limits de la pantalla tenint en compte la forma del personatge.
 
  //posicio X
  if((_x-232<0)||(_x+264>width)){
    velX = -velX;
  }
    //posicio Y
  if((_y-258<0)||(_y+228>height)){
    velY = -velY;
}

//canvi de color del fons segons la posició on es troba el personatge
  
  //quadrant 1
  if(((_x > 0)&&(_x < width/2))&&((_y > 0)&&(_y < height/2))){
    colorback= color(160,170,0);
  }
  
  //quadrant 2
  if(((_x > width/2)&&(_x < width))&&((_y > 0)&&(_y < height/2))){
    colorback= color(177,33,177);
  }
  
  //quadrant 3
  if(((_x > width/2)&&(_x < width))&&((_y > height/2)&&(_y < height))){
    colorback= color(150,0,0);
  }
  
   //quadrant 4
  if(((_x > 0)&&(_x < width/2))&&((_y > height/2)&&(_y < height))){
    colorback= color(10,10,210);
  }
 
}


//Al clicar el retón, el dibujo se situa en el centro de la pantalla
void mousePressed(){
    
  
  _x=width/2;
  _y=height/2;
    
}
