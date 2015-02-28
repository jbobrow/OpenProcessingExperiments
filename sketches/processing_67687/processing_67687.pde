

void setup(){
  size (1280,800);
  smooth();
  background (255);
}
void draw(){
noFill();
  strokeWeight(35); //AZUL
  stroke(0,110,180);
  ellipse (300,300,300,300);
  
  strokeWeight(7);
  stroke(255);
  ellipse (300,300,335,335);
  ellipse (300,300,270,270);
  
  strokeWeight(35);  //AMARILLO
   stroke(242,186,0);
  ellipse (475,450,300,300);
    strokeWeight(7);  
  stroke(255);
  ellipse (475,450,335,335);
  ellipse (475,450,270,270);
  
  //CORTE AZUL SOBRE AMARILLO
   strokeWeight(35);
  stroke(0,110,180);
  arc(300,300,300,300,-PI / 7.5, PI / 7.5); 
 strokeWeight(7);
  stroke(255);
  arc (300,300,335,335,-PI/4,PI/4);
  arc (300,300,270,270,-PI/4,PI/4); 
  
  strokeWeight(35); //NEGRO
  stroke(0);
  ellipse (650,300,300,300);
  strokeWeight(7);
  stroke(255);
  ellipse (650,300,335,335);
  ellipse (650,300,270,270);
  
   //CORTE AMARILLO SOBRE NEGRO
   strokeWeight(35);
  stroke(242,186,0);
  arc(475,450,300,300,4.8, 5.75); 
 strokeWeight(7);
  stroke(255);
  arc (475,450,335,335,4.7,5.95);
  arc (475,450,270,270,4.7,5.95); 
 
  
  strokeWeight(35); //VERDE
   stroke(7,147,42);
  ellipse (825,450,300,300);
    strokeWeight(7);
  stroke(255);
  ellipse (825,450,335,335);
  ellipse (825,450,270,270);
  
  //CORTE NEGRO SOBRE VERDE
   strokeWeight(35);
  stroke(0);
  arc(650,300,300,300,-PI / 7.5, PI / 7.5); 
 strokeWeight(7);
  stroke(255);
  arc (650,300,335,335,-PI/4,PI/4);
  arc (650,300,270,270,-PI/4,PI/4); 
  
  strokeWeight(35); //ROJO
  stroke(215,0,21);
  ellipse (1000,300,300,300);
    strokeWeight(7);
  stroke(255);
  ellipse (1000,300,335,335);
  ellipse (1000,300,270,270);
  
     //CORTE VERDE SOBRE ROJO
   strokeWeight(35);
  stroke(7,147,42);
  arc(825,450,300,300,4.8, 5.75); 
 strokeWeight(7);
  stroke(255);
  arc (825,450,335,335,4.7,5.95);
  arc (825,450,270,270,4.7,5.95); 

}

