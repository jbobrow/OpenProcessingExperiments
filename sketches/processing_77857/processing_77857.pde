


//mouse: 
//links  = zeichnen
//rechts = wechsel des zeichenmodus
//      
//tasten:
//+/- = transparenz +/-
//b/w = background schwarz/weiss
//1-3 = shades(rect,ellipse,triangle)



int x = 0;
int mode = 0;
int shade = 1;
int transp = 5;
int t;

void setup() {
  size(800, 800);
  noStroke();
  colorMode(HSB, 360, 100, 100);
  background(360, 100, 0);
  frameRate(10000);
}

void draw() {

  if (keyPressed && key =='b') {     
    background(360, 100, 0);
  }

  if (keyPressed && key =='w') {     
    background(360, 0, 100);
  }

  t = int(map(transp, 1, 10, 10, 255)); 



  if (mousePressed) {             
    float d = dist(pmouseX, pmouseY, mouseX, mouseY);
    float b = random(0, 2*PI);
    float x = mouseX;
    float y = mouseY;
    translate(x, y);                            //0,0 wird an  x,y mouse verschoben... 
    //float a = atan2(mouseY-y, mouseX-x);
    rotate(random(0, 2*PI));                   //und mit einem zufallswert um x,y mouse gedreht    





    if (mode == 0) {
      fill (random(0, 360), 100, 100-2*d, t);  //zufälliger Frabton, helligkeit nimmt mit in abhängigkeit von d ab, t = transparenz (+/- tastatur)   [[oder random //framecount%100 oder mit sinus]]
    }
    if (mode == 1) {
      fill (random(0, 360), 100, 2*d, t);  // " " ,helligkeit nimmt zu
    }



    if (shade ==1) {


      rect(-3*d, -d/2, d*6, d); //je größer d, desto größer die streuung. alle werte beziehen sich auf das transformierte koordinatensystem. große auswirkung auf erscheinung!!
    }


    if (shade ==2) {
      ellipse (-3*d, -d/2, 4*d, 4*d); //werte bei allen 3 shades beliebig gewählt...
    }

    if (shade ==3) {




      translate(0, -5); //dreieck wird vom ursprung senkrecht verschoben --> größerer radius
      scale(d/random(5, 10)); //zufällige skalierung. es wird un den neuen ursprung skaliert, der innere radiuns bleibt gleich

      beginShape();

      vertex(0, 0);
      vertex(20, -30);
      vertex(-20, -30);

      endShape(CLOSE);
    }
  }
}


void mousePressed() {     //bei rechtsklick x+1, durch modulor mode immer 0 oder 1

  if (mouseButton ==RIGHT) {

    x = x + 1;
    mode = x%2;
  }
}


void keyPressed() {   //variablen nehmen bei tastendruck entsprechenden wert an

  if (key=='1') {
    shade = 1;
  }

  if (key=='2') {
    shade = 2;
  }

  if (key=='3') {
    shade = 3;
  }


  if (key=='+') {

    if (transp <10) {         // bei "+" transp + 1  bis 10
      transp = transp + 1;
    }
  }


  if (key=='-') {      // bei "-" transp - 1  bis 1

    if (transp >1) {

      transp = transp - 1;
    }
  }
}


