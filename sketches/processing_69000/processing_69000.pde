
float x, y, xCible=200, yCible=200;
float diametreOeil=120;
float diametrePupille=40;
float facteur= 0.1;
float pupilleX, pupilleY;

void setup() {
  size(400,400);
  smooth();
  
}

void draw () {
background ( 0 );
fill ( 250, 0, 0 );
ellipse (x, y, diametreOeil, diametreOeil );


x = (xCible - x ) * facteur +x;
x = constrain(x, diametreOeil/2, 400 - diametreOeil/2 ); 
y = (yCible - y ) * facteur +y;
y = constrain(y, diametreOeil/2, 400 - diametreOeil/2 );

float radians = atan2(mouseY-y,mouseX-x);
  float distance = dist(mouseX,mouseY,x,y);
   
  distance = constrain(distance,0,diametreOeil/2 - diametrePupille/2);
   
   
  float pupilleX = cos(radians)* distance + x;
  float pupilleY = sin(radians)* distance + y;

fill ( 0 );
ellipse (pupilleX, pupilleY, diametrePupille, diametrePupille );
  
}


void mousePressed() {
  
xCible= mouseX;
yCible= mouseY;
}
