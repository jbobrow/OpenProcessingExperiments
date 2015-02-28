
void setup(){
smooth();
size(500,500);

}

void draw(){
  background(253,200,220);
  randomSeed(mouseX);

//alle Variablen 
  int wert1 = 40;

// alle Schleifen
  for(int i = 0; i<wert1; i++){
  for(int j = 0; j<wert1; j++){
 
  
//Formen
rechtecke1(width/wert1*j, height/wert1*i, mouseX/40, mouseX/40, mouseX, 255, 255, 255);
rechtecke2(width/wert1*j, height/wert1*i, i/wert1, j/wert1, mouseX, 255, 255, 255); 
 
}
}
}

void rechtecke1(float x, float y, float weite, float hoehe, float winkel, float rot, float gruen, float blau){
  noStroke();          
  fill(234,0,79,70);
    if(mouseX>width/2){
  fill(30,215,100,70);
  }
  rotate(PI/winkel);
  rect(x,y,weite+28,hoehe+5);
  fill(234,0,79,100);
  rotate(PI/winkel);
  rect(x,y,weite+28,hoehe+5);
  
}  

void rechtecke2(float x, float y, float weite, float hoehe, float winkel, float rot, float gruen, float blau){
  noStroke();          
  fill(100,67,179,45);
  if(mouseX>width/2){
  fill(220,100,20,45);
  }
  rotate(PI/winkel);
  rect(x,y,weite+28,hoehe+5);
  fill(34,67,179,70);
  rotate(PI/winkel);
  rect(x,y,weite+28,hoehe+5);
 
}


