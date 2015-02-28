
PFont f;
int cartaAltura = 200;
int cartaLargura = 120;

/* Desenho de cada carta */
void desenhaCarta(int cartaX, int cartaY, String naipe, String numero){
  // Carta externa
  stroke(255, 255, 255);
  fill(231,223,206);
  rect(cartaX,cartaY,cartaLargura,cartaAltura,5);

  // Carta interna
  noStroke();  
  fill(211,203,186, 191);
  rect(cartaX+10,cartaY+10,cartaLargura-20,cartaAltura-20);

  // NÃºmero superior
  numeroNaipe(cartaX+20,cartaY+30, naipe, numero);
 
  // NÃºmero inferior
  pushMatrix(); 
  translate(cartaX + cartaLargura - 20, cartaY + cartaAltura - 30);
  rotate(radians(180));
  numeroNaipe(0,0, naipe, numero); 
  popMatrix();  
}

/* Desenho do conjunto naipe + nÃºmero */
void numeroNaipe(int posX, int posY, String naipe, String numero){
  textFont(f,14);

  if (naipe == "paus"){
    int naipeX = posX + 5;
    int naipeY = posY + 10;
    
    fill(0,0,0);     
    ellipse(naipeX,naipeY,6,6);
    ellipse(naipeX+3,naipeY+4,6,6);
    ellipse(naipeX-3,naipeY+4,6,6); 
    rect(naipeX-1,naipeY+4,3,6);  
  }
  else if (naipe == "ouros"){
    int naipeX = posX + 1;
    int naipeY = posY + 14;
    
    fill(180,25,16);    
    triangle(naipeX,naipeY, naipeX+10,naipeY, naipeX+5,naipeY+6);
    triangle(naipeX,naipeY, naipeX+10,naipeY, naipeX+5,naipeY-6);
  }
  else if (naipe == "copas"){
    int naipeX = posX + 1;
    int naipeY = posY + 14;
    
    fill(180,25,16);    
    ellipse(naipeX+3,naipeY,7,7);
    ellipse(naipeX+7,naipeY,7,7);
    triangle(naipeX,naipeY, naipeX+10,naipeY, naipeX+5,naipeY+6);
  }  
  else if (naipe == "espadas"){
    int naipeX = posX + 1;
    int naipeY = posY + 12;

    fill(0,0,0);    
    ellipse(naipeX+3,naipeY+5,7,7);
    ellipse(naipeX+7,naipeY+5,7,7);
    triangle(naipeX,naipeY+6, naipeX+10,naipeY+6, naipeX+5,naipeY-2);
    triangle(naipeX+3,naipeY+12, naipeX+7,naipeY+12, naipeX+5,naipeY+7);
  }
  
  text(numero,posX,posY);  
}

void setup(){
  size(640, 640);
  background(93,82,74);
  
  f = createFont("Arial Black",16,true); 
}

void draw(){
  // Desenho da padronagem de fundo
  for(int i=0; i<640; i++){
    noStroke();
    fill(70,61,55);
    rect(0, i, 640, 64);
    i = i + 128;  
  }

  // Desenho das cartas  
  int margem = 32;
  int cartaY = margem;
  int cartaX = margem;
  
  String[] naipes = new String[4];
  naipes[0] = "paus";
  naipes[1] = "ouros";
  naipes[2] = "espadas";
  naipes[3] = "copas";  
  
  for (int i=0; i<3; i++){
    cartaX = margem;
    for (int j=0; j<4; j++){
      desenhaCarta(cartaX,cartaY, naipes[j], str(j+1));
      cartaX = cartaX + margem + cartaLargura;
    }
    cartaY = cartaY + margem + cartaAltura;  
  }
 
  
}
