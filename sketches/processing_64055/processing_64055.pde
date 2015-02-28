

PFont fonte;
PGraphics tela;

void setup() {
  size(900,900);
  background (255);
  smooth ();
  strokeWeight (0.25);
  fonte = loadFont ("ComicSansMS-Bold-250.vlw"); // carrega fonte
  tela = createGraphics (900, 900, P3D);
}

void keyPressed () { // quando clicar ... desenha uma letra na tela
  background (255);
  tela.beginDraw ();
  tela.background (255);
  tela.fill (0);
  tela.textFont (fonte);
  tela.text("Kabum", 0, height/2); //carrega a ultima tecla clicada na posição x e y
  tela.endDraw ();
}

void draw () {
  // image (tela,0,0);
  int x, y, tam;
  tam =10;

  for ( int i =0; i<500; i++) {
    x = int (random(width));
    y = int(random(height));

    if (! (tela.get(x, y)==-1)) { // sortear e se não der menos um desenhar um traço
      fill (255,255,0);
      stroke (0);
      rect (x, y, random(-tam, tam), random(-tam, tam));

      // tela.get(int (random(width)),int(random(height)));
    }
  }
}

void mousePressed() {
 // println(get(mouseX, mouseY));
 save(millis()+".png");
}


