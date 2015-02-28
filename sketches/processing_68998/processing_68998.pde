
/* --------------------------------------------------------------------------
 Travail de rattrapage
 Boutons et boucles
 Par Jean-François Bourbeau
 -------------------------------------------------------------------------- */


int x1;
int y1;
int w1;
int h1;
int state1;

int x2;
int y2;
int w2;
int h2;
int state2;

float w;
float q;




void setup() {
  size(400, 400);
  smooth();



  // carré
  x1 = width/4+140;
  y1 = height/2-25;
  w1 = 50;
  h1 = 50;
  state1 = 0;

  // cercle
  x2 = width/4+30;
  y2 = height/2;
  w2 = 50;
  h2 = 50;
  state2 = 0;
}

void draw() {

  background(100);



  // carré


  if ( state1 == 1 ) {
    fill(250, 18, 208);


    //lignes verticales:

    stroke(0);
    strokeWeight(5);
    int y =10; 
    while ( y < w ) {
      line(0, y, width, y);
      y = y + 20;
    }

    if (w<400) {
      w= w+5;
    }

    // carré
  } 
  else {
    fill(10, 250, 8);



    stroke(0);
    strokeWeight(5);
    int y =10; 
    while ( y < w ) {
      line(0, y, width, y);
      y = y + 20;
    }

    if (w>0) {
      w= w-5;
    }
  }
  noStroke();
  rect(x1, y1, w1, h1);



  // Cercle


  //Anneau autour du cercle 


  float x = 130;
  float y = 200;
  int nombreDeRayons = 20;
  int longueurDesRayons = 50;


  float tranche = TWO_PI / nombreDeRayons;
  float rads = 0;
  float ratio = 0.60;
  stroke(0);
  strokeWeight(5);

  while ( rads < q ) {
    float x1 = x+cos(rads) * longueurDesRayons * ratio;
    float y1 = y + sin(rads) * longueurDesRayons * ratio;
    float x2 = x+cos(rads) * longueurDesRayons;
    float y2 = y + sin(rads) * longueurDesRayons;
    line(x1, y1, x2, y2 );
    rads = rads + tranche;
  }


  if ( state2 == 1 ) {

    if (q<TWO_PI) {



      q = q + 0.3;
    }

    fill(250, 18, 208);
  } 
  else {


    if (q > 0) {
      q=q-0.3;
    }

    fill(10, 250, 8);
  }
  noStroke();
  ellipse(x2, y2, w2, h2);
}



//commande de la souris

void mousePressed() {

  if ( mouseX>x1 && mouseX<x1+w1 && mouseY>y1 && mouseY<y1+h1 ) {
    state1 = 1;
  }




  float  distance = dist( mouseX, mouseY, x2, y2 ) ;
  float rayon = 25;
  if ( distance < rayon ) {




    // mouseOver



    if ( state2 == 0 ) {
      state2 = 1;
    } 
    else {
      state2 = 0;
    }
  }
}

void mouseReleased() {
  state1 = 0;
}


