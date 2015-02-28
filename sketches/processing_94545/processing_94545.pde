
float x;              //deklaracja zmiennych - nie mają jeszcze wartości!
float y;
float[] hx;           //deklaracja pustych tablic
float[] hy;

void setup() {        //setup - blok kodu wykonywany na początku programu
  size(600, 400);     //wielkość okna
             
  x = width/2;        //inicjalizacja zmiennych x i y w połowie okna
  y = height/2;
  
  hx = new float[1];  //inicjalizacja tablicy z jednym miejscem (wciąż pustym!)
  hx[0] = x;          //na pierwszym miejscu - pozycja startowa
  hy = new float[1];
  hy[0] = y;
}

void draw() {         //draw - blok kodu wykonywany co klatkę
  background(255);    //czyszczenie ekranu - kolor biały
  zrobKrok();
  zapiszKrok();
  rysujSlad();
  rysuj();
}


void zrobKrok() {     //zmieniamy x i y, dodając losową liczbę między -1.5 a 1.5
  x += noise(frameCount * 0.01, 1) * 3 - 1.5; //krok w poziomie
  y += noise(1, frameCount * 0.01) * 3 - 1.5; //krok w pionie
}

void zapiszKrok() {   //dodaje aktualne x i y do tablic hx i hy
  hx = append(hx, x);
  hy = append(hy, y);
}

void rysujSlad() {    //rysuje punkty w zapisanych lokalizacjach
  for(int i = 0; i < hx.length; i++) {
    point(hx[i], hy[i]);
  }
}

void rysuj() {     //rysujemy elipsę w miejscu x, y
  ellipse(x, y, 10, 10);
}
