
int posX, posY, velX, velY;
int a, b1, b2, c, d;
color colorback;

void setup(){
  size(800,800);
  background(255,170,0);
  
  posX=width/2; 
  posY=height/2; 
  velX=8;
  velY=8;
  a=274; //Els punts dels extrems laterals coincideixen amb les linies exteriors centrals, que estan a 274 de la 'x'.
  b1=70; //El punt mes baix es la linia exterior d'abaix, que este a 70 de la 'y'.    
  b2=240; //El punt mes alt es el de l'ull, que esta colocat a -100 de la 'y' i te radi 140 (140+100=240).
  c=80; //Mida 'x' del nas.
  d=40; //Mida 'y' del nas.
  colorback=0; //Color inicial del nas.
}

void draw(){  
  background(255,170,0);
  
  //Redeterminar les posicions perque el dibuix es mogui amb Random Walker: 
    posX = posX+(int)random(-30,30); 
    posY = posY+(int)random(-30,30);
    
  //Determinar la posiciÃ�Â³ inicial del dibuix:
    dibuixarGarfield(posX,posY); 
    
  //Delimitar el Random Walker perquÃ�Â¨ no surti de la finestre: 
    //Cada cop que el dibuix toqui un dels marges, tornarÃ�Â  al centre de la finestra.
    if((posX<a) || (posX>width-a)){
      posX = width/2;  
    }    
    if((posY<b2) || (posY>height-b1)){
      posY = height/2; 
    }
          
  //Canvi de tonalitat del nas segons la seva posiciÃ�Â³ a la finestra:
    nasGarfield(posX,posY);
    
    if(posX<=width/4){ //Al primer quart vertical de la finestra, el nas variarÃ�Â  en random dins les tonalitats grises.
      colorback = color(random(100,255),168,215); //Colors entre (100,168,215) i (255,168,215).
    }
    if((posX>width/4)&&(posX<=width/2)){ //Al segon quart vertical de la finestra, el nas variarÃ�Â  en random dins les tonalitats blaves.
      colorback = color(0,random(100,255),215); //Colors entre (0,100,215) i (0,255,215):
    }
    if((posX>width/2)&&(posX<=3*width/4)){ //Al tercer quart vertical de la finestra, el nas variarÃ�Â  en random dins les tonalitats liles.
      colorback = color(random(100,255),0,215); //Colors entre (100,0,215) i (255,0,215).
    }
    if((posX>3*width/4)&&(posX<=width)){ //A l'Ã�Âºltim quart vertical de la finestra, el nas variarÃ�Â  en random dins les tonalitats roses.
      colorback = color(234,random(100,255),168); //Colors entre (234,100,168) i (234,255,168).
    }
} 

void dibuixarGarfield(int _x,int _y){  
//DIBUIX GRAFIELD:   
  //boca:  
    stroke(0);
    fill(240,220,109);
    ellipse(_x-80,_y,250,130);
    ellipse(_x+80,_y,250,130);    
    //elipse beige per tapar:
    stroke(240,220,109);
    fill(240,220,109);    
    ellipse(_x,_y+22,55,55);
    
  //ull esquerre:
    stroke(0);
    fill(255);
    ellipse(_x-60,_y-100,200,280);
     
  //ull dret:
    stroke(0);
    fill(255);
    ellipse(_x+60,_y-100,200,280);    
    //linia de negra separaciÃ�Â³:
    stroke(0);
    strokeWeight(2);
    line(_x,_y-213,_x,_y+50);    
    //rectangle blanc per tapar:
    stroke(255);
    fill(255);
    rect(_x-100,_y-213,97,213);
    
  //Pupila esquerra:  
    stroke(0);
    fill(0);
    ellipse(_x-40,_y-100,20,50);
    
  //Pupila dreta:  
    ellipse(_x+40,_y-100,20,50);
  
  //nas:  
    stroke(0);
    fill(colorback);
    ellipse(_x,_y+20,c,d);
    
  //ratlles esquerra:    
    //abaix (de dins cap a fora):
    stroke(0);
    strokeWeight(2);
    line(_x-230,_y+20,_x-222,_y+40);
    line(_x-240,_y+15,_x-225,_y+50);
    line(_x-250,_y+10,_x-228,_y+60);
    line(_x-260,_y+5,_x-231,_y+70);    
    //centre (de dins cap a fora):
    line(_x-250,_y-100,_x-250,_y-80);
    line(_x-258,_y-105,_x-258,_y-75);
    line(_x-266,_y-110,_x-266,_y-70);
    line(_x-274,_y-115,_x-274,_y-65);
    //adalt (de dins cap a fora):
    line(_x-222,_y-200,_x-230,_y-180);
    line(_x-225,_y-210,_x-240,_y-172);
    line(_x-228,_y-220,_x-250,_y-170);
    line(_x-231,_y-230,_x-260,_y-165);
    
  //ratlles dreta:  
    //abaix (de dins cap a fora):
    stroke(0);
    strokeWeight(2);
    line(_x+230,_y+20,_x+222,_y+40);
    line(_x+240,_y+15,_x+225,_y+50);
    line(_x+250,_y+10,_x+228,_y+60);
    line(_x+260,_y+5,_x+231,_y+70);    
    //centre (de dins cap a fora):
    line(_x+250,_y-100,_x+250,_y-80);
    line(_x+258,_y-105,_x+258,_y-75);
    line(_x+266,_y-110,_x+266,_y-70);
    line(_x+274,_y-115,_x+274,_y-65);    
    //adalt (de dins cap a fora):
    line(_x+222,_y-200,_x+230,_y-180);
    line(_x+225,_y-210,_x+240,_y-172);
    line(_x+228,_y-220,_x+250,_y-170);
    line(_x+231,_y-230,_x+260,_y-165);        
}

void nasGarfield(int _x,int _y){  
//NAS GRAFIELD: 
    stroke(0);
    fill(colorback); //Determinem 'colorback' el color del nas. 
    ellipse(_x,_y+20,c,d);
}
