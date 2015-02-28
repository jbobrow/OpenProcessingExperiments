


int DIM = 800;

ArrayList<PShape> planetas;
ArrayList<PShape> asteroides;
PShape estrella;
PShape nave;

int contador = 0;
int xnave = 0;
int ynave = 0;


/**
 * Constructor del applet hace las veces de setup en processing
 * @param pB Applet padre que muestra la ventana
 */
void setup() 
{

  planetas=new ArrayList<PShape>();

  asteroides=new ArrayList<PShape>();

  for(int i=0;i<10;i++)
  {
    PShape a=loadShape("asteroide1500.svg");
    a.scale(0.1f);
    asteroides.add(a);
  }

  PShape ps;

  ps = loadShape("tierra1000.svg");
  ps.scale(0.1f);

  planetas.add(ps);
  ps = loadShape("tierra1000.svg");
  ps.scale(0.2f);

  planetas.add(ps);

  ps = loadShape("tierra3000.svg");
  ps.scale(0.09f);

  planetas.add(ps);

  ps = loadShape("tierra3000.svg");
  ps.scale(0.13f);

  planetas.add(ps);

  nave = loadShape("nave.svg");
  nave.scale(0.1f);

  estrella = loadShape("estrella.svg");
  estrella.scale(0.25f);

  size(800, 800);
  background(0);
}

/**
 	 * Metodo para mostrar las estrellas de forma aleatoria
 	 */
private void estrellas() {
  for (int i = 0; i < 100; i++)
    shape(estrella, random(800), random(800));
}

/**
 	 * Metodo para mostrar las orbitas
 	 */
 	private void orbitas() {
 		fill(0);
 		stroke(255, 0, 0);
 
 		ellipse((float) DIM / 2, (float) DIM / 2, 750, 750);
 		ellipse((float) DIM / 2, (float) DIM / 2, 510, 510);
 		ellipse((float) DIM / 2, (float) DIM / 2, 350, 350);
 		ellipse((float) DIM / 2, (float) DIM / 2, 170, 170);
 	}
 
 	/**
 	 * metodo para mostrar el sol
 	 */
 	private void sol() {
 		// sol
 		stroke(0);
 		fill(255, random(150, 255), 0);
 		ellipse((float) DIM / 2, (float) DIM / 2, 80, 80);
 
 	}
 
 	/**
 	 * metodo para mostrar los planetas
 	 */
 	private void planetas() {
 		shapeMode(CORNER);
 		
 		float angulo=0.1f;
 		for(PShape planeta:planetas)
 		{
 			shape(planeta,DIM / 2, DIM / 2);
 			planeta.rotate(angulo);
 			angulo/=2;
 		}
 	}
 	
 	/**
 	 * metodo para mostrar los planetas
 	 */
 	private void asteroides() {
 		shapeMode(CORNER);
 		
 		float angulo=0.1f;
 		for(PShape asteroide:asteroides)
 		{
 			shape(asteroide,DIM / 2, DIM / 2);
 			asteroide.rotate(angulo);
 			angulo/=2;
 		}
 	}
 
 	/**
 	 * metodo para mostrar la nave
 	 */
 	 void nave() {
 		shape(nave, xnave, ynave);
 
 		if (contador > 700) {
 			nave = loadShape("nave.svg");
 			nave.scale(0.1f);
 			contador = 0;
 
 			int tiradaX = (int) random(2);
 			int tiradaY = (int) random(2);
 
 			if (tiradaX == 0)
 				xnave = (int) random(10, 100);
 			else
 				xnave = (int) random(700, 790);
 
 			if (tiradaY == 0)
 				ynave = (int) random(10, 100);
 			else
 				ynave = (int) random(700, 790);
 		}
 
 		nave.translate(10, 10);
 	}
 
/**
 * Metodo draw que dibuja todos los elementos del applet en orden
 */
void draw() 
{
  background(0);

  estrellas();
  orbitas();
   		estrellas();
   		sol();
   		planetas();
   		asteroides();
   		nave();

  smooth();

  contador++;
}


