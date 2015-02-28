


import java.util.Arrays;
PFont fuente;
float ANGULO = radians(13.33333333333333333333333); //Constante del intervalo angular de cada segmento o letra.
String txtLines[];//Array de strings donde se va guardar el texto inicialmente.
String words[] = new String[0]; // Array de palabras, sin espacios ni símbolos que vamos a usar para graficar cada palabra.
String rawText; //String con todas las palabras juntas que vamos a usar para calcular la ocurrencia de cada letra en el texto.
float angulo = 0; //
int z = 0;
int grosor = 4; //Variable para almacenar el grosor de las líneas que representarán a cada letra.
String abc = "abcdefghijklmnopqrstuvwxyz";//
String ABC= "ABCDEFGHIJKLMNOPQRSTUVWXYZ";// Arrays del alfabeto para saber qué letra 
int letterWeight[] = new int[26]; // Array para almacenar el peso de cada letra. Por defecto lo iniciamos en 26. 
int lineLength = 0; //Valor del largo que va tener la línea segun el peso de la letra en el texto
int position = 0; // Posición 
int largo = 0;
int poolFrames = 0;
int animDuration = 18;
int delta=1;
String selectedWord;
int animArray[] = new int [30];
String word;
void setup() {
  size(800, 800);
  frameRate(30);
  smooth();
  noLoop();
  getText();
  fuente = loadFont("Mangal-Bold-28.vlw");
}
void draw() {

  if (frameCount == 1) {word = selectWords();}

  if (poolFrames == animDuration+1) {
    delta=-1;
    
  }

  if (poolFrames==animDuration*2+2)
  {
    Arrays.fill(animArray, (height/5)/2);
    delta=1;
    poolFrames = 0;
    word = selectWords();
  }


  background(200);  

  for (int j = 0; j < word.length(); j++) {
    for (int n = 0; n < abc.length(); n++) {
      if (word.charAt(j) == abc.charAt(n) || word.charAt(j) == ABC.charAt(n) ) {
        //println("letra " + words[z].charAt(j) + " || " + "peso: " + letterWeight[n] );
        largo = letterWeight[n];
        break;
      }
    }

    pushMatrix();
    
    translate(width/2, height/2);
    angulo = ANGULO * abc.indexOf(word.charAt(j));
    rotate(angulo);
    
    animArray[j] += delta*(largo/animDuration);
    stroke(0);
    strokeWeight(15);
    line(0, 0, 0, -animArray[j]);
    
    stroke(255, 0, 0);
    strokeWeight(7);
    line(0, 0, 0, -animArray[j]);
    
    popMatrix();
  }

  poolFrames++;

  fill(255);
  stroke(0);
  strokeWeight(10);
  ellipse(width/2, height/2, width/5, height/5);

  fill(255, 0);
  stroke(255, 0, 0);
  strokeWeight(4);
  ellipse(width/2, height/2, (width/5), (height/5));
  
  textFont(fuente, 28);
  fill(0);
  textAlign(CENTER);
  text(word, width/2, height/2);
}

//Funcion para cargar el texto, filtrar por palabras y cargar la string del texto bruto.
void getText() {
  txtLines = loadStrings("guion--.txt");
  for (int i = 0; i < txtLines.length; i++) {
    words = concat(words, splitTokens(txtLines[i], ",.()¿?: "));
    rawText += txtLines[i];
  }
  analyzeText();// Llamamos a la función que va analizar el peso de cada letra
}
// Función que va analizar el peso de cada letra
void analyzeText() {
  for (int r = 0; r < rawText.length(); r++) {
    for (int j = 0; j < abc.length(); j++) {
      if (rawText.charAt(r) == abc.charAt(j) || rawText.charAt(r) == ABC.charAt(j)) {
        letterWeight[j]++;
        break;
      }
    }
  }
  int orderedWeight[] = sort(letterWeight);
  int highest = orderedWeight[25];
  println(highest);
  for (int t = 0; t < letterWeight.length; t++) {
    //Mapeamos los valores que obtuvimos en un rango más pequeño para que tenga correlación con la pantalla.
    letterWeight[t] = int(map(letterWeight[t], 0, highest, width/5, (width/2)-(width/5)));
  }
  loop();
}


String selectWords() {
  if (z+1 > words.length) {
    z = 0;
  }
  selectedWord = words[z];
  z++;
  return selectedWord;
}

void keyPressed() {
  animDuration +=2;
}


