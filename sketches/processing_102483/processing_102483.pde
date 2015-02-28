
/* @pjs preload="komar.png"; */
PImage komar;

int faza = 0;
float skalaKomara = 1.0f;
int t0;

int[] tab1, tab2;
int szer = 50, wys = 160;
int szer_plomienia = 20;
float gestosc = 0.07f; // oryginalnie 0.05
int grub_isk = 3;
int il_isk = (int)(szer_plomienia * gestosc);
color[] rgb;
PImage buf;
PFont font1, font2;

void setup() {
  size(512, 512);
  noSmooth();
  komar = loadImage("komar.png");
  
  textAlign(CENTER, CENTER);
  font1 = createFont("Arial", 52);
  font2 = createFont("Tahoma", 12);
  
  buf = createImage(szer, wys, RGB);
  tab1 = new int[wys*szer];
  tab2 = new int[wys*szer];
  for(int i=tab1.length-1; i>=0; --i) {
    tab1[i] = tab2[i] = 0;
  }
  
  rgb = new color[256];
  for(int i=0; i<=15; ++i)
    rgb[i] = color(255 - i, 255-(i*i), 255-i*16);
    //rgb[i] = color(i*16, 0, 0);
  for(int i=16; i<=78; ++i)
    rgb[i] = color(30*8, (i-15)*4, 0);
  for(int i=79; i<=255; ++i)
    rgb[i] = color(60*4, 63*4, (i / 3 - 26)*4);
}

void draw() {
  background(255);
  if(faza < 2) {
    float y = (height - komar.height) / 4;
    textFont(font1);
    fill(255, 180, 210);
    text("♥ komary ♥", width/2, y);
    
    pokaKomara(skalaKomara);
    if(faza == 1) {
      skalaKomara *= 0.95f;
      if(skalaKomara * max(komar.width, komar.height) < 2.0f) {
        faza = 2;
        t0 = millis();
        skalaKomara = 1.0f;
      }
    } else {
      y = ((height + komar.height) / 2 + height) / 2;
      
      fill(192, 198, 222);
      stroke(0);
      strokeWeight(1);
      
      rect(width/2 - 70, y-12, 140, 24);
      
      fill(0);
      textFont(font2);
      text("Rozpocznij holokaust!", width/2, y);
    }
  } else {
    int t1 = millis() - t0;
    if(t1 >  1600) ogien();
    if(t1 > 11600) {
      tab1 = new int[wys*szer];
      tab2 = new int[wys*szer];
      for(int i=tab1.length-1; i>=0; --i) {
        tab1[i] = tab2[i] = 0;
      }
      faza = 0;
    }
    
    if(get(width/2, height/2) == color(255))
      set(width / 2, height / 2, color(0));
  }
}

void mousePressed() {
  if(faza > 0) return;
  int x = width/2 - 70;
  if(mouseX < x) return;
  int y = ((height + komar.height) / 2 + height) / 2 - 12;
  if((mouseY < y) || (mouseX >= x+140) || (mouseY >= y+24)) return;
  faza = 1;
}

void pokaKomara(float skala) {
  float w = komar.width * skala;
  float h = komar.height * skala;
  float x = (width - w) / 2;
  float y = (height - h) / 2;
  noFill();
  noStroke();
  image(komar, x, y, w, h);
}

void licz_punkt(int poz) {
  //tab2[poz] = (tab1[poz-szer] + tab1[poz]) / 2;
  tab2[poz] = (
    tab1[poz-1] + tab1[poz] + tab1[poz+1] +
    tab1[poz-1+szer] + tab1[poz+szer+1] +
    tab1[poz-1+szer+szer] + tab1[poz+szer+szer] + tab1[poz+1+szer+szer]
  ) / 8;
  if(tab2[poz] < 250) {
    if(tab2[poz] >= 20)
      tab2[poz] += (int)random(5) - 2;
    else if(tab2[poz] >= 15) 
      tab2[poz] += (int)random(3) - 1;
    if((tab2[poz] > 1) && (random(1) < 0.2))
      ++tab2[poz];
  }
}

void wstaw_iskry() {
  for(int y=wys-grub_isk; y<wys; ++y)
    for(int x=1; x<=il_isk; ++x)
      tab1[(szer - szer_plomienia) / 2 + (int)random(szer_plomienia) + szer*y - 1] = 200 + (int)random(55);
  int i = int(wys-5) * szer + int(szer / 2);
  tab1[i-4] = max(200 + (int)random(55), tab1[i-4]);
  tab1[i+3] = max(200 + (int)random(55), tab1[i+3]);
}

void ogien() {
  for(int y=1; y<wys-2; ++y)
    for(int x=1; x<szer-1; ++x)
      licz_punkt(y*szer+x);
  buf.loadPixels();
  for(int i=0; i<tab1.length; ++i) {
    tab1[i] = tab2[i];
    buf.pixels[i] = rgb[tab2[i]];
  }
  wstaw_iskry();
  buf.updatePixels();
  
  float w = szer * 2;
  float h = wys * 2;
  image(buf, (width - w) / 2, 0, w, h);
}

