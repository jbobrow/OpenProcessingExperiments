
/* Reto creativo II
 * Conceptos de diseño
 * Cuando empecé a diseñar la imagen quería trabajar con el concepto
 * de ritmo y escala.
 * Había planeado hacer más acusado la diferencia entre las 
 * pirámides. Pero opté por trabajas con las dimensiones "reales"
 * de las pirámides (1 metro = 1 pixel). Y por tanto aparecen
 * otras estructuras de diseño:
 
 * escala: la pirámide delantera es bastante más pequeña con las
           otras.
           al ser las dos pirámides traseras aparentemente iguales
           pero estar marcadas la superposición de una a la otra
           creo qe se crea un conflicto, al no satisfacer la
           perspectiva que buscaría el ojo, con una pirámide lejana 
           pequeña, o más relajante si fuera mucho más grande detrás.
           
 * equilibrio: creo que he colocado las pirámides con cierto equilibrio
            al darles una disposición asimétrica.
            Las dos primeras irámides están más a la izquierda.
            La última grande también escorada a la derecha, incluso se
            sale del recuadro.
 * simetría: hay una falta de simetría voluntaria utilizada para
             equilibrar la diferencia de escala entre las figuras.
*/
float xKeops = 150;
float xKefren = 50;
float xMicerinos = 10;

float baseKeops = 230;
float baseKefren = 215;
float baseMicerinos = 105;

float heightKeops = 147;
float heightKefren = 143;
float heightMicerinos = 65;

float land=10;

void setup() {
  size (356,200);
  smooth();
}

void draw() {
  background(83,115,153);
fill(278,175,63);
noStroke();
rect(0,height-20,width,height);

stroke(0);
fill(255);
if (keyPressed) {
  strokeWeight(.5);
  stroke(255,0,0);
  line(0,height-land-heightKeops,width,height-land-heightKeops);
  stroke(0,255,0);
  line(0,height-land-heightKefren,width,height-land-heightKefren);
  stroke(255,255,0);
  line(0,height-land-heightMicerinos,width,height-land-heightMicerinos);
  fill(255,180);
  stroke(0);
  line(width*.5,0,width*.5,height);
  line(0,height*.5,width,height*.5);
}
strokeWeight(2);
if (mousePressed) fill(220);
// Keops -- Jufu
triangle(   xKeops, height-land,
            xKeops+baseKeops, height-land,
            xKeops+baseKeops*.5, height-land-heightKeops);
if (mousePressed) fill(240);
// Kefrén -- Jafra
triangle (xKefren, height-land,
          xKefren+baseKefren, height-land,
          xKefren+baseKefren*.5, height-land-heightKefren);

// Micerinos -- Menkauras
triangle (xMicerinos, height-land,
          xMicerinos+baseMicerinos, height-land,
          xMicerinos+baseMicerinos*.5, height-land-heightMicerinos);
      
}

