
void setup(){
smooth();
size(500,500);
rectMode(CENTER);

}

void draw(){
  background(200,234,200);
  randomSeed(mouseX);

//alle Variablen 
  int wert1 = 20;
  int wert2 = 20;

// alle Schleifen
  for(int i = 1; i<wert1; i++){
  for(int j = 1; j<wert1; j++){
    
//Die eigentliche Form
form1(width/wert1*j,height/wert1*i,random(16, 28),i*25,j*25,0);

form2(width/wert1*j,height/wert1*i,i/wert1,j/wert1,255,255,255);      
 }
  }
}

//Die Funktion für die Kreise
void form1(float x, float y, float r, float rot, float gruen, float blau){
  noStroke();
  fill(255,0,0);
  ellipse(x,y,r,r);
  fill(0,100,255);
  ellipse(x,y,14,14);
  }

//Die Funktion für die zwei Balken
void form2(float x, float y, float width, float height, float rot, float gruen, float blau){
  noStroke();          
  fill(200,234,200);
  rect(x,y,28,5);
  rect(x,y,5,28);
  }

