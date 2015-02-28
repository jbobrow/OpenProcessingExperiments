
/* 
poniżej deklarujemy zmienne: podajemy rodzaj (int), nazwę (np. x)
i przypisujemy każdej z nich wartość początkową (np = 50;)

zmienne typu integer przechowują liczby całkowite

zmienne zadeklarowane przed funkcją setup() są globalne, czyli dostępne w każdym fragmencie kodu, 
dlatego możemy ich używać w funkcjach draw() i mousePressed()
zmienne zadeklarowane pomiędzy nawiasami {} są lokalne, czyli dostępne tylko wewnątrz tych nawiasów
*/ 

int x = 50;                    //współrzędna pozioma naszej elipsy
int y = 50;                    //współrzędna pionowa naszej elipsy
int vx = 3;                    //"prędkość" w poziomie (zmiana położenia)
int vy = 3;                    //"prędkość" w pionie

                               // blok kodu w nawiasach {} po void setup() jest wykonywany tylko raz, na początku
void setup() {
  size(500, 500);              // funkcja size() ustala wysokość i szerokość okna szkicu
  smooth();                    // funkcja smooth() włącza anty-aliasing, czyli wygładzanie
  frameRate(24);               // funkcja frameRate() ustala ilość klatek na sekundę
}


                               // blok kodu w nawiasach {} po void draw() jest wykonywany co klatkę
void draw() {
  background(0);               // funkcja background() ustala kolor tła
  
  fill(255);                   // funkcja fill() ustala kolor wypełnienia
  ellipse(x, y, 50, 50);       // funkcja ellipse(x, y, rx, ry) rysuje elipsę
  
  x += vx;                     // zmieniamy położenie x o wartość zmiennej vx
  y += vy;                     // zmieniamy położenie y o wartość zmiennej vy
  
  if(x >= width - 25)          // jeśli środek elipsy zbliży się do lewej krawędzi na 25 pikseli
    vx = -abs(vx);             // zmieniamy wartość vx na ujemną (abs() - wartość bezwzględna)
  if(y >= height - 25)         // analogicznie - gdy zbliży się do dołu
    vy = -abs(vy);
  if(x <= 25)                  // analogicznie - gdy zbliży się do prawej
    vx = abs(vx);
  if(y <= 25)                  // analogicznie - gdy zbliży się do lewej
    vy = abs(vy);
}

                               // blok kodu w nawiasach {} po void mousePressed() jest wykonywany po wciśnięciu myszki
void mousePressed() {
  x = mouseX;                  // ustalamy wartość x na mouseX - położenie myszy w poziomie
  y = mouseY;                  // ustalamy wartość y na mouseY - położenie myszy w pionie
}

