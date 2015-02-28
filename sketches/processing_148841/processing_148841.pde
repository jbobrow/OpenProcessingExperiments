
//import ddf.minim.*;

//Minim minim;
//AudioInput input;

float x;
float y;
float diaSmall;
float diaBig;

void setup () {
  size (800, 400);
  smooth();

  x = 0;
  y = 40;

/*
  minim = new Minim (this);
  input = minim.getLineIn (Minim.MONO, 512);
  */
}

void draw () {
  background(81, 100, 151); 

  float dia = input.mix.level() * 1000;

  dia = dia*0.95 + dia;

  diaSmall = map(dia, 0, 100, 100, 0);
  diaSmall = map(dia, 0, 100, 0, 100);

  for (int i = -10; i < width; i = i +50 ) {   
    for (int j = -10; j < height; j = j +50 ) {  
      strokeWeight(1);
      stroke(255);

      stroke(238, 213, 223);
      noFill();
      ellipse(i+8, j, dia-10, dia-10);

      stroke(255);
      strokeWeight(1);
      ellipse(i+8, j, dia, dia);

      stroke(243, 240, 141);
      noFill();
      ellipse(i+33, j+25, 20-dia, 20-dia);
    }
  }
}
