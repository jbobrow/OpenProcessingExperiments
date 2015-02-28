
//Nil Vidal
//dibuix que es mogui amb una velocitat X i una velocitat Y i que quan es trobi els limits de la pantalla que reboti. Clicant el ratolí el dibuix canvia la seva posició. Depenent del quadrant en que es troba el dibuix, el color de fons es un o un altre.

int posX;
int posY;
int velX;
int velY;
color colorback;


void setup(){
  //noCursor();
  background(255);
  size(800,800);
  posX=4*width/5;
  posY=2*height/7;
  //la velocitat vertical serà major que la horitzontal aixi el moviment no serà igual cada cop
  velX=5; 
  velY=7;
  colorback=color(255);
  
}

void draw(){
  background(colorback);
  dibuixarCotxe (posX,posY);

  //actualitzem posicions
  posX = posX+velX;
  posY = posY+velY;
  
   //comprovem la posicio X
  if((posX-55<=0)||(posX+55>=width)){
    velX = -velX; //quan es compleixi la funció anterior la velocitat horitzontal cambiarà de signe, per tant, de sentit
  } 
    //comprovem la posicio Y
  if((posY-50<=0)||(posY+52>=height)){
    velY = -velY; //quan es compleixi la funció anterior la velocitat vertical cambiarà de signe, per tant, de sentit
  } 
  
  //es canvïa el color del fons en función del quadrant en el que es troba,1er i 3er quadrant=granate i 2n i 4rt quadrant=verd
  if((posY<=height/2)&&(posX<=width/2)){colorback=color(100,0,0);
  }
   
  if((posY<=height/2)&&(posX>=width/2)){colorback=color(0,100,0);
  }
  
  if((posY>=height/2)&&(posX<=width/2)){colorback=color(0,100,0);
  }
  
  if((posY>=height/2)&&(posX>=width/2)){colorback=color(100,0,0);
  }
}
  
void mousePressed()
{
posX=(mouseX);//en funcio de la posició X on cliques, el cotxe canvia a una posició X o una altra
posY=(mouseY);//en funcio de la posició Y on cliques, el cotxe canvia a una posició Y o una altra
}

void dibuixarCotxe(int _x,int _y) 
{

 
//miralls
ellipse(_x-55,_y-10,15,10);
ellipse(_x+55,_y-10,15,10);

//vidre
stroke(0);
strokeWeight(4);
fill(182,242,250);
 rect(_x-50,_y-50,100,60,40,40,0,0);
 
 //parabrises
strokeWeight(2);
line(_x+2,_y-5,_x+30,_y-30);

 
 //rodes
 fill(0);
 rect(_x-50,_y+2,15,50,0,0,5,5);
 
 rect(_x+35,_y+2,15,50,0,0,5,5);
 
 //part central
 fill(255,0,0);
 rect(_x-60,_y-10,120,50,30,30,15,15);
 
 //llums esquerra
 strokeWeight(1);
 fill(255,247,3);
 ellipse(_x-45,_y+5,20,20);
 ellipse(_x-35,_y+20,10,10);
 
 //llums dreta
 fill(255,247,3);
 ellipse(_x+45,_y+5,20,20);
 ellipse(_x+35,_y+20,10,10);
 
 //matricula
 fill(255);
 rect(_x-20,_y+25,40,10);
 
 //lletres matricula
textSize(7);
fill(0);
 text("0637 FHP",_x-14,_y+33);
 
 //mercedes
 fill(200);
ellipse(_x,_y,12,12);
line(_x,_y,_x,_y-6);
line(_x,_y,_x-4.5,_y+3);
line(_x,_y,_x+4.5,_y+3);

//radiador
line(_x-22,_y+12,_x+22,_y+12);
line(_x-22,_y+14,_x+22,_y+14);  
line(_x-22,_y+16,_x+22,_y+16);
line(_x-22,_y+18,_x+22,_y+18);


}


