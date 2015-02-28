
//Laia Burgueño
//Creació d'un sketch que es mogui a unes velocitats X i Y, i un cop estigui en els límits de la finestra, fent un click amb el mouse es canvï la posició del sketch, i per últim depenent del quadrant en el que es trobi el color del fons canviarà.
//P_3

int _x;
int _y;
int velX;
int velY;
int colorback;
 
 
void setup(){
  //noCursor();
  background(230,255,255);
  size(600,600);
  _x = width/2;
  _y = height/2;
  //diferents velocitats perquè reboti de manera irregular
  velX = 3;
  velY = 5;
  colorback = color(230,255,255);
  rectMode(CENTER);
}
 

void draw(){
  background(colorback);
  
//CAP
  fill(61,198,244);
  stroke(0);
    ellipse(_x,_y,150,150);
  
//COS BLANC
  fill(255);
  strokeWeight(1);
  ellipse(_x,_y+10,130,120);
  
//ULL ESQUERRE
  ellipse(_x-20,_y-40,40,50);
  
//ULL DRET
    ellipse(_x+20,_y-40,40,50);
  
//ULL NEGRE ESQUERRE
  fill(0);
   ellipse(_x-15,_y-35,15,20);
  
  
//ULL NEGRE DRET
  ellipse(_x+15,_y-35,15,20);
  
//ULL BLANC DRET
  stroke(255);
  fill(255);
  ellipse(_x+12,_y-35,4,7);
  
  
//ULL BLANC ESQUERRE
  ellipse(_x-12,_y-35,4,7);
  //BOCA
  arc(_x,_y+10,100,80,0,PI);
   line(_x,_y,_x,_y+50);
line(_x,_y,_x,_y-7);

//NAS
  stroke(0);
  fill(250,76,79);
  ellipse(_x,_y-16,20,20);
  fill(255);
  stroke(255);
  ellipse(_x-2,_y-22,4,4);
  
  

  
//CASCAVELL
stroke(0);
 fill(247,203,40);
 ellipse(_x,_y+73,28,28);
  rect(_x+1,_y+67,27,2,4);
 fill(198,160,18);
 ellipse(_x,_y+76,5,5);


    //BOCA
    fill(255);
  arc(_x,_y+10,100,80,0,PI);
   line(_x,_y,_x,_y+50);
line(_x,_y,_x,_y-7);

//BIGOTIS
line(_x-15,_y+5,_x-60,_y+5);
line(_x+15,_y+5,_x+60,_y+5);
line(_x-14,_y+15,_x-55,_y+25);
line(_x+14,_y+15,_x+55,_y+25);
line(_x-14,_y-1.5,_x-54,_y-20);
line(_x+14,_y-1.5,_x+54,_y-20);


 //POSICIONS X i Y
    _x = _x+velX;
    _y = _y+velY; 
 
//Posició X
  if((_x-140<0)||(_x+90>width)){
    velX = -velX;
  }
//Posició Y
  if((_y-65<0)||(_y+80>height)){
    velY = -velY;
  }
//En funció del quadrant en el que l'sketch es troba, aquest canvia de color.
//Si es troba en el quadrant 1
  if(((_x > 0)&&(_x < width/2))&&((_y > 0)&&(_y < height/2))){
    colorback= color(250,205,149);
  }
  //Si es troba en el quadrant 2
  if(((_x > width/2)&&(_x < width))&&((_y > 0)&&(_y < height/2))){
    colorback= color(218,250,149);
  }
  //Si es troba en el quadrant 3
  if(((_x > width/2)&&(_x < width))&&((_y > height/2)&&(_y < height))){
    colorback= color(250,215,248);
  }
   //Si es troba en el quadrant 4
  if(((_x > 0)&&(_x < width/2))&&((_y > height/2)&&(_y < height))){
    colorback= color(240,245,124);
  }


   
 
}
 
void mousePressed()
{
  _x=(mouseX);
  _y=(mouseY);
 
}




