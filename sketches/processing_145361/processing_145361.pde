
//Codi Paula. L'objectiu és que el dibuix animat es mogui i reboti a les parets de la pantalla. 
//A més, a més que canvii el color dels ulls amb el click del mouse.
 
//Definició de les variables: posició,velocitat,color,etc.
float posX,posY;
float velX,velY;
float a;
float b;
color colorback;

void setup(){
  size(600,600);
  colorback=color(240, random(70,90),99);//per que els ulls no comencin amb el color negre
  background(66,42,165);
  a=width/2;
  b=height/2;
  posX=a;
  posY=b;
  velX=2;
  velY=2;
  noCursor();//per eliminar el cursor  
}
 
void draw(){
background(66,42,165);

//determinar les posicions en funció de les velocitats
posX=posX+velX;
posY=posY+velY;

//funció per determinar la posició inicial
dibuixarChococat(posX, posY);

//per determinar que el dibuix reboti en x quan el dibuix toqui el limit de la pantalla
if((posX-145<0)||(posX+145>width)){velX=-velX;}

//per determinar que el dibuix reboti en Y quan el dibuix toqui el limit de la pantalla
if((posY-80<0)||(posY+80>height)){velY=-velY;}
}


//perque canvii el color dels ulls amb el click del mouse
void mousePressed()
{ colorback= color(mouseX,mouseY,0);
}

 
void dibuixarChococat(float a, float b){
//fons nit lluna amb el·lipses solapades 
stroke(255,217,80);
fill(255,217,80);
ellipse(width/2,height/2,400,400);
stroke(66,42,165);
fill(66,42,165);
ellipse(width/4,height/2,380,380); 
//orelles
stroke(0);
fill(0);
triangle(a-30,b-75,a-60, b-15,a-90,b-80);
triangle(a+30,b-75, a+60,b-15,a+90,b-80);
fill(255);
triangle(a-20,b-65,a-50, b-5,a-80,b-70);
triangle(a+20,b-65, a+50,b-5,a+80,b-70);
//bigots
stroke(0);
strokeWeight(5);
line(a-150,b+20,a-60,b+5);
line(a+150,b+20,a+60,b+5);
line(a+150,b-20,a+60,b-5);
line(a-150,b-20,a-60,b-5);
//cara
stroke(0);
fill(0);
ellipse(a,b,180,160);
//ulls
stroke(colorback);
fill(colorback);
ellipse(a+37.5,b,50,50);
ellipse(a-37.5,b,50,50);
fill(0);
ellipse(a+30,b,28,28);
ellipse(a-30,b,28,28);
//nas
stroke(180,119,58);
fill(180,119,58);
ellipse(a,b+30,15,10);
}

