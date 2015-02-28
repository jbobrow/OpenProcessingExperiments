
//Luis Romero Ballesta, 1ºASIX(TARDA),Professor: Isaac Muro
//Assignatura: Programació

//Cara Mickey Mouse PROGRAMACIÓ

    //Caracteristiques de la cara Mickey Mouse

void setup (){
  size (500,500);
}


void draw (){
  
  //Cara Mickey Mouse
  PImage fondo = loadImage ("mick2.png");
  background (fondo);
  noStroke ();
  fill (10,10,10);
  stroke (10,10,10);
  strokeWeight(2);
  ellipse ( 250,290,310,300);
  fill (255,203,138);
  noStroke ();  
  arc (260,435,130,110,12.35,16.50);



  //Orelles Mickey Mouse
  fill (10,10,10);
  ellipse (130,125,170,200);
  ellipse (380,130,170,200);  
  
  
 
  
 
  //Ulls Mickey Mouse
  stroke (10,10,10);
  strokeWeight (5);
  fill (255,203,138);
  arc (220,285,150,230,9.20,11.50);   
  arc (288,292,155,240,4.20,6.50);
  noStroke ();
  triangle(220, 280, 300, 280, 250, 182);
  noStroke ();
  noFill ();
  ellipse (250,320,200,80);
 
 
 
 
 //Pupil·la Ulla Mickey Mouse
 stroke (10,10,10);
 strokeWeight (5);
 fill (255,255,255);
 ellipse (230,240,60,120);
 ellipse (285,245,40,90);
 fill (10,10,10);
 ellipse (280,265,20,50);
 ellipse (245,265,20,50);
 
 
 
 
 //Boca i Nas Mickey Mouse
 
 noStroke ();
 fill (255,203,138);
 ellipse (260,370,300,180);  
 fill (5,5,5);
 stroke (10,10,10);
 strokeWeight (1);
 ellipse (260,330,80,40); 
 stroke(10,10,10);
 strokeWeight (12);
 noFill();
 arc (255,296,110,30,3.14,6.28);
 noFill ();
 arc (260,336,220,110,19.10,21.80);
 stroke(10,10,10);
 strokeWeight (9);
 noFill();
 arc (165,367,40,60,3.25,4.45);
 stroke(10,10,10);
 strokeWeight (9);
 noFill();
 arc (353,363,40,60,5.10,6.28);
 fill (10,10,10);
 arc (260,385,120,90,6.31,9.35);
 fill (255,3,3);
 arc (260,395,110,80,6.31,9.35);
 line (260,428,260,390);
  

 
 
 
 
 
  
 




}

