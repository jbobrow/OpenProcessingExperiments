


float a=30;
float b=50;
float c=60;

void setup() {
  size(500, 500);
  smooth();
  background(#D7DEDC);
  smooth();
}

void draw() {
  //3 elissi colorate
  noStroke();
  fill(#F5406A);
  ellipse(450, 450, 40, 40);
  fill(#3E8CB4);
  ellipse(50, 450, 40, 40);
  fill(#6FEAD5);
  ellipse(250, 450, 40, 40);
  noFill();


  if (mousePressed) {
//aumenta grandezza elissi
    if (mouseX>415 && mouseX<465) {
      if (mouseY>430 && mouseY<470) {
        a=a+1;
        b=b+1;
        c=c+1;
        fill(#F5406A, 10);
      }
    }
//diminuisce grandezza elissi
    if (mouseX>30 && mouseX<70) {
      if (mouseY>430 && mouseY<470) {
        a=a-4;
        b=b-2;
        c=c-1;
        fill(#3E8CB4, 10);
      }
    }
//aumenta/diminuisce grandezza elissi
    if (mouseX>230 && mouseX<270) {
      if (mouseY>430 && mouseY<470) {
        a=a+4;
        b=b+1;
        c=c-5;
        fill(#6FEAD5, 10);
      }
    }
  }
 
  ellipse(80, 80, a, a);
  ellipse(230, 400, a, a);
  ellipse(400, 200, a, a);

  ellipse(450, 90, b, b);
  ellipse(190, 20, b, b);
  ellipse(500, 2500, b, b);


  ellipse(310, 130, c, c);
  ellipse(80, 300, c, c);
  ellipse(200, 250, c, c);
}


