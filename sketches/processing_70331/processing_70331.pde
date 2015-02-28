
/* --------------------------------------------------------------------------
Monstre interactif
Par Jean-François Bourbeau
-------------------------------------------------------------------------- */
   

float y;
float x;


float d = 50;
float yCiblee = 200;
float xCiblee = 200;
float vitesse;

float r,g,b;
float rCible,gCible,bCible;
 

 
float pupilleD = 20;
float assouplissement = 0.03;


int value= 0;

//Tableau de String
String [] mots;
int index;



void setup() {
  
size(400,400);
smooth();
  
// Placer au centre de la scene
x = width/2;
y = height/2;

//background random
  rCible = random(256);
  gCible = random(256);
  bCible = random(256);
 
 
  
 //Tableau de String
  mots = new String[11];

        mots[0] = " ";
        mots[1] = "OBEY";
        mots[2] = "CONSUME";
        mots[3] = "DO NOT QUESTION AUTHORITY";
        mots[4] = "CONFORM";
        mots[5] = "SUBMIT";
        mots[6] = "BUY";
        mots[7] = "MARRY AND REPRODUCE";
        mots[8] = "WORK 8 HOURS, SLEEP 8 HOURS";
        mots[9] = "THIS IS YOUR GOD";
        mots[10] = "NO INDEPENDENT THOUGHT";


}




void draw() {
  
  // Arrière plan
  background(r,g,b);
  
  //background random
   if ( random(100) < 2 ) {
    rCible = random(256);
    gCible = random(256);
    bCible = random(256);
  }
   
   
  // Assouplissement de l'arrière plan
  r = ( rCible - r )  * 0.03 + r;
  g = ( gCible - g )  * 0.03 + g;
  b = ( bCible - b )  * 0.03 + b;
   
  
 
  //Tableau de String
        textAlign(CENTER);
        textSize(20);

        fill(255);
        text(mots[index],width/2,height-10);
        

 
 
// Dessiner la tête
stroke(0);
strokeWeight(30);
fill(#4CFA32);
 
beginShape();
curveVertex(x-200,  y+50);
 
curveVertex(x,  y-140);
curveVertex(x+130,  y-140);
curveVertex(x+130,  y+140);
curveVertex(x,  y+140);
curveVertex(x-130,  y+140);
curveVertex(x-130,  y-140);
curveVertex(x,  y-140);
 
curveVertex(x+200,  y+50);
endShape();
 
 
 
 
 // Variable mousePressed (narines)
 if (mousePressed == true) {
    rect(x-5, y, 10, 10);
    noStroke();
    fill(255);
    ellipse(x-10,y,10,10);
    ellipse(x+10,y,10,10);
  } else {
    fill(0);
    
    
  // Dessiner le nez
  stroke(0);
  triangle(x,y-10,x-10,y,x+10,y);

  }
 

 
 
// Dessiner la bouche
noStroke();
fill(value);
rect(x-100,y+55,200,35);




// Zone interactive rectangulaire
fill(#FFEB08);


float x1 = constrain(mouseX,x-100,x+90);
float y1 = constrain(mouseY,y+55,y+80);


rect(x1,y1,10,10);


 
 
 
 
// Dessiner les dents
stroke(0);
stroke(255);
triangle(x-60,y+69,x-50,y+69,x-55,y+90);
triangle(x+60,y+69,x+50,y+69,x+55,y+90);
 
 
 
 
// Dessiner les yeux
strokeWeight(10);
stroke(0);
fill(#FF0009);




// Zone interactive circulaire (oeil gauche)

  float radians = atan2( yCiblee-y, xCiblee-x );
  float distance = dist( xCiblee, yCiblee, x, y );
  x = cos(radians) * min(distance,vitesse) + x;
  y = sin(radians) * min(distance,vitesse) + y;

ellipse(x-60, y-80, 55, 55);

float radiansP = atan2(mouseY-y,mouseX-x);
  float distanceP = dist(mouseX,mouseY,x,y);
   
  distance = constrain(distanceP,0,d/2 - pupilleD/2);
   
   
  float pupilleX = cos(radiansP)* distance + x;
  float pupilleY = sin(radiansP)* distance + y;

fill(255);
      
  ellipse(pupilleX-60,pupilleY-80,pupilleD,pupilleD);





// Zone interactive circulaire (oeil droite)
fill(#FF0009);

ellipse(x+60, y-80, 55, 55);


fill(255);
ellipse(pupilleX+60,pupilleY-80,pupilleD,pupilleD);





// Dessiner les cheveux
// Avec l'aide du livre:
// Learning Processing, Daniel SHIFFMAN, Morgan Kaufmann, 2008, p.84
 
int z =0; // initialisation
while ( z < width ) { // condition
stroke(random(255));
strokeWeight(8);
  line(x,y-148,z-150,z-400); // bloc de code
  z = z + 18; // incrementation
}




//Assouplissement

x = (xCiblee - x) * assouplissement + x;
y = (yCiblee - y) * assouplissement + y;



  }
 


 


// Fonction mousePressed()
void mousePressed() {
 
  if (value == 0) {
    value = #FF0009;
  } else {
    value = 0;
  }

//Tableau de String  
  index = index + 1;
        if ( index > 10 ) index = 0;
        
        
  
  xCiblee = mouseX;
  yCiblee = mouseY;
}

