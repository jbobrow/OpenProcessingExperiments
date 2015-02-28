

// ::::::::::::::::: Variablen ::::::::::::::
// S = eine Schräge
int S=46;  //Standart Wert: 46

// D = Diameter des Kreises
int D=4;  //Standart Wert: 10

// A = Abstand der Kreise
int A=8;  //Standart Wert: 10

// As = Abstand der Schlange
int As=-10;  //Standart Wert: 0

// SC = nach links Scrollen
int SC=-20;  //Standart Wert: 0

/////////////////////////////////////////////////
 void setup(){
  size(500, 500);
  smooth();
} 
void draw(){
  background(255);
  noStroke();
  fill(0,150);

for(int B=0+SC; B <width; B=B + S +As){ 
for(int L=0; L <height; L=L + S*2){ 
///////////////////////////////////////////////
  int y=L;
  int y2=L+S*2;
  
  
 // von links nach rechts
  for(int x=0; x<S; x=x + A) {    
      ellipse(x+B,y, D, D); 
      y = y +A;     
  }
 // von rechts nach links 
  for(int x=0; x<S; x=x + A) {     
      ellipse(x+B,y2, D, D);
      y2 = y2 -A;      
    }
 ///////////////////////////////////////////////
 }

}
  
}

