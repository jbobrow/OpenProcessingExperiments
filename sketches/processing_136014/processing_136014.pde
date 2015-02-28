
// Majida Rahall 18-02-2014
/* Foguete Espacial de Majida Rahall estÃ�ï¿½Ã�Â¡ licenciado com uma LicenÃ�ï¿½Ã�Â§a Creative Commons - AtribuiÃ�ï¿½Ã�Â§Ã�ï¿½Ã�Â£o-NÃ�ï¿½Ã�Â£oComercial 4.0 Internacional. */

float x = 600;
float y;
float z;



 
void setup(){
  size (600, 400);
  z = height/2;
}
 
void draw(){
  //ceu
  noStroke();
  for (int i=0; i<width; i+=3)
  {
    for (int j=0; j<height; j+=3)
    {
      fill (200 + j/4, 160 + i/40, 137);
      rect (i, j, 20, 20);
    }
  }
   
  //montanhas 
  fill(234, 148, 130); noStroke();
  beginShape();
  vertex(0,400);
  for(float i = 0; i <= x; i+=10.0) {
    float a = i;
    float b = 160 + 100*noise((i+50000)/100);
    vertex(a,b);  
  }
  vertex(x,400);
  endShape();
  //
  fill(183,95,78); noStroke();
  beginShape();
  vertex(0,400);
  for(float i = 0; i <= x; i+=10.0) {
    float c = i;
    float d = 230 + 100*noise(i/100);
    vertex(c,d);  
  }
  vertex(x,400);
  endShape();
 
//foguete
//variÃ�ï¿½Ã�Â¡veis Z faz com que o foguete varie na vertical (height)
  fill    (random(255),0,0,random (75)); //fogo foguete
  noStroke();
  rect    (227,z,50,z+200);
  fill    (193,88,88); //cupula foguete   
  noStroke();              
  ellipse (252,z,72,72); 
 
  fill   (255, 150);//lua
  ellipse(450, 144, 72, 72);
  
  fill    (255);//corpo do foguete
  noStroke();
  rect    (216,z, 72, 200);
  
  fill(150); //janela
  rect(229, z, 46, 20);
 
  fill    (200);//braÃ�ï¿½Ã�Â§o esquerdo
  noStroke();
  rect    (196, z+20, 20, 200);
  
  fill    (200); //braÃ�ï¿½Ã�Â§o direito
  noStroke();
  rect    (288, z+20, 20, 200);
  
  fill    (200); //braÃ�ï¿½Ã�Â§o frontal
  noStroke();
  rect    (242, z +20, 20, 200);
   
  //movimento do foguete
  //funÃ�ï¿½Ã�Â§Ã�ï¿½Ã�Â£o seno, faz com que ele vÃ�ï¿½Ã�Â¡ e volte
  z = 10 + 200*sin (y);
  y = y + 0.01;
   
 
}

