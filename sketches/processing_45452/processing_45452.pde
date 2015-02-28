
// Día 8, el día en que el hombre crea.
// ssbeltran

// inspirado en el texto de Jhavier Loeza,

/*‎"El Octavo Día" presenta una ampliación de la biodiversidad mas allá de las formas de vida salvajes. Como
un sistema ecológico artificial autocontenido, es resonante con las palabras del titulo, que suma un día al
periodo de creación el mundo, narrado en las escrituras judeocristianas. Todas las criaturas transgénicas en
"El Octavo Día" están creadas a través de la clonación de un gen que tiene el código para la producción de
la proteína fluorescente verde (PFV). */


// - - - - - - - - - - - - - - - -  -
// declaro variables

float contador ;
int rot = 180;
int grun = 255;
int blau = 0;

int pfv = 7;
float [] AposX = new float [pfv];
float [] AnoiseX = new float [pfv];
float [] AvarX = new float [pfv];
float [] AposY = new float [pfv];
float [] AnoiseY = new float [pfv];
float [] AvarY = new float [pfv];
float [] BposX = new float [pfv];
float [] BnoiseX = new float [pfv];
float [] BvarX = new float [pfv];
float [] BposY = new float [pfv];
float [] BnoiseY = new float [pfv];
float [] BvarY = new float [pfv];
float [] CposX = new float [pfv];
float [] CnoiseX = new float [pfv];
float [] CvarX = new float [pfv];
float [] CposY = new float [pfv];
float [] CnoiseY = new float [pfv];
float [] CvarY = new float [pfv];
float [] DposX = new float [pfv];
float [] DnoiseX = new float [pfv];
float [] DvarX = new float [pfv];
float [] DposY = new float [pfv];
float [] DnoiseY = new float [pfv];
float [] DvarY = new float [pfv];

float opacity = random (255);
float jitter = random (5,10);

// - - - - - - - - - - SETUP

void setup (){

size (800,800);
smooth ();
background (0);

inicializarArray ();

}

// - - - - - - - - - - - DRAW

void draw (){
  
  
background (0);
contador += 0.25;
opacity ++;

firstSpawn ();

println (opacity);


}

// - - - - - - -  INTERACTIVO

  void mousePressed (){
  
  rot = 255;
  grun = 255;
  blau = 255;
  
  fluorescentAdolescent ();
  
  }
  
  void mouseReleased (){
    
    rot = 180;
    grun = 255;
    blau = 0;
    
    
  }

