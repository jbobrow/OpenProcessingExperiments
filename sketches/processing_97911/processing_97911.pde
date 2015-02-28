


///////////////////////////////////////////////////////////////////////////////

// _idilio (rasa)

///////////////////////////////////////////////////////////////////////////////

// Práctica 01_ Workshop Grafía Manual Degenerativa

///////////////////////////////////////////////////////////////////////////////

// Busco el silencio en medio del ruido, 
// haciéndome el sordo hasta que me transforme.
// Francis Picabia

///////////////////////////////////////////////////////////////////////////////

void setup() {
  background (200);
  size (900, 500);
  smooth();
  frameRate (7);
}

///////////////////////////////////////////////////////////////////////////////

void draw() { 
  noStroke();
  fill (200, 200, 200, 90);
  rect (0, 0, 2000, 2000);

  stroke (93, 93, 93, random (70));
  strokeWeight (random (10));
  // gris == destrucción
  // patético, odioso, furioso, temible.
  line (250, 250, random (1250), random (1850));
  line (550, 150, random (1250), random (1850));
  line (750, 200, random (1250), random (1850));
  line (400, 400, random (1250), random (1850));

  // azul == quietud
  // heroico, erótico, maravilloso, arrebatador.
  strokeWeight  (random (10));
  stroke (25, random (255), 255, random (70));
  line (550, 250, random (1250), random (1850));
  line (250, 150, random (1250), random (1850));
  line (70, 200, random (1250), random (1850));
  line (400, 50, random (1250), random (1850));

  fill (255, 255, 255, 140);
  noStroke();
  noCursor();
  ellipse (random (mouseY, mouseX), random (mouseY, mouseX), 5, 5);
  ellipse (random (mouseX, mouseY), random (mouseX, mouseY), 5, 5);
  // Elipse == "tranquilidad"
  stroke (255, 255, 255, 200);
  ellipse(400, 220, 2, 2);
  noFill();
  strokeWeight( random( 1500 ) );
  ellipse(400, 220, 2, 2);
}

///////////////////////////////////////////////////////////////////////////////


