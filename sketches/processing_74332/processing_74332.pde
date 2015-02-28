
float x = 20;
float y = 100;

void setup() {
  size(400, 400);
  smooth(8);
}

void draw() {

  background(255);
  noStroke();


  if (mousePressed == true) {
    
    //fill(255, 0, 0, y);
    
  
    x = x + 1;
  } 
  else {
   fill(255, 0, 0);
    x = 20;
  }

  ellipse(width/2, height/2, x, x);

//rosso
  if (x <= 50) {
    fill(255, 0, 0);
//rosso vermiglione
  } else if (x > 50 && x <= 75) {
    fill(255, 90, 0);
    //arancio
  } else if (x > 75 && x <= 100) {
    fill(255, 141, 0);
    //zucca
  } else if (x > 100 && x <= 125) {
    fill(255, 200, 0); 
    //giallo
   } else if (x > 125 && x <= 150) {
    fill(255, 255, 0);
    //verde vomito
  } else if (x > 150 && x <= 175) {
    fill(130, 255, 0);
    //verde
  } else if (x > 175 && x <= 200) {
    fill(0, 255, 0);
    //verde acqua
  } else if (x > 200 && x <= 225) {
    fill(0, 255, 150);
    //azzurro
  } else if (x > 225 && x <= 250) {
    fill(0, 255, 255);
    //celeste
     } else if (x > 250 && x <= 275) {
    fill(0, 150, 255);
    //blu
  } else if (x > 275 && x <= 300) {
    fill(0, 0, 255);
    //viola
  } else if (x > 300 && x <= 325) {
    fill(74, 0, 255);
    //viola scuro
    } else if (x > 325 && x <= 350) {
    fill(118, 0, 255);
    //violetto
   } else if (x > 350 && x <= 375) {
    fill(200, 0, 255);
    //fucsia
    } else if (x > 375 && x <= 400) {
    fill(255, 0, 255);
    //carminio
    } else if (x > 400 && x <= 425) {
    fill(255, 0, 150);
    //rosso
    } else {
    fill(255, 0, 0);
  }
}
