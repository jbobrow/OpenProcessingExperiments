
float x; //posició mafalda
float y;
float vx = random(5);
float vy = 3;
float midax = 445;
float miday = 250;


void setup() {
  size(700, 700);
  x = width/2;
  y = height/2;
}


void draw() {

  background(255);
  fondo();
  dibujo();

  
}



void dibujo() {
  
  if (mousePressed){
  background(136,201,124);
  x = mouseX;
  y = mouseY;
  
  textSize (100);
  fill (random (255), random(255), random(255));
  text("HOLA!", x-145, 250+y);
  
 
}
  
  fill(0); //PELO
  ellipse(x, y-30, 450, 300);

  fill(240, 196, 160); //CARA
  stroke(240, 196, 160);
  ellipse(x, y+20, 270, 170);

  fill(240, 196, 160); //CARA
  stroke(240, 196, 160);
  quad(x-100, y-135, x+100, y-135, x+70, y, x-70, y);

  fill(0); //FLEQUILLO
  stroke(0);
  arc(x, y-139, 220, 90, 0, PI+QUARTER_PI, OPEN);

  fill(0); //OJO IZQ
  stroke(0);
  ellipse(x-20, y-50, 10, 27);

  fill(0); //OJO DERECHO
  stroke(0);
  ellipse(x+20, y-50, 10, 27);

  fill(0); //BOCA
  ellipse(x, y+30, 150, 60);

  fill(240, 196, 160); //BOCA
  stroke(240, 196, 160);
  rect(x-100, y-5, 200, 35);

  fill(245, 171, 114); //NARIZ
  stroke(0);
  strokeWeight(2);
  ellipse(x, y-10, 40, 40);

  noFill();
  stroke(255, 102, 0);
  stroke(0, 0, 0);
  bezier(x-80, y+17, x-75, y+70, x+75, y+70, x+81, y+20);

  fill(255, 0, 0);   //MOFLETE IZQ
  stroke(255, 0, 0);
  ellipse(x-80, y+5, x/10+20, x/20+10);

  fill(255, 0, 0); //MOFLETE DERECHO
  stroke(255, 0, 0);
  ellipse(x+82, y+5, x/10+20, x/20+10);

  fill(255, 0, 0);   //LAZO IZQ
  stroke(0, 0, 0);
  quad(x-100, y-210, x, y-180, x, y-180, x-100, y-140);

  fill(255, 0, 0);   //LAZO DERECHO
  stroke(0, 0, 0);
  quad(x+100, y-210, x, y-180, x, y-180, x+100, y-140);

  stroke(0);   //LINEA LAZO
  line(x-70, y-180, x+75, y-180);

  fill(255, 0, 0);   //ELIPSE LAZO
  stroke(0);
  ellipse(x, y-180, 70, 40);

  x = x+vx;
  y = y+vy;

  if (x+midax/2 > width||x-midax/2 <0) {
    vx=-vx;
  }
  if (y+miday/2 > height||y-420/2 <0) {
    vy=-vy;
  }


}

void fondo() {

  background (250-mouseY/5, 5-mouseY/5, 55-mouseY/5);
}







