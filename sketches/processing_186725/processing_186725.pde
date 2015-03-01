
//Declaració de variables

int x, y;
float segons;
float minuts;
float hores;
 
 
void setup() {
    
size(960, 540);

//donar valors a les variables

int radius = min(width, height) / 2;  
segons = radius * 0.75;
minuts = radius * 0.60;
hores = radius * 0.50;
 
  x = width / 2;
  y = height / 2;
}
 
void draw() {
background(255);
  
  
 //funcions extretes de l'exemple del rellotge de la web de processing
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
 
 //Dibuixar els minuters i elipses del segons
strokeWeight (15);
stroke(0);
noFill();
ellipse(x, y, 380, 380);
stroke(255);
strokeWeight(15);
line(x, y, x + cos(s) * segons, y + sin(s) * segons);
 
//Dibuixar els minuters i elipses dels minuts 
strokeWeight (15);
stroke(0);
noFill();
ellipse(x, y, 312, 312);
stroke(255);
strokeWeight(20);
line(x, y, x + cos(m) * minuts, y + sin(m) * minuts);
   
//Dibuixar els minuters i elipses de les hores
strokeWeight (15);
stroke(0);
noFill();
ellipse(x, y, 215, 215);
stroke(255, 200);
strokeWeight(20);
stroke(255);
strokeWeight(25);
line(x, y, x + cos(h) * hores, y + sin(h) * hores);

//dibuixar el cercle central
strokeWeight (20);
stroke(0);
ellipse(x, y, 20, 20);
   
    
   
}

