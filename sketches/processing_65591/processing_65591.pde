
 PImage[] images = new PImage[25];
int indice = 0;  
float g;   float b;   float r; //variables RGB
float rota;
float rotaRad;
float glitch;
float grayy;
float rojo;
float apareceRandm;

void setup() {
  frameRate(60);
  smooth();
  size (1000,600);
  
   for ( int i = 0; i < images.length; i++ )
    {
    images[i] = loadImage( "weaponsB" + i + ".png" );
    }
}

void draw() {
grayy = random(180,255);
rojo=random(240,255);
apareceRandm = random(25);
//  background(grayy);
fill(rojo,grayy,grayy,11);
rect(0,0,2000,2000);
  r= random(0,255);    g= random(0,20);    b= random(60,100);
  smooth();
  noStroke();
  fill(0);
  tint(r,g,g);
  glitch = random(120,350);
  
  rota = -mouseX * (320090 +mouseY) / 480;
  rotaRad = radians(rota);

  translate(mouseX, mouseY);
  rotate(-rotaRad);

  indice = (indice + 1) % images.length;
  for (int g = 0; g < 25; g++){
//    image(images[indice], 0*g+glitch, 0-400*g+glitch, 300, 600) ;
    image(images[indice], 0*g+glitch*2, 0-400*g+glitch*2, 300, 600) ;
    image(images[indice], 0*g+glitch*-2, 0-400*g+glitch*-2, 300, 600) ;

        
  }
  
}




