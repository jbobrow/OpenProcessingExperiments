
// Ainoa Abella Garcia - Informàtica:pràctica 2_b - Grup 02

//pàgina
void setup ()
{
   size (500,500);//tamany
   background(255,232,255); //fons estàtic
   smooth(); // qualitat dibuix
   movY=height/2; // zona per on es mouen les bombolles
   f = createFont("Arial",10,true);// característiques de la lletra utilitzada
}


//declaració variables (moviment i lletra)
int movY;
PFont f;

//dibuix
void draw()
{
  noCursor(); // amagar cursor
  background(255,232,255); // fons de la pantalla 
  
     // Taulell (on està recolzada la cassola)
  fill(49,19,15); rect(0,400,500,300);
         
  
  // Bombolles que surten de la cassola
  stroke(255,255,255);
  strokeWeight(2);
  fill(111,223,250,90);
  movY=movY-1; // Equació velocitat moviment de les bombolles
  ellipse(width/2,movY,30,30); // bombolla 1
  ellipse(width/3,movY+30,40,30);//bombolla 2
  ellipse(width/5,movY-30,30,30);//bombolla 3
  ellipse(width/4,movY+40,40,40);//bombolla 4
  ellipse(width/6,movY-40,30,30);//bombolla 5
    // Per a que les bombolles surtin de manera constant:
    if(movY<0){
    movY=width/2;
    }
    
  // Foc
  fill(240,57,51);
  stroke(149,22,18);
  strokeWeight(1);
  noStroke(); ellipse(width/2.5,height/1.2,300,170);
  fill(149,22,18); ellipse(width/2.5,height/1.2,300,165); 
  
  // Recepta
  textFont(f); // variable del text
  fill(255,255,255); rect (370,415,80,70);
  textAlign(CENTER); // justificació del text, en aquest cas al centre
  fill(0,0,0); text("Recepta",width*4/5+7,435); //posició del text
  fill(0,0,0); rect (376,455,65,1.2); // linies escrites recepta
  fill(0,0,0); rect (376,470,65,1.2); // linies escrites recepta
  fill(0,0,0); rect (376,440,65,1.2); // linies escrites recepta
  
  // Cassola
  stroke(155,88,2); 
  strokeWeight(5);
  fill(232,121,16);
  noStroke(); ellipse(width/2.5,height/1.2,300,150);
 
  ellipse(width/2.5,height/1.7,250,100);
  ellipse(width/2.5,height/1.5,300,115);
  fill(255,232,2559); ellipse(width/1.45,height/1.48,85,85);
  fill(255,232,2559); ellipse(width/9.2,height/1.48,85,85);
  
  //Substància cassola (simulació poció màgica)
  fill(37+mouseY, 7+mouseX, 242+mouseY); // Canvi de colors de la substància interior cassola en funció de la posició del cursor
  noStroke();ellipse(width/2.5,height/1.7,200,75); 
  
   // Cullera (posició del cursor)
 noStroke(); fill(155,88,2); 
 ellipse(mouseX,mouseY,35,35); // part superior per penjar la cullera amb el forat
 fill(155,88,2); strokeWeight(3);
 fill(155,88,2); 
 rect(mouseX-5,mouseY-7.5,10,90); //per on agafem la cullera (el pal)
 fill(255,232,255); ellipse(mouseX,mouseY,20,20); //part superior cullera forat interior (mateix color que el fons)
 fill(155,88,2); ellipse(mouseX,mouseY+90,40,55); // part on s'agafa el líquid
 
  


}


