
float x;            //deklaracja zmiennych - nie mają jeszcze wartości!
float y;

void setup() {      //setup - blok kodu wykonywany na początku programu
  size(600, 400);   //wielkość okna
             
  x = width/2;      //inicjalizacja zmiennych x i y w połowie okna
  y = height/2;
}

void draw() {       //draw - blok kodu wykonywany co klatkę
  background(255);  //czyszczenie ekranu - kolor biały
  zrobKrok();
  rysuj();
}


void zrobKrok() {   //zmieniamy x i y, dodając losową liczbę między -1.5 a 1.5
  x += random(3) - 1.5; //krok w poziomie
  y += random(3) - 1.5; //krok w pionie
}

void rysuj() {     //rysujemy elipsę w miejscu x, y
  ellipse(x, y, 10, 10);
}
