
//Luis Romero Ballesta, 1ºASIX(TARDA),Professor: Isaac Muro
//Assignatura: Programació

//Cara Mickey Mouse PROGRAMACIÓ

    //Caracteristiques de la cara Mickey Mouse
/* @pjs preload="llitas.png"; */
int fondo1 = #FF00EF;


void setup (){
  size (500,600);
  smooth();
  
  
}


void draw (){
  stroke (10,10,10);
  strokeWeight (3);
  fill(255,255,255);
  
  
  
  
  
  //Cara Mickey Mouse
  background (fondo1);
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
  ellipse (130,125,mouseX/2,200);
  ellipse (380,130,mouseX/2,200);  
  
  
 
  
 
  //Ulls Mickey Mouse
  stroke (10,10,10);
  strokeWeight (2);
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
 strokeWeight (6);
 fill (255,255,255);
 ellipse (230,240,60,120);
 ellipse (285,245,40,90);
 stroke (10,10,10);
 strokeWeight (5);
 fill (#816969);
 ellipse (280,265,25,50);
 ellipse (245,265,25,50);
 


 
 //Boca i Nas Mickey Mouse
 
 noStroke ();
 fill (255,203,138);
 ellipse (260,370,300,180);  
 fill (mouseY+5,5,5);
 stroke (10,10,10);
 strokeWeight (1);
 ellipse (260,330,90,40); 
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
 fill (mouseY+20,3,3);
 arc (260,395,110,80,6.31,9.35);
 line (260,428,260,390);
 fill (10,10,10);
 text ("Hola, este es el antiguo proyecto Mickey Mouse. En este caso, aplicamos nuevos atributos al antiguo proyecto. Pulsaremos 'q' para ver el fondo de color verde , pulsaremos 'w' para ver el fondo de color gris y finalmente, pulsaremos 'z' para ver el fondo de color azul cielo. Si movem el cursor de dreta a esquerra o viceversa, les orelles s'aumenten o disminueixen, i si el movem d'adalt a baix el nas canvia de color", 80,490,400,500); 

  
}

void mousePressed (){ 
    fondo1 = #FF00EF ;
    stroke (10,10,10);
    strokeWeight (5);
    fill (10,10,10);
    ellipse (280,265,25,50);
    ellipse (245,265,25,50);
    
       
}

void mouseReleased (){
  fondo1 = #050FFF;
   stroke (10,10,10);
    strokeWeight (5);
    fill (10,10,10);
    ellipse (280,265,25,50);
    ellipse (245,265,25,50); 
    fill (#03FF1D);
    ellipse (230,240,60,120);
    ellipse (285,245,40,90);
   
}

 
 
void keyPressed (){
  if(key == 'z' ){
    fondo1 = (#00FFFD);
  }
  if (key == 'q'){
    fondo1 = (#00FF12);
  }
  if (key == 'w'){
    fondo1 = (#D6C7C7);
  }
} 
    
  
 
  


