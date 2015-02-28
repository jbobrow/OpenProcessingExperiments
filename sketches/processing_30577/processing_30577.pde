
float x, y;                                 //variaveis
float velx, vely;
float lim = 5;
 
void setup() {              
  size(500, 500);                           //tamanho da imagem
  smooth();
  x = lim;
  y = lim;
  velx = 20 / lim;
  vely = 20 / lim;
}
 
void draw() {                               //açoes do void setup - draw
  noStroke();
  fill(0, 8);
  rect (0, 0, width, height);
 
  ellipseMode(CENTER);                      //definiçoes de surgimento da ellipse
  fill(255, 1);
  for ( int i = 0; i < 5; i++) {
    int m = int ( random ( 5, 10));
    stroke(25, 800);
    strokeWeight (m /((m-i) *i +1));
    ellipse(width/2, height/2, x - 2*m*i, y - m*i);
    m += 2*m;
  }
 
  if (x > width-10 || x < lim) velx *= (-1);    //condições
  if (y > height-5 || y < lim) vely *= (-1);
 
  x += 1*velx;
  y -= 1*vely;
}


