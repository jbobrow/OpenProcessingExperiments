
int xx;
int y=1;
void setup () {
  size (640, 426);
  background (145, 162, 214);
  xx = 0;

}
 
void draw() {
  background (145, 162, 214); //sol
  frameRate(60);
  fill(244, 245, 47);
  ellipse(xx, height/5, 50, 50);
  if (xx < 400) {
    xx++;
  }
  
  noStroke (); // gramado
  fill (84, 142, 69);
  rect (0, 230, 640, 200);
  
  fill (61, 62, 39); //tronco
  rect (90, 180, 5, 50);
 
  fill (44, 70, 55); //copa da árvore
  ellipse (90, 140, 60, 83);
 
  noStroke (); //Fundo capela
  fill (77, 77, 48);
  rect (150, 150, 400, 90);
 
  fill (33, 33, 32); //fundo capela 2
  if (mouseX<150) { 
    fill(33, 33, 32);
  }
  else if (mouseY>100) {
    fill(245, 250, 114);
  }
  rect (160, 200, 384, 40);
 
  fill (175, 175, 173);//piso capela
  rect(150, 233, 400, 7);
 
  for (int a=150; a<560; a+=50) //pilares
  {
    fill (224, 197, 147);
    rect (a, 150, 5, 90);
  }
 
  rect (150, 150, 400, 5); //telhado
 
  rect (0, 185, 140, 50); //muro
 
  fill (33, 33, 32); //janelinha
  if (mouseX<0) { 
    fill(33, 33, 32);
  }
  else if (mouseY>200) {
    fill(245, 250, 114);
  }
  rect (10, 205, 15, 10);
 
  fill(87, 111, 129); //lago
  ellipse (210, 300, 300, 60);
}

//imagem de referência http://farm8.staticflickr.com/7389/8988579493_9bc07efc61_o.jpg
