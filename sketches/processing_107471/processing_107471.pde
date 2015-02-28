
int posx;
int gr;

void setup() {

  size(600, 600);
  gr = 15;
  posx = 50;
  frameRate(24);
}

void draw() {

  background(gr);

  //estructura de control for
  for (int i=0; i<10; i=i+1) {
    fill(75, 100, 50);
    ellipse(posx*i, 60, 20, 50);
  }
  for (int i=20; i < 550; i=i+50) {

    fill(i%255, i%50, 50);
    rect(i, 200, 40, 40);
  }

  //demostrar funcion modulo utilizando operador %
  int num = mouseX;
  int mod = num%20;
  fill(255);
  text("mouseX =" + num, width/2, (height/2)-30);
  text("mouseX % 20 = "+ mod, width/2, height/2);
  text("frameRate: " + frameRate,width/2,(height/2)+30);

  //movimiento lineal
  fill(80,80,250);
  rect(posx,500,50,50);

  posx = posx + 1;
  posx = posx % 600;

}//fin de funcion draw




