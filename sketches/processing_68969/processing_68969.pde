
boolean rondClic = false;
boolean rectClic = false;

int rectX = 300;
int rectY = 200;
int rectSize = 50;

int i = 0;
int v = 0;
float vitesseRond = 0;

float rondX = 100;
float rondY = 200;

float rayonsX = 50;
float rayonsY = 100;
int nombreDeRayons = 20;
int longueurDesRayons = 60;



void setup() {
  size(400, 400);
  smooth();
  stroke(0);
}


void draw() {

  background(150);  
  rectMode(CENTER);  




  //BOUTON ROND//////////////////////


  strokeWeight(5);
    stroke(#FFF700);
    float tranche = TWO_PI / nombreDeRayons;
    float rads = 0;
    float ratio = 0.55;

//Desinner les traits tant qu'il n'en a pas tout autour de la sphere

  if (rondClic == true ) {
    fill(45, 120, 32);
  
    rads = 0;

    while ( rads < vitesseRond && rads < TWO_PI ) {
      float x1 = rondX + cos(rads) * longueurDesRayons * ratio;
      float y1 = rondY + sin(rads) * longueurDesRayons * ratio;
      float x2 = rondX + cos(rads) * longueurDesRayons;
      float y2 = rondY + sin(rads) * longueurDesRayons;
      line(x1, y1, x2, y2 );
      rads = rads + tranche;
    }
    
    if(rads < TWO_PI){
      vitesseRond += 0.3;
    }
    
  }
  
//Effacer les traits déjà apparus  
  else {
    fill(255);
    
    if( vitesseRond > 0 ){
    
      vitesseRond -= 0.3;
      
    }
    
    
    rads = 0;
    
    while ( rads < vitesseRond && rads < TWO_PI ) {
      float x1 = rondX + cos(rads) * longueurDesRayons * ratio;
      float y1 = rondY + sin(rads) * longueurDesRayons * ratio;
      float x2 = rondX + cos(rads) * longueurDesRayons;
      float y2 = rondY + sin(rads) * longueurDesRayons;
      line(x1, y1, x2, y2 );
      rads = rads + tranche;
    }
    
    
    
    
  } 







  noStroke();
  ellipse(rondX, rondY, rectSize, rectSize);
  //BOUTON RECTANGLE //////////////////

  stroke(1);
  if (rectClic == true)
  {
    fill(45, 120, 32);

    i = 0;// renitialiser le I pour que les line ce dessine en haut de la scene
    while ( i < v ) { 
      line(0, i, width, i);
      i += 10;
    } 

    if (v<width) {
      v+=3;
    }
  }
  else {

    if (v >0 )
    {
      v-=3;
    }


    i = 0; // renitialiser le I pour que les line ce dessine en haut de la scene
    while ( i < v ) { 

      line(0, i, width, i);
      i += 10;
    } 




    fill(255);
  }
  noStroke();
  rect( rectX, rectY, rectSize, rectSize);
}

void mousePressed() {


  float distance = dist( mouseX, mouseY, 100, 200 );


  if ( distance < 25) {
    if ( rondClic == false )
    {
      rondClic = true;
    }
    else {
      rondClic = false;
    }
  }

  if  ( mouseX>rectX-rectSize && mouseX<rectX+rectSize && mouseY>rectY-rectSize && mouseY<rectY+rectSize )
  {
    rectClic = true;
  }
}


void mouseReleased() {


  rectClic = false;
}

