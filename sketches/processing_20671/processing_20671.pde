


PImage img;

float a;
float b;
float c;
float d;
float w = 20;
float h = 20;
float wp = 5;
float hp = 5;
float wi = 12;
float hi = 12;
float s;
float f;
float g;
float j;
float angle = 0;
float scalar = 1;
float angleInc = PI / 2.5;

int x; // variable de la position x
int y; // variable de la position y

//---------------------------------------------------------------------------------------------------------------

void setup() {
  size(400,400);
  background(0);
  colorMode(RGB);  
  smooth();
  
 

  img = loadImage("background terre et lune.jpg"); //background de la lune


}

// -------------------------------------------------------------------------------------------------------------------

void draw() {

  
  // variables 
  a = x+13;
  b = y-23;
  c = x-17;
  d = y-23;
  x = 192;
  y = 90;
  
  //---------------------------------------------------------------------------------------------------------
  
  //  Cacher le curseur 
  if (keyPressed){
    if ( key =='q'|| key == 'Q'){
    noCursor();
  }
}

// Montrer le curseur
  if (keyPressed){
    if ( key =='w'|| key =='W'){
    cursor();
    }
     
  }
  
  //-----------------------------------------------------------------------------------------------------------
  
  
  
  stroke(0);
  strokeWeight(1);
  noStroke();
  
  // background de lune
  image(img,0,0);
    
  // bulle de verre
  noStroke();
  fill(37, 173, 165,100);
  ellipse(x, y, 150, 150); 

  // extra-terrestre
   stroke(0);
  strokeWeight(0.6);
  fill(3, 129,8);
  ellipse(x-2, y-8, 75, 75); 
  

  

  // oeil droit
  fill(255, 255, 255);
  ellipse(x+13, y-23, 22, 22); 

  // oeil gauche
  fill(255, 255, 255);
  ellipse(x-17, y-23, 22, 22); 

  
  // soucoupe
  fill(99, 100, 100);
  ellipse(x+2, y+40, 300, 80); 
  
  // oreille droite
  fill(3, 129, 8);
  triangle(x+19, y-34, x+24, y-30, mouseX/50+(x+42), mouseY/50+(y-48)); 
  ellipse(mouseX/50+(x+42), mouseY/50+(y-48), 5, 5); // oreille droite
  
  // oreille gauche
  triangle(x-22, y-35, x-25, y-30, mouseX/75+(x-40), mouseY/75+(y-51)); 
  ellipse(mouseX/75+(x-40), mouseY/75+(y-51), 5, 5);

  //--------------------------------------------------------------------------------------------------------------------

  // Iris et pupilles - variables
  float radians = atan2(mouseY-b,mouseX-a);
  float distance = sqrt(pow(mouseY-b,2)+pow(mouseX-a,2));
  float distance2 = sqrt(pow(mouseY-d,2)+pow(mouseX-c,2));
    
  fill(255,25,5);

  // Iris
  fill(255,25,5);
  ellipse(cos(radians)*min(distance,w/2-wi/2)+a,sin(radians)*min(distance,h/2-hi/2)+b,wi,hi);
  ellipse(cos(atan2(mouseY-d,mouseX-c))*min(distance2,w/2-wi/2)+c,sin(atan2(mouseY-d,mouseX-c))*min(distance2,h/2-hi/2)+d,wi,hi);
  fill(0);
  
  // Pupilles
  ellipse(cos(radians)*min(distance,w/2-wp/2)+a,sin(radians)*min(distance,h/2-hp/2)+b,wp,hp);
  ellipse(cos(atan2(mouseY-d,mouseX-c))*min(distance2,w/2-wp/2)+c,sin(atan2(mouseY-d,mouseX-c))*min(distance2,h/2-hp/2)+d,wp,hp);

  
  //----------------------------------------------------------------------------------------------------------------------------
  
    // nez
  if (mousePressed){
    
  noFill();
  arc(x-17, y-13, 15, 6, 0, PI );
  arc(x+13, y-13, 15, 6, 0, PI );
  fill(3, 129,8);
  arc(x-17, y-27, 22, 15, PI, TWO_PI);
  arc(x+13, y-27, 22, 15, PI, TWO_PI);
  fill(0);
 //ellipse(x-2,y-8,7,7);
 arc(x-2, y-2, 10, 16, PI, TWO_PI);
  }else{
  fill(0);
  arc(x-2, y-7, 15, 10, 0, PI);
  
  }
  
  // clignotment des lumieres et laser
  if (mousePressed) {  
      s= sin(angle)*scalar;
  angle = angle + angleInc;
  f = x-22;
  g = y+40;
  j = x+31;


    smooth();
    stroke(255, 3, 3, 130 + 40*s);
    strokeWeight(2);
    line(f, g, mouseX, mouseY);
    line(j, g, mouseX, mouseY);
    stroke(255, 3, 3, 50 + 20*s);
    strokeWeight(8);
    line(f, g, mouseX, mouseY);
    line(j, g, mouseX, mouseY);
    stroke(255, 3, 3, 75 + 20*s);
    strokeWeight(4);
    line(f, g, mouseX, mouseY);
    line(j, g, mouseX, mouseY);
    
    fill(random(255), random(255),random(255)); // couleurs au hasard, effet clignotement
  }
  else {
    fill(54,255,10); // couleur verte
  }

  
  for (int i = 50; i < 320; i += 50) {  // lumieres du vaisseau (loop)
    ellipse(x-174 +i, y+37, 20,20);
  }
  


  }




// Imprime les coordonnees du curseur lorsque la souris clique
  void mousePressed() {
    println("Clique: x "+mouseX+" y "+mouseY);
  }


