
//Marina Sarto
//Pràctica3
//moviment del personatge dins la pantalla


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
}


void draw(){
  background(colorback);
  
  
  //POSICIONS X i Y
    _x = _x+velX;
    _y = _y+velY;
  
  
  //forma cap
  stroke(0);
  fill(0);
  ellipse(_x,_y,160,160);
  
  //orella esquerra
  ellipse(_x-65,_y-75,80,80);
 
  //orella dreta
  ellipse(_x+65,_y-75,80,80); 
  
  //forma cara
  stroke(255);
  fill(255);
  ellipse(_x-30,_y-25,65,80);
  ellipse(_x+30,_y-25,65,80);
  ellipse(_x-60,_y+20,35,40);
  ellipse(_x+60,_y+20,35,40);
  ellipse(_x-60,_y+20,35,40);
  ellipse(_x,_y+40,127,80);
  ellipse(_x-58,_y+30,34,25);
  ellipse(_x+58,_y+30,34,25);
  ellipse(_x-55,_y+26,35,55);
  ellipse(_x+55,_y+26,35,55);
  ellipse(_x-53,_y+30,36,55);
  ellipse(_x+53,_y+30,36,55); 
  ellipse(_x,_y,20,20);
  ellipse(_x,_y+50,85,75);
 
  //boca
  stroke(0);
  fill(255);
  arc(_x,_y+10,115,155,PI*0.3,PI*0.7);
  fill(0);
  arc(_x,_y+8,120,135,0,PI);
  fill(255);
  arc(_x,_y+7,125,85,0,PI);
  stroke(255,0,0);
  fill(255,0,0);
  ellipse(_x,_y+70,30,10);
 
  //ulls
  stroke(0);
  fill(255);
  ellipse(_x-15,_y-15,15,40);
  ellipse(_x+15,_y-15,15,40);
  fill(0);
  ellipse(_x-15,_y-2,5,10);
  ellipse(_x+15,_y-2,5,10);
 
  //nas
  fill(255);
  arc(_x,_y+15,60,25,PI*1.2,PI*1.8);
  fill(0);
  ellipse(_x,_y+20,30,15);
  fill(255);
  ellipse(_x-5,_y+17,10,5);
 
 
 //posicionem la X
 if((_x-105<0)||(_x+105>width)){
   velX = -velX;
 }
 
 //posicionem la Y
 if((_y-120<0)||(_y+100>height)){
   velY = -velY;
 }
 
 
 //canviem el color de fons segons on es troba el mickey
 
   //quadrant 1
     if(((_x > 0)&&(_x < width/2))&&((_y > 0)&&(_y < height/2))){
        colorback= color(230,255,255);
     }
  //quadrant 2
     if(((_x > width/2)&&(_x < width))&&((_y > 0)&&(_y < height/2))){
        colorback= color(245,195,110);
     }
  //quadrant 3
     if(((_x > width/2)&&(_x < width))&&((_y > height/2)&&(_y < height))){
        colorback= color(190,255,160);
     }
  //quadrant 4
     if(((_x > 0)&&(_x < width/2))&&((_y > height/2)&&(_y < height))){
        colorback= color(255,255,170);
     }
}

//el cotxe canvia de posició (x i y) quan es clica a qualsevol punt de la pantalla
void mousePressed(){
  _x = (mouseX);
  _y = (mouseY);
}


