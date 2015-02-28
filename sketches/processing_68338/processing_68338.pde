
int etat;
final int ON = 1;
final int OFF = 0;


void setup() {
  size(400, 400); 
  smooth(); 

  etat = OFF;
}

void draw() {
  background(20, 100, 23);


  if ( etat == ON ) {
    
    int i =0; // initialisation
    while ( i < 20 ) { // condition
      line(i*10, 0, i*10, height); // bloc de code
      i = i + 1; // incrementation
    }
    fill(45, 8, 255);
   
  } 
  else {
    fill(255);
  }

  rectMode(CENTER);
  rect(200, 200, 50, 50);
}

void mousePressed() {

  if ( mouseX > 175 && mouseX < 225 && mouseY > 175 && mouseY < 225 ) {
    if ( etat == OFF ) {
      etat = ON;
    } 
    else {
      etat = OFF;
    }
  }
}

void mouseReleased() {
  etat  = OFF;
}
