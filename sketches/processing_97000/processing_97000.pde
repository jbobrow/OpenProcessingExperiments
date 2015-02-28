
// David Haro Torne
 //  2n GEDI - 3r trimestre
   //Informàtica 2013 - G03
  // Elisava
 
 
//definim tipus de variable
int posX, posY, velX, velY; //posisio i velocitat.
float midaMaxima=500; //Parametren que servira per fer el cap gra, fins a un limit de 500
float midaBola=300; // Oarametre que serveix per indicar la mesura mínima que ha de tenir el cap
float velBola=3; // Velositat a la que el cap es fa gran i petit
int estat = 1; // Definim l' estat 1 del color de mans i peus
color value=color(126,49,1); // color marro
//es defineix la grandaria de la finestra així com el color del fons (negre)
void setup()
{
smooth();
background(0);
stroke(0);
strokeWeight(0);
size(1500,1000); // la findestre está pensada gran per poder-se obrir des de els ordinadors de la universitat.
  posX = width/4; // referencia central de tots els coses
  posY = height/4; //referencia central de tots els coses
  velX = 3; //Velocitat a la que es mouran tots els cossos
  velY = 3;//Velocitat a la que es mouran tots els cossos
noCursor(); // el cursos queda substituït per l' espassa que en aquet seminaria no te massa sentit pero que formarà part dle joc final.
}

 

 
void draw()
{

    //actualitzem posicions
  posX = posX+velX;
  posY = posY+velY;
  background(0);// es posa un bakcground al inici de tot del típus (0), perque no quedi el recorregut de l' "espasa gedi" i el fons és negre.
  //ara es fabrica la espasa l'àser, on és un conjunt de formes que es mouen a la vegada seguint el cursor.
  fill(220,255,28);
stroke(220,255,28);
rect(mouseX,mouseY,8,140);// aquesta espasa s' anira movent per tota la finestra, i farà de curssor.
ellipse(mouseX+4,mouseY,8,8);
 
fill(188,188,188);
stroke(188,188,188);
rect(mouseX-6,mouseY+140,20,5);
rect(mouseX,mouseY+140,8,50);
rect(mouseX-6,mouseY+190,20,5);
ellipse(mouseX+4,mouseY+193,11,11);
 
fill(255,9,0);
stroke(255,9,0);
ellipse(mouseX+4,mouseY+175,4,4);
 
 
// hem agafat el Kenny del seminari 1 
fill(-mouseX/4+255,-mouseX/4+100,-mouseX/4+3); // el color del cos encara caniva segons la posisio del cursosr
arc(300+posX,400+posY,300,300,-PI,0); // cos en moviment quan la finestra s'obra
  

stroke(-mouseY/4+255,-mouseY/4+100,-mouseY/4+3); // el color del cos encara canivar seogns la posició del curssor.
fill(mouseY/4+255,mouseY/4+100,mouseY/4+3); // el color del cos enscara canvia segons la posició del curssor
ellipse(300+posX,170+posY,midaBola,midaBola);//cos en moviment quan la finestra s' obra
  

fill(255,100,3);
rect(205+posX,400+posY,200,45);// cos en moviment quan la finestra s' obra.
  
stroke(126,49,1);
fill(value);
rect(170+posX,posY+445,265,10);// cos en moviment quan la finestra s' obra
  
stroke(0);
strokeWeight(2);
fill(255,100,3);
ellipse(300+posX,175+posY,190-mouseX/6,165-mouseX/6);//cos en movmient i canvi de color segons el curssor
line(300+posX,400+posY,posX+300,posY+325);// cos en moviment
strokeWeight(2);
fill(126,49,1);
ellipse(300+posX,162+posY,160,135);//cos en moviment
  
stroke(250,205,177);
strokeWeight(2);
fill(250,205,177);
ellipse(300+posX,162+posY,105,135);//cos en moviment
stroke(255);
strokeWeight(2);
fill(255);
ellipse(274+posX,162+posY,51,65);//cos en moviment
ellipse(325+posX,162+posY,51,65);//cos en moviment
  
stroke(0);
strokeWeight(1);
fill(0);
ellipse(279+posX,160+posY,10,10);
ellipse(320+posX,160+posY,10,10);
  
stroke(126,49,1);
strokeWeight(1);
fill(value);
ellipse(170+posX,400+posY,50,50);// cos en moviment
ellipse(435+posX,400+posY,50,50);// cos en moviment
ellipse(190+posX,395+posY,30,30);//cos en moviment
ellipse(410+posX,395+posY,30,30);// cos en moviment
   //comprovem posiciÃ³ X
  if((posX<-150)||(posX>width-450)){ // s' han posat valors perque el cos xoqui contra la finestra, no es contempla quan el cap es fa gran.
    velX = -velX;
  } 
  //comprovem posiciÃ³ Y
  if((posY<-35)||(posY>height-450)){// s' han posat valors perque el cos xoqui contra la finestra, no es contempla quan el cap es fa gran.
    velY = -velY;
  }
     
   /*defineixo la velocitat que tindra el cercle gran i el limit de la seva mida*/
midaBola=midaBola+velBola;
if (midaBola>=midaMaxima){
      midaBola=300;}

}



void mousePressed() {
  if (estat == 1) { 
    estat = 2; 
    value=color(60,222,70); 
  } else { 
   if (estat==2) { 
   estat = 3; 
   value=color(237,26,26); 
   } else{ 
   if (estat==3) { 
   estat=1;
   value= color(126,49,1); 
   }  
   }
   /*defineixo la velocitat que tindra el cercle gran i el limit de la seva mida*/
midaBola=midaBola+velBola;
if (midaBola>=midaMaxima){
      midaBola=5;}

}

}



