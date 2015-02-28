
void setup(){

size(500,500);
}

void draw(){
  background(255,255,255);
  smooth();
 

//Werte
  int zahl1 = 20;
  

// alle Schleifen
  for(int i = 0; i<zahl1; i++){
  for(int j = 0; j<zahl1; j++){
    
//Die eigentliche Form
rot(0, height/zahl1*i, 500, mouseX/zahl1, j*25, 0, j*25);
  }
}  
   for(int i = 0; i<zahl1; i++){
  for(int j = 0; j<zahl1; j++){
gelb(width/zahl1*i, 0, mouseY/zahl1, 500, i*25, 0, i*25, 15);
  }
  }

 for(int i = 0; i<zahl1; i++){
  for(int j = 0; j<zahl1; j++){
blau(0, height/zahl1*i, 500, mouseX/zahl1, j*25, 0, j*25, mouseX);
 }
  }
}

//Streifenfunktion
void rot (float x, float y, float breite, float hoehe, float rot, float gruen, float blau){
  noStroke();
  fill(255,105,105);
  rect(x,y,breite,hoehe+15);
}
void blau (float x, float y, float breite, float hoehe, float rot, float gruen, float blau, float deck){
  fill(105,0,155, deck);
  rect(x,y+5,breite,hoehe+5);
  }
  
void gelb (float x, float y, float weite, float breite, float rot, float gruen, float blau, float deck){
  noStroke();
  fill(252,234,105, deck);
  rect(x,y,weite+12,breite);
}

