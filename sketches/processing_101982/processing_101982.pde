
/**
* BASE COMPOSER
* v1.0
*
* Description:
* This is my first app developed with Processing. A simple application
* which purpose is to generate base rythms when you are boring and
* have nothing to do :)
*
* Base Composer can handle various instruments at a time selected from a
* greater set of base instruments.
*
* Enjoy!
*
* Author: Rubén Santana Hernández
* Email: rubensh1980@gmail.com
*/

//Número de partículas que dejará el cursor.
int particles = 100;

//Radio del cursor.
int cursorRadius = 25;

//Coordenadas y alpha de las partículas.
int[] particlesX;
int[] particlesY;
int[] particlesAlpha;
int[] particlesRadius;

//Instrumentos.
int instruments = 3;

//Variables de estado de la aplicación.
boolean mouseDown;

/**
* Configuración inicial.
*/
void setup()
{
  //Configuración del display.
  size(640, 480);
  noCursor();

  //Inicialización de variables.
  particlesX = new int[particles];
  particlesY = new int[particles];
  particlesAlpha = new int[particles];
  particlesRadius = new int[particles];
  mouseDown = false;
}

/**
* Renderizado.
*/
void draw()
{
  //Limpiamos el fondo de la pantalla.
  clearBackground();
  
  //Dibujamos el UI.
  renderUI();

  //Renderizamos el cursor en caso de hacer clic.
  drawCursor();
  renderParticles();
}

/**
* Limpia el fondo de la pantalla.
*/
void clearBackground()
{
  background(128, 128, 128);
}

/**
* Renderiza el UI de la aplicación.
*/
void renderUI()
{
  strokeWeight(2);
  stroke(96, 96, 96);
  fill(0, 0, 0);
  
  int panelWidth = width / instruments;
  int panelHeight = height / 2;
  
  //Dibujamos los paneles de instrumentos.
  for (int i = 0; i < instruments; i++)
    rect(i * panelWidth + 5, panelHeight + 5, panelWidth - 10, panelHeight - 10);
    
  //Panel para la animación.
  rect(5, 5, panelWidth * 1.5 - 10, panelHeight - 10);
  
  //Créditos.
  textSize(32);
  text("BASE COMPOSER", panelWidth * 1.5 + 5, 40);
  
  textSize(18);
  text("v1.0", panelWidth * 1.5 + 5, 60);
}

/**
* Muestra el cursor en pantalla.
*/
void drawCursor()
{
  //Mostramos nuestro cursor.
  stroke(224, 224, 224, 128);
  strokeWeight(1);
  line(mouseX - 5, mouseY, mouseX + 5, mouseY);
  line(mouseX, mouseY - 5, mouseX, mouseY + 5);
  
  //Generamos el efecto partículas.
  if (mouseDown)
  {
    int particle = nextParticle();

    if (particle > -1)
      generateParticle(particle, mouseX , mouseY);
  }
}

/**
* Hacemos clic con el ratón
*/
void mousePressed()
{
  mouseDown = true;
}

/**
* Dejamos de hacer clic con el ratón.
*/
void mouseReleased()
{
  mouseDown = false;
}

/**
* Genera una partícula.
*/%
