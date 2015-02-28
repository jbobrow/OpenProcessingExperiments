
//Codi Paula. L'objectiu és que el dibuix animat faci el Random Walker
//A més, a més que canvii el color dels ulls de tots els moixos amb el click del mouse

int numMoixos = 5;
int x=10;
int y=18;
color colorback;


//es crea una matriu de posicionsX com "numMoixos" elements:
float[] posX = new float[numMoixos];
//el mateix per posicionsY:
float[] posY = new float[numMoixos];
//i per velocitatsX:
float[] velX = new float[numMoixos];
//i velocitatsY:
float[] velY = new float[numMoixos];
color[] colorMoixos=new color [numMoixos];

void setup(){
  size(width+500,height+500);
  colorback=color(240, random(70,90),99);//per que els ulls no comencin amb el color negre

  //inicialitzem posicions i velocitats:
  for(int i = 0; i<numMoixos; i++){
 
    posX[i] = (posX[i]+width/2)+(int)random(-10,10);
    posY[i] = (posY[i]+height/2)+(int)random(-10,10);

    velX[i] = random(2,6);
    velY[i] = random(2,6);
    colorMoixos[i]= color(random(255),random(255),random(255));
}
}

void mousePressed(){
  //Amb el click del mouse es donen noves posicions inicials dels moixos i cambia el color dels ulls
   colorback= color (mouseX,mouseY,25);
   for(int i = 0; i<numMoixos; i++){
     posX[i] = mouseX;
     posY[i] = mouseY;
   }
}

void draw(){
 background(66,42,165); //fons no canvia color
 
  // bucle 
  for(int i = 0; i<numMoixos; i++){
    //actualitzem posicions
    posX[i] += random(-10,10);
    posY[i] += random(-10,10);

    //limits X que reboti cara
    if((posX[i]-145<0)||(posX[i]+145>width)){
      velX[i] = -velX[i];
    } 
    
    //limits Y que reboti bigots
    if((posY[i]-80<0)||(posY[i]+80>height)){
      velY[i] = -velY[i];
    } 
    
//Dibuix Chococat

//orelles
stroke(0);
fill(0);
triangle(posX[i]-30,posY[i]-75,posX[i]-60, posY[i]-15,posX[i]-90,posY[i]-80);
triangle(posX[i]+30,posY[i]-75, posX[i]+60,posY[i]-15,posX[i]+90,posY[i]-80);
fill(255);
triangle(posX[i]-20,posY[i]-65,posX[i]-50, posY[i]-5,posX[i]-80,posY[i]-70);
triangle(posX[i]+20,posY[i]-65, posX[i]+50,posY[i]-5,posX[i]+80,posY[i]-70);
//bigots
stroke(0);
strokeWeight(5);
line(posX[i]-150,posY[i]+20,posX[i]-60,posY[i]+5);
line(posX[i]+150,posY[i]+20,posX[i]+60,posY[i]+5);
line(posX[i]+150,posY[i]-20,posX[i]+60,posY[i]-5);
line(posX[i]-150,posY[i]-20,posX[i]-60,posY[i]-5);
//cara
stroke(0);
fill(0);
ellipse(posX[i],posY[i],180,160);
//ulls amb colorback perque canviin de color amb el click!
stroke(colorback);  
fill(colorback);
ellipse(posX[i]+37.5,posY[i],50,50);
ellipse(posX[i]-37.5,posY[i],50,50);
stroke(colorback);
fill(0);
ellipse(posX[i]+30,posY[i],28,28);
ellipse(posX[i]-30,posY[i],28,28);
//nas
stroke(180,119,58);
fill(180,119,58);
ellipse(posX[i],posY[i]+30,15,10);

//ELIMINAM fons nit lluna amb el·lipses solapades AMB //
stroke(255,217,80);
fill(255,217,80);
//ellipse(width/2,height/2,400,400);
stroke(66,42,165);
fill(66,42,165);
//ellipse(width/4,height/2,380,380);

}
}





