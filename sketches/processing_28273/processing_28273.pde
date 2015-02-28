
void setup () {
  size (500, 500);

  smooth();
}


float x = 1;
void draw() {
  background (255);
  randomSeed (mouseX);
  float y = 0;

  // randomSeed(0); bedeutet der zufällige random wert ist immer der selbe

  //die schleifen wie folgt: (i ist bloß eine beliebige variable) for heißt "so lange"
  //heißt variable i ist 0 und soll solange sie kleienr ist als 100 zeichnet sie sich immer wieder

  // NUMMER 1   int count = 100;

  //NUMMER 1   for(int i = 0; i < count; i++ ) {

  // man könnte auch statt i++ schreiben: i=i+1
  // oder: int count = 30;
  //for(int i = 0; i < count; i++) {
  //ellipse(200,height/count*i,10,10); hierbei ist count "das ganze" an das es angepasst wird



  //ellipse (200+random(-100,100),i*20,50,50); //ein beispiel mit random wäre das sie sich pro auftauchen zufällig verschieben

  // NUMMER 1 ellipse (200,height/count*i,height/count,height/count); } }
  x = x  ;


  stroke (random (255));
  fill (random (255),random (255),random (255), 100);
  rect (x,y-20,random (500),random (500));


  stroke (random (255));
  fill (random (255),random (255),random (255), 100);
  rect (x-10,y-20,random (500),random (-500));

  stroke (random (255));
  fill (random (255),random (255),random (255), 100);
  rect (x+500,y,random (-500),random (500));
  // rect (mouseX, mouseY, mouseX, random (90));

      stroke (random (255));
  fill (random (255),random (255),random (255), 100);
   rect (x,y+500,random (-500),random (-500));
  // rect (mouseX, mouseY, mouseX, random (90));
  
        stroke (random (255));
  fill (random (255),random (255),random (255), 100);
   rect (x,y+500,random (500),random (-500));
 
  rect (mouseX, mouseY, random (90), random (90));

  if(x>500) {
    x = 0;
  }
}


