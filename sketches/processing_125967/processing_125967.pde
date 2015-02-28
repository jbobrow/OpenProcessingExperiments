
// Programa feito na pressa do que representou minha mudança de Maceió pra Curitiba este ano.
// Como o  OpenProcessing não gosta de mim, executem o codigo no processing.

PImage aviao;
PImage inferno_ceu;
int y = 500;


  

  
void setup() {
size(500, 500);

  aviao = loadImage("https://lh6.googleusercontent.com/-3-z8vMe3sQQ/UrN_4gDEdCI/AAAAAAAAAjw/VzV1-n4xntM/w501-h708-no/avi%25C3%25A3o.png");
  inferno_ceu = loadImage("https://lh6.googleusercontent.com/-6pIjPH04OKE/UrN_45BOAHI/AAAAAAAAAjs/4LL8LNmUuPw/s500-no/inferno_ceu.jpg");
  
}
void aviao(int velocidade){
  
  
  image(aviao, 120,velocidade,250, 250);
  
}
void draw() {
  if(y < -130){
    y+=630;
  }
  frameRate(120);
  image(inferno_ceu, 0, 0);
 aviao(y);
  y--;
}
