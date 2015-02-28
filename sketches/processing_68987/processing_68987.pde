
/// EXERCICE DE RATTRAPPAGE EDM4600 - L'OEIL \\\
/// GABRIELLE SIGMEN MERCIER \\\

float xCourant;
float yCourant;
float xCible;
float yCible;
float d = 100;
 
float pupilleD = 30;
   
void setup() {
  size(400,400);
  smooth();
  noStroke();
}
   
   
void draw() {
  background(140,20,80);
  fill(255);

//oeil   
  ellipse(xCourant,yCourant,d,d);

//restriction pupille dans l'oeil    
  float radians = atan2(mouseY-yCourant,mouseX-xCourant);
  float distance = dist(mouseX,mouseY,xCourant,yCourant);
   
  distance = constrain(distance,0,d/2 - pupilleD/2);
      
  float pupilleX = cos(radians)* distance + xCourant;
  float pupilleY = sin(radians)* distance + yCourant;

//pupille    
  fill(140,20,80);
  ellipse(pupilleX,pupilleY,pupilleD,pupilleD);

//assouplissement  
  xCourant = (xCible - xCourant) * 0.2 + xCourant;
  yCourant = (yCible - yCourant) * 0.2 + yCourant;    
  }

//clic souris
void mousePressed() {
  
  xCible = mouseX;
  yCible = mouseY; 


   
}
