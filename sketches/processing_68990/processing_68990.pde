
/*----------------------------------------------------------------
 Travail Rattrapage 
 Par Samantha Velandia Prieto
----------------------------------------------------------------*/
//Variables pour la position
float x;
float y;
float xCible=200 ;
float yCible=200 ;
float xVitesse;
float yVitesse;
float k= 0.9;
float d= 0.05;

void setup(){
  
//Configuration Scene
size(400,400);
smooth();

//Point Centre de la scene
x = width/2;
y = height/2;

}

void draw(){
//Arriere plan
background(256);

//Assouplissement 
xVitesse = d * (xVitesse + k * (xCible - x));
x = x + xVitesse;

yVitesse = d * (yVitesse + k * (yCible - y));
y = y + yVitesse;

//Dessin Yeux 

int d = 100;
float xOeil= x-0;
float yOeil= y-0;
ellipseMode(CENTER);
fill(252,252,252);
stroke(0);
ellipse(xOeil,yOeil, d, d);
float pupille = 30;

if (mousePressed){
  xCible= mouseX;
  yCible= mouseY;
  
}

println (xCible);
println (yCible);

//Animation

float radians = atan2 (mouseY-yOeil,mouseX-xOeil);
float distance = dist(mouseX, mouseY, xOeil, yOeil);

distance = constrain (distance, 0,d/2 - pupille/2);

float pupilleX= cos(radians)* distance + xOeil;
float pupilleY= sin(radians)* distance + yOeil;

fill(0);
ellipse(pupilleX,pupilleY,pupille,pupille);



}


