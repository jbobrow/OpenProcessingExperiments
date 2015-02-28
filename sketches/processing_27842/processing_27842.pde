
void setup(){
smooth();
size(500,500);

}

void draw(){
  background(255,255,255);
 

//Wert
  int zahl1 = 20;
  

// Loops
  for(int i = 1; i<zahl1; i++){
  for(int j = 1; j<zahl1; j++){
  float r = sin(i/(400.0)*0.60);   

//Ausgeführte Kreise
form1(width/zahl1*j,height/zahl1*i,mouseY*r,i*mouseY/10,0,i*mouseX/10);
 }
  }
}




//Kreisfunktion
void form1(float x, float y, float r, float rot, float gruen, float blau){
  noStroke();
  fill(255,0,blau);
  ellipse(x,y,r+17,r+17);
  fill(0,0,0);
  ellipse(x,y,r+10,r+10);
  }


