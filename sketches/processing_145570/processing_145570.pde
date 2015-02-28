

//Max Milà
//peix que es mou amb velX i velY i que quan arriba a entrar en contacte amb un dels límts de la pantalla rebota
//en funció del quadrant en el que es troba el fons canvia de color
//si fas clik el centre del peix es situa on ho hagis fet i el color del fons canvia en funció del quadrant en que facis click
//cal tenir en compte que es pot clickar on es vulgui (fins i tot a un lloc on el peix quedi molt aprop del extrem) doncs el programa modifica la posició escollida fins que el peix hi càpiga





//variables
int posX, posY, velX, velY;
color colorback;

int a;
int b, b1, b2;


void setup(){
  background (255);
  //mida pantalla
  size(700,700);
  //definició posX i posY
  posX=width/2;
  posY=height/2;
  //definició velX i velY
  velX=4;
  velY=6;
  //definició clorback
  colorback=color(0,116,255);
}

void draw(){
  //defició variables
  a=10;
  b=8*a;
  b1=4*a;
  
  //background
  background(colorback);
  //dibuixarPeix
  dibuixarPeix (posX,posY);
  //modificació de les posicions
  posX= posX+velX;
  posY= posY+velY;
 
 //rebot X
 if((posX-8*a<=0)||(posX+6*a>=width)){
   velX = -velX;
 }
 
 //rebot Y
 if((posY-4*a<=0)||(posY+4*a>=height)){
   velY = -velY;
 }
 
 //canvi color fons en funció del quadrant
if((posY<=height/2)&&(posX<=width/2)){colorback=color(0,116,255);
  }
    
  if((posY<=height/2)&&(posX>=width/2)){colorback=color(0,249,255);
  }
   
  if((posY>=height/2)&&(posX<=width/2)){colorback=color(0,255,142);
  }
   
  if((posY>=height/2)&&(posX>=width/2)){colorback=color(0,168,255);
  }

 
 

}
   
void mousePressed()
{
posX=(mouseX);
posY=(mouseY);

if(mouseX<b){
     posX = mouseX+b;
   }
   if (mouseY<b1){
     posY = mouseY+b1;
    }  
   if (mouseX>width-b){
     posX = mouseX-b;
   }
   if (mouseY>height-b1){
     posY = mouseY-b1;
   }

if((posY<=height/2)&&(posX<=width/2)){colorback=color(0,116,255);
  }
    
  if((posY<=height/2)&&(posX>=width/2)){colorback=color(0,249,255);
  }
   
  if((posY>=height/2)&&(posX<=width/2)){colorback=color(0,255,142);
  }
   
  if((posY>=height/2)&&(posX>=width/2)){colorback=color(0,168,255);
  }
}


void dibuixarPeix(int _x, int _y){
  
  fill(0,255,249);
  
    
   triangle(_x-8*a,_y-3*a,_x-8*a,_y+3*a,_x-5*a,_y); //aleta posterior
 
   triangle(_x,_y-3*a,_x-2*a,_y-2*a,_x-2*a,_y-4*a); //aleta dorsal
    
    
   ellipse(_x,_y,12*a,6*a); //cos
    
   triangle(_x,_y+a,_x-2*a,_y,_x-2*a,_y+4*a); //aleta lateral
    
   arc(_x+3*a,_y,4*a,4*a,3*PI/5,PI); //branquia
   arc(_x+3*a,_y,3*a,3*a,3*PI/5,PI); //branquia petita
    
    
   fill(255,255,0); //ull
   ellipse(_x+3*a,_y-a,a,a);
   fill(0); //pupila
   ellipse(_x+3*a,_y-a,a/3,a/3);
    
}







