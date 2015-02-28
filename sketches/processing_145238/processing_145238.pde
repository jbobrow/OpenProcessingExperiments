
//La furgo es mou de forma RANDOM i rebota amb el seu centre 

//Aixi la defineixes com a variable
int velX, velY;
int _x, _y;
int colorback, colorventana, colorcuerpo;

//Inicialitzacions de pantalla, background, etc.
void setup(){
  background(159,240,250);
  colorback = 0;
  colorventana = color(206,250,255);
  
size(800,800);
  _x = width/2;
  _y = height/2;
  velX = 3;
  velY = 3;
  rectMode(CENTER);
}

//S'executa sempre
void draw(){
  background(colorback); 
//COS
  stroke (0);
  strokeWeight(2);
  fill(180,0,0);
  rect(_x,_y,8*400/20,6*400/20); 
 
 //CABEZA
  fill(255,0,0); 
  rect(_x-110,_y+10,3*400/20,5*400/20);

//CRISTAL
  fill(colorventana); 
  rect(_x-120,_y,2*400/20,2*400/20);
  
//LUZ
  fill(255,158,0); 
  rect(_x-135,_y+40,400/40,400/20);
  
//RUEDA DELANTE
  fill(0);
  ellipse(_x-80,_y+60,2*400/20,2*400/20);

//RUEDA DETRÁS
  ellipse(_x+40,_y+60,2*400/20,2*400/20);

//LLANTA DELANTE
  stroke (185);
  strokeWeight(2);
  fill(185);
  ellipse(_x-80,_y+60,400/20,400/20);

//LLANTA DETRÁS
  ellipse(_x+40,_y+60,400/20,400/20);

//ESCAPE
  stroke (0);
  strokeWeight(2);
  fill(0);
  line(_x+80,_y+60,_x+90,_y+60);

//BRILLO
  stroke (255);
  strokeWeight(5);
  fill(255);
  line(_x-135,_y,_x-120,_y-15);

//BRILLO
  line(_x-135,_y+10,_x-110,_y-15);


  //posicio X
  if((_x-140<0)||(_x+90>width)){
    velX = -velX;
  }
    //posicio Y
  if((_y-65<0)||(_y+80>height)){
    velY = -velY;
}

  //esta al quadrant 1
  if(((_x > 0)&&(_x < width/2))&&((_y > 0)&&(_y < height/2))){
    colorback= color(255,0,0);
  }
  //esta al quadrant 2
  if(((_x > width/2)&&(_x < width))&&((_y > 0)&&(_y < height/2))){
    colorback= color(0,255,0);
  }
  //esta al quadrant 3
  if(((_x > width/2)&&(_x < width))&&((_y > height/2)&&(_y < height))){
    colorback= color(0,0,255);
  }
   //esta al quadrant 4
  if(((_x > 0)&&(_x < width/2))&&((_y > height/2)&&(_y < height))){
    colorback= color(255,255,0);
  }
  
//posicio
_x = _x+velX;
_y = _y+velY;

}

void mousePressed()

{
  colorventana = color(mouseX, mouseY,0);

}


