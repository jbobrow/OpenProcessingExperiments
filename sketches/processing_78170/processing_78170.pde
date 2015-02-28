
//VariablenTyp Name (=) Wert
int xPos = 1;
float kommaZahl = 0.4;


String textAbschnitt = "Creative Coding 2012";

float r = 0;
float g = 0;
float b = 0;

void setup() {
  size(260, 230);

 noStroke();
 
}

void draw(){
  //background(200);
  fill(200, 10);
  //fill = schweif
  rect(0,0,width, height);
  //rect=kasten
  
  xPos = xPos + 1;
  
  if(xPos > width){
    xPos = 0;
   r = random(200,255);
   g = random(200,255);
   b = random(200,255);
   //bestimmung der farben plus grenzbereich
  }
  fill(r,g,b);
  ellipse(xPos, height/2, 20, 20);
  //ellipse ist der kreis welcher sich bewegt
 
  println(xPos);
  
  fill(0);
  rect(mouseX, 0, width, height);
  //große schwarze fläche zum ziehen 
  
  
}
