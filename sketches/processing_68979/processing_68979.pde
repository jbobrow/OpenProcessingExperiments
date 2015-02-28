
float a, b, vitesse, xPup, yPup;


float x = 200;
float y = 190;
float d = 20;
float pupilleD = 30;
float xCiblee = 200;
float yCiblee = 200;

float positionX, vitesseX;
float positionY, vitesseY;

void setup() {
size(400,400);
smooth();
noStroke();

vitesse = 5;

}

void draw() {
background(0);


//Pupille Mouvement
fill(255);
ellipse(x, y, d+70,d+70);

float distance = dist(mouseX, mouseY, x, y);

distance = constrain(distance, 0, d - pupilleD+43);

//Mouvement Oeil
float radians = atan2 ( mouseY-y, mouseX-x );

// Assouplissement
float pupilleX = cos(radians)* distance + x;
float pupilleY = sin(radians)* distance + y;

fill(0);
ellipse(pupilleX,pupilleY,pupilleD,pupilleD);

  
x = ( xCiblee - x) * 0.05 + x;
y = ( yCiblee - y) * 0.05 + y;

}

void mousePressed() {
  xCiblee = mouseX;
  yCiblee = mouseY;
  
}
