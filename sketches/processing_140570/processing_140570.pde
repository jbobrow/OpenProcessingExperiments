
/*"O Clima" by Matheus Geraldini, licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license.
Work: http://openprocessing.org/visuals/?visualID= 133293
License: Este trabalho estÃ¡ licenciado sob uma LicenÃ§a Creative Commons AtribuiÃ§Ã£o 4.0 Internacional. Para ver uma cÃ³pia desta licenÃ§a, visite http://creativecommons.org/licenses/by/4.0/deed.pt_BR.*/
//referencia do professor merkle para a neve
// Neve
int pingos=600;
int predios=10;
float [] chuvax;
float [] chuvay;
int [] np;
 
 
void setup() {
  size(600, 600);
  chuvax = new float[pingos];
  chuvay = new float[pingos];
  
  for (int i=0; i<pingos; i++)
  {
    chuvax[i] = floor(random(width));
    chuvay[i] = floor(random(height));
  }
  
  np = new int [predios];
    
  for (int p=0; p<10; p++)
  {
    np[p] = floor(random(10,390));
  }
}
 
void draw() {

  if (mouseX<width/2) {
    background (116, 235, 255);
    stroke(150);
    strokeWeight(3);
    noStroke();
    fill(100,100,100);
    predios();
    //grama
    fill(2, 59, 22);
    rect(0, 400, 600, 200);
    stroke(200);
    nome();
  }
  
  else {
    
    background (212, 217, 219);
    size (600,600);
    stroke(150);
    strokeWeight(3);
    noStroke();
    fill(100,100,100);
    predios();
    //chao com neve
    fill(250, 252, 251);
    rect(0, 400, 600, 200);
    stroke(200);
    nome();
    
    for (int i=0; i<pingos; i++)
    {
      point(chuvax[i], chuvay[i]);
      chuvay[i]=chuvay[i]+random(-0.1, 0.5);
      chuvax[i]=chuvax[i]+random(-0.1, 0.1);
      if (chuvay[i]>height)
      {
        chuvax[i] = floor(random(width*1.5));
        chuvay[i] = floor(random(height));
      }
    }
  }
}
 
void nome () {
  //nome
  textSize(16);
  text("Matheus Geraldini 2014",10, 30);
}

void predios() {
  //predios
  
  for (int p=0; p<10; p++)
  {
  rect(p*60,400,100,-np[p]);
  }
}
