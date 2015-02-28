
// Fazer relógio analógico com o ponteiro das horas e dos minutos em pontos.
// Utilizar imagem como fundo para animar.

  float secondsRadius;
  void setup()
  {
    size (300,300); //tamanho da janela
    smooth();
    int radius = min(width, height)/2; // intruzir os pontos dos minutos
    secondsRadius = radius * 0.75;
    
  }
  
  void draw() 
  {
    noFill ();
    noStroke();
 PImage sec;
   sec= loadImage ("Untitled-1.png"); // imagem dos segundos que roda

   
    float s= map(second(), 0, 60, 0, TWO_PI)- HALF_PI; // mapear os segundos de 0 a 60 consoante o tamanho da janela 
    float m= map(minute(), 0, 60, 0, TWO_PI)- HALF_PI;
    float h= map(hour() + norm(minute(),0,60), 0, 12, 0, TWO_PI)- HALF_PI;

   PImage b;
     b= loadImage ("bg.png"); // imagem de fundo
     image (b,0,0);

  
   tint (255,255,255, (h*10)+20); // cor espalhada pela janela (cor original)
 
      stroke(47,202,247); // cor do ponteiro das horas
    strokeWeight (25); // tamanho do ponteiro das horas
    point (cos(h) * 110+150, sin(h) * 110 + 150);// posição do ponteiros das horas consoante a medida da janela
    

    stroke(799,19,10); // cor do ponteiro dos minutos
   strokeWeight (15); // tamanho do ponteiro dos minutos
    point (cos(m) * 110+150, sin(m) * 110 + 150); // posição do ponteiro dos minutos

   
 // Pontos do relógio
 stroke(0); // cor dos pontos
 strokeWeight(5); // tamanho dos pontos
  beginShape(POINT);
  for (int a = 0; a < 360; a+=30) {
    float x = width/2 + cos(radians(a)) * secondsRadius; // possição dos pontos dos minutos
    float y = height/2 + sin(radians(a)) * secondsRadius;
    vertex(x, y); //eixo
  }
  endShape();

    

translate (width/2, height/2); // translação do ponteiro dos segundos
   rotate (s);
   s += PI/12;
   image (sec,-sec.width/2,-sec.height/2); // ponteiro dos segundos que roda
  }
 
 
  
  
   
 
  

