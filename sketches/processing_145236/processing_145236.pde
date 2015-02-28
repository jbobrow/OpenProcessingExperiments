
//programa de Queralt Trepat.
//moviment de fotma RANDOM d'un personatge dins de la pantalla.
//el personatge rebota amb els seus límits

//definim varables de posició, velocitat i color
int _x;
int _y;
int velX;
int velY;
int colorback;



void setup(){
 size(600,600);
  _x = width/2;
  _y = height/2;
  velX = 3;
  velY = 3;
 
 colorback = color(255);

}

void draw(){
  background(colorback);
 
  
//posicions
  _x = _x+velX;
  _y = _y+velY;


//personatge
  //cara
  stroke(0);
  strokeWeight(4); 
  fill(255,255,255);
  ellipse(_x,_y-25,160,120);
  
  //nas
  strokeWeight(3); 
  fill(255,255,0);
  ellipse(_x,_y,15,10);
  
  //ull esquerre
  strokeWeight(2); 
  fill(0);
  ellipse(_x-42,_y-12,10,15);
  
  //ull dret
  ellipse(_x+42,_y-12,10,15);
  
  //bigoti
   stroke(0);
  strokeWeight(4); 
  line(_x+70,_y-20,_x+98,_y-18);
  line(_x+69,_y-9,_x+93,_y-5);
  line(_x+62,_y+2,_x+85,_y+8);
  
  line(_x-70,_y-20,_x-98,_y-18);
  line(_x-69,_y-9,_x-93,_y-5);
  line(_x-62,_y+2,_x-85,_y+8);
  
  //orelles
  fill(255);
  arc(_x-15, _y-75, 100, 80, PI*0.9,PI*1.2); 
  arc(_x+15, _y-75, 100, 80,PI*-0.2,PI*0.1); 
  noFill();
  arc(_x-175, _y-75, 300, 80,PI*-0.2,-0.15); 
  arc(_x+175, _y-75, 300, 80,PI*0.9,PI*1.2);
  
  //llaç
  strokeWeight(3); 
  fill(255,0,0);
  ellipse(_x+32,_y-80,40,40);
  ellipse(_x+52,_y-60,40,40);
  ellipse(_x+32,_y-80,15,15);
  ellipse(_x+52,_y-60,15,15);
  ellipse(_x+42,_y-70,30,30);
  
  
 
  //posicio X
  if((_x-100<0)||(_x+100>width)){
    velX = -velX;
  }
    //posicio Y
  if((_y-100<0)||(_y+37>height)){
    velY = -velY;
  }
  
 //canvi de color del fons segons la posició del personatge
 
  //si està al quadrant 1
  if(((_x > 0)&&(_x < width/2))&&((_y > 0)&&(_y < height/2))){
    colorback= color(210,50,50);
  }
 
  //si està al quadrant 2
  if(((_x > width/2)&&(_x < width))&&((_y > 0)&&(_y < height/2))){
    colorback= color(50,215,50);
  }
 
  //si està al quadrant 3
  if(((_x > width/2)&&(_x < width))&&((_y > height/2)&&(_y < height))){
    colorback= color(50,50,210);
  }
 
   //si està al quadrant 4
  if(((_x > 0)&&(_x < width/2))&&((_y > height/2)&&(_y < height))){
    colorback= color(210,50,210);
  } 
  
}


void mousePressed()
{
 //segons on cliquem amb el ratolí dins de la pantalla la kitty és coloca a la posició on cliquem.
_x = (mouseX);
_y = (mouseY);
}
 




