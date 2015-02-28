
/*
 * Taller Programación MDI Veritas
 * Tarea#2
 * Crear un diseño o dibujo que utilice los numeros de Fibonacci. 
 * Pueden utilizar cualquiera de los dos ejemplos de base. 
 * El primero simplemente muestra como se calculan los números de Fibonacci,
 * el segundo juega con ellos
 */

/*
 * @author Andres Villalobos
 * @date 2/18/14
 * @version 1.0
 */

// global variables
int levels = 12;
float fibonacci = 10;
float fibonacciAnt = 10;
float x;
float y;
int[] quadrantOrder = new int [] {
  1, 4, 3, 2
};

void setup() {
  size(900, 600);
  smooth();
  x = width*0.3;
  y = height*0.6;
  background(0);
  stroke(255);

  // draw initial arc
  fill(255);
  arc(x, y, fibonacci, fibonacci, PI, PI+HALF_PI, OPEN); // render mode PIE doesn't work in Javascript
  arc(x, y, fibonacci, fibonacci, PI-HALF_PI, PI, OPEN); // render mode PIE doesn't work in Javascript
  fill(0);
  textSize(6);
  text((int)fibonacci/10, x-(fibonacci*0.4), y+(fibonacci*0.3));

  // draw fibonacci ratios
  for (int i=0;i<=levels;i++) {
    float temp = fibonacci;
    fibonacci += fibonacciAnt;
    fibonacciAnt = temp;
    textSize((int)(fibonacci * 0.3));
    drawArc(quadrantOrder[i%4]);
  }
}

//draws an arc in specific quadrant
void drawArc(int quadrant) {
  fill((int)(fibonacci%140));
  int textSize = (int)(fibonacci * 0.3);
  int textValue = (int)fibonacci/10;
  switch(quadrant) {
  case 1:
    y += (fibonacci - fibonacciAnt)/2;
    arc(x, y, fibonacci, fibonacci, PI+HALF_PI, TWO_PI, OPEN); // render mode PIE doesn't work in Javascript
    fill(255);
    text(textValue, x+(fibonacci*0.05), y-(fibonacci*0.07));    
    break;
  case 2:
    x += (fibonacci - fibonacciAnt)/2;
    arc(x, y, fibonacci, fibonacci, PI, PI+HALF_PI, OPEN); // render mode PIE doesn't work in Javascript
    fill(255);
    text(textValue, x-((textSize*0.7)*(digits(textValue))), y-(fibonacci*0.05));
    break;
  case 3:
    y -= (fibonacci - fibonacciAnt)/2;
    arc(x, y, fibonacci, fibonacci, PI-HALF_PI, PI, OPEN); // render mode PIE doesn't work in Javascript
    fill(255);
    text(textValue, x-((textSize*0.7)*(digits(textValue))), y+((textSize*0.9)));
    break;
  case 4:
    x -= (fibonacci - fibonacciAnt)/2;
    arc(x, y, fibonacci, fibonacci, 0, PI-HALF_PI, OPEN); // render mode PIE doesn't work in Javascript
    fill(255);
    text(textValue, x+(fibonacci*0.05), y+((textSize)));
    break;
  }
}

int digits (int value) {
  if (value < 10) return 1;
  else if (value < 100) return 2;
  else if (value < 1000) return 3;
  else return 4;
}



