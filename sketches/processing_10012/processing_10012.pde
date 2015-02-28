
//Autor: Miguel Vilachá
//IDEP 2010
//Cuadro de Miro Estatico
 
                
 
 void setup()
{
  size(640,460);
  frameRate(25);
  noStroke();
  smooth(); 
  noCursor();
} 
int value = 0;

void draw() {
  fill(value);
 ellipse(25, 25, 50, 50);
}

void mouseDragged() 
{
  value = value + 5;
  if (value > 255) {
    value = 0;
  }

 //Verde  
  fill(61,71,63);
  ellipse(156, 40, 23, 26);   
 //blur
  fill(50,100,60,40);
  ellipse(156, 40, 40, 48);  
 
  //Azul!
  fill(65,104,173);
  ellipse(96, 209, 18, 19); 
  fill(70,109,178);
  ellipse(98, 210, 20, 20);  
  //blur
  fill(70,109,178,50);
  ellipse(98, 210, 40, 40);
  
  //roja
  fill(140,65,52);
  ellipse(470, 160, 32, 32);
  
  fill(182,90,80,40);
  ellipse(475, 165, 44, 52);
  
  //Negras
  fill(20,30,20);
  ellipse(556, 103, 30, 30);
  //blur
  fill(20,30,20,70);
  ellipse(556, 105, 45, 45);
  
  fill(30,40,30);
  ellipse(610, 185, 22, 22);
  //Blur
  fill(70,66,57,40);
  ellipse(610, 185, 42, 42); 
  
  //LINEA
  fill(46,46,48);
  rotate(-0.07);
  rect(-30,270,880,50);
  fill(76,78,77);
  rect(-40,310,880,350);
  // linia extra
  fill(55,55,55,55);
  rect(-40,310,800,300);
  
  //ELIPSES 2 despues para q este sobre el fill
  //YEllow 
  fill(81,61,24,70);
  ellipse(420, 412, 64, 74);
  fill(160,79,46,60);
  ellipse(420, 407, 52, 52);
  fill(245,92,2,70);
  ellipse(420, 407, 42, 42);
  
  //RED
  fill(100,40,30,80);
  ellipse(135, 408, 27, 27);
  fill(93,50,41,50);
  ellipse(135, 419, 50, 50);
  
 //blur general
  filter(BLUR, 2.5); 
  
  //POsteriro  al blur para q no lo afecte
  fill(170,40,40);
  ellipse(300, 140, 300, 200); 
}

