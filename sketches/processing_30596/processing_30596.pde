
/**
 * Cubismo. 
 * 
 * Mova as barras de rolagem horizontalmente para alterar a posição das imagens. 
 */
 
 // Adapted from Scrollbar by Ben Fry and Casey Reas
 
HScrollbar hs1, hs2, hs3, hs4, hs5, hs6, hs7, hs8, hs9, hs10, hs11, hs12;

PImage um, dois, tres, quat, cinc, seis, sete, oito, nove, dez, onze, doze, maskImg;         // doze imagens para carregar
int umWidth, doisWidth, tresWidth, quatWidth, cincWidth, seisWidth, seteWidth, oitoWidth, noveWidth, dezWidth, onzeWidth, dozeWidth;  // The width of the top and bottom images


void setup()
{
  size(900, 600);
  noStroke();
  hs1 = new HScrollbar(0, 10, width, 10, 3*5+1);
  hs2 = new HScrollbar(0, 60, width, 10, 3*5+1);
  hs3 = new HScrollbar(0, 110, width, 10, 3*5+1);
  hs4 = new HScrollbar(0, 160, width, 10, 3*5+1);
  hs5 = new HScrollbar(0, 210, width, 10, 3*5+1);
  hs6 = new HScrollbar(0, 260, width, 10, 3*5+1);
  hs7 = new HScrollbar(0, 310, width, 10, 3*5+1);
  hs8 = new HScrollbar(0, 360, width, 10, 3*5+1);
  hs9 = new HScrollbar(0, 410, width, 10, 3*5+1);
  hs10 = new HScrollbar(0, 460, width, 10, 3*5+1);
  hs11 = new HScrollbar(0, 510, width, 10, 3*5+1);
  hs12 = new HScrollbar(0, 560, width, 10, 3*5+1);
  
  
  um = loadImage("fatia01.jpg");
  umWidth = um.width;
  dois = loadImage("fatia02.jpg");
  doisWidth = dois.width;
  tres = loadImage("fatia03.jpg");
  tresWidth = tres.width;
  quat = loadImage("fatia04.jpg");
  quatWidth = quat.width;
  cinc = loadImage("fatia05.jpg");
  cincWidth = cinc.width;
  seis = loadImage("fatia06.jpg");
  seisWidth = seis.width;
  sete = loadImage("fatia07.jpg");
  seteWidth = sete.width;
  oito = loadImage("fatia08.jpg");
  oitoWidth = oito.width;
  nove = loadImage("fatia09.jpg");
  noveWidth = nove.width;
  dez = loadImage("fatia10.jpg");
  dezWidth = dez.width;
  onze = loadImage("fatia11.jpg");
  onzeWidth = onze.width;
  doze = loadImage("fatia12.jpg");
  dozeWidth = doze.width;

}

void draw()
{
  background(255);
  
  
  // Pegue a posição da barra de rolagem
  // e converta em um valor para mostrar as imagens 
  float umPos = hs1.getPos()-width/2;
  fill(255);
  image(um, -umWidth/3 + umPos*2, 0);
  
  float doisPos = hs2.getPos()-width/2;
  fill(255);
  image(dois, -doisWidth/3 + doisPos*2, 50);
  
  float tresPos = hs3.getPos()-width/2;
  fill(255);
  image(tres, -tresWidth/3 + tresPos*2, 100);
  
  float quatPos = hs4.getPos()-width/2;
  fill(255);
  image(quat, -quatWidth/3 + quatPos*2, 150);
  
  float cincPos = hs5.getPos()-width/2;
  fill(255);
  image(cinc, -cincWidth/3 + cincPos*2, 200);
  
  float seisPos = hs6.getPos()-width/2;
  fill(255);
  image(seis, -seisWidth/3 + seisPos*2, 250);
  
  float setePos = hs7.getPos()-width/2;
  fill(255);
  image(sete, -seteWidth/3 + setePos*2, 300);
  
  float oitoPos = hs8.getPos()-width/2;
  fill(255);
  image(oito, -oitoWidth/3 + oitoPos*2, 350);
  
  float novePos = hs9.getPos()-width/2;
  fill(255);
  image(nove, -noveWidth/3 + novePos*2, 400);
  
  float dezPos = hs10.getPos()-width/2;
  fill(255);
  image(dez, -dezWidth/3 + dezPos*2, 450);
  
  float onzePos = hs11.getPos()-width/2;
  fill(255);
  image(onze, -onzeWidth/3 + onzePos*2, 500);
  
  float dozePos = hs12.getPos()-width/2;
  fill(255);
  image(doze, -dozeWidth/3 + dozePos*2, 550);
  

  hs1.update();
  hs2.update();
  hs3.update();
  hs4.update();
  hs5.update();
  hs6.update();
  hs7.update();
  hs8.update();
  hs9.update();
  hs10.update();
  hs11.update();
  hs12.update();
  hs1.display();
  hs2.display();
  hs3.display();
  hs4.display();
  hs5.display();
  hs6.display();
  hs7.display();
  hs8.display();
  hs9.display();
  hs10.display();
  hs11.display();
  hs12.display();
}


class HScrollbar
{
  int swidth, sheight;    // largura e altura da barra
  int xpos, ypos;         // posição x e y da barra
  float spos, newspos;    // posição x da rolagem
  int sposMin, sposMax;   // valores mínimos e máximos da rolagem
  int loose;              // quão solto/pesado
  boolean over;           // o mouse está sobre a rolagem?
  boolean locked;
  float ratio;

  HScrollbar (int xp, int yp, int sw, int sh, int l) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + swidth/2 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
  }

  void update() {
    if(over()) {
      over = true;
    } else {
      over = false;
    }
    if(mousePressed && over) {
      locked = true;
    }
    if(!mousePressed) {
      locked = false;
    }
    if(locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if(abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  int constrain(int val, int minv, int maxv) {
    return min(max(val, minv), maxv);
  }

  boolean over() {
    if(mouseX > xpos && mouseX < xpos+swidth &&
    mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    fill(255, 10);
    rect(xpos, ypos, swidth, sheight);
    if(over || locked) {
      fill(0, 180, 150, 80);
    } else {
      fill(255, 50);
    }
    rect(spos, ypos, sheight, sheight);
  }

  float getPos() {
    // Converta spos para volores entre
    // 0 e o total da larura da barra de rolagem
    return spos * ratio;
  }
}

