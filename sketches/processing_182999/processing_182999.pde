
float mida = random (50);
float posicioX = 300;
float posicioY = 300;
float velocitatX = random(60);
float velocitatY = random(60);
PImage clouds;
float offset = 0;
float easing = 0.05;

void setup () {
  size (770, 511);
  clouds= loadImage ("clouds.jpg");
  smooth ();
}

void draw () {
  background(245);
  image (clouds, 0, 0);
  float dx = (mouseX-clouds.width/2) - offset;
  offset += dx * easing; 
  tint(255, 127); 
  image (clouds, offset, 0);
  stroke (255);
  strokeWeight (3);
  ellipse(posicioX, posicioY, mida, mida);
  posicioX = posicioX + velocitatX;
  posicioY = posicioY + velocitatY;

  textSize(80);
  text("KNOCKIN' ON", width/4, height/2);
  text ("HEAVEN'S DOORS", 60, 320); 
  if (posicioX + posicioY == mouseX + mouseY) { 
    fill (random (255), (255));
  }


  if (posicioX >= width - (mida/2) || posicioX <= 0 + (mida/2)) {
    velocitatX = - velocitatX;
  } 

  if (posicioY >= height - (mida/2) || posicioY <= 0 + (mida/2)) { 
    velocitatY = - velocitatY;
  }
}

void mousePressed () {
  mida = random (20, 100);
  velocitatX = random(-45, 12);
  velocitatY = random (-45, 12);
  posicioX = mouseX;
  posicioY = mouseY;
  fill (random (255), random (255), random(255));
}



