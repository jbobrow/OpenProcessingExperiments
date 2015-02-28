
/*"O Clima" by Matheus Geraldini, licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license.
Work: http://openprocessing.org/visuals/?visualID= 133293 
License: Este trabalho estÃ¡ licenciado sob uma LicenÃ§a Creative Commons AtribuiÃ§Ã£o 4.0 Internacional. Para ver uma cÃ³pia desta licenÃ§a, visite http://creativecommons.org/licenses/by/4.0/deed.pt_BR.*/
//referencia do professor merkle para a neve
// Neve
int pingos=600;
float [] chuvax;
float [] chuvay;


void setup() {
  size(600, 600);
  chuvax = new float[pingos];
  chuvay = new float[pingos];
  for (int i=0; i<pingos; i++)
  {
    chuvax[i] = floor(random(width));
    chuvay[i] = floor(random(height));
  }
}

void draw() {
  if (mouseX<width/2) {
    background (212, 217, 219);
    stroke(150);
    strokeWeight(3);
    noStroke();
    predio();
    //chao com neve
    fill(250, 252, 251);
    rect(0, 400, 600, 200);
    stroke(200);
    for (int i=0; i<pingos; i++)
    {
      point(chuvax[i], chuvay[i]);
      chuvay[i]=chuvay[i]+random(-0.1, 0.5);
      chuvax[i]=chuvax[i]+random(-0.1, 0.1);
      if (chuvay[i]>height)
      {
        chuvax[i] = floor(random(width*1.5));
        chuvay[i] = 0;//floor(random(height));
      }
    }
  } 
  else {
    background (116, 235, 255);
    stroke(150);
    strokeWeight(3);
    noStroke();
    predio();
    //grama
    fill(2, 59, 22);
    rect(0, 400, 600, 200);
    stroke(200);
  }
}

void predio () {
  //predios
  
  for (int p=0; i<11; p++)
  rect(random(0,width),random(100,300),random(10,100),random(100,300));
  }

