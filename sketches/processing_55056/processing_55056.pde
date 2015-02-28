
/* 
 poniżej deklarujemy zmienne: podajemy rodzaj (int), nazwę (np. x)
 i przypisujemy każdej z nich wartość początkową (np = 50;)
 
 zmienne typu integer przechowują liczby całkowite
 
 zmienne zadeklarowane przed funkcją setup() są globalne, czyli dostępne w każdym fragmencie kodu, 
 dlatego możemy ich używać w funkcjach draw() i mousePressed()
 zmienne zadeklarowane pomiędzy nawiasami {} są lokalne, czyli dostępne tylko wewnątrz tych nawiasów
 */
boolean mod1 = true;
boolean mod2 = true;

float x = 50;                    //współrzędna pozioma naszej elipsy
float y = 50;                    //współrzędna pionowa naszej elipsy
float vx = 3;                    //"prędkość" w poziomie (zmiana położenia)
float vy = 3;                    //"prędkość" w pionie
  
float vxMax = 140;    //maksymalna prędkość pozioma piłki
float vyMax = 140;    //maksymalna prędkość pionowa piłki

float xR = 40;    //promień elipsy
float yR = 40;    //promień elipsy

float xRb = 40;    //bazowy promień elipsy - poziomy
float yRb = 40;    //bazowy promień elipsy - pionowy

float gc = 1.2;    //gumowatość piłki, określa wartość spłaszczenia
float tc = 0.95;    //tłumienie piłki, określa procentowy spadek prędkości
float dc = 4;      //dynamika piłki - określa szybkość piłki
float ic = 15;       //inteligencja piłki
float flattenc;    //przechowuje wartość spłaszczenia/wydłużenia promieni elipsy
float hc = 0.7;     //hamowanie piłki
float hcR = 80;    //zasięg hamowania piłki

color cc = color(255, 255, 255, 255), //kolor piłki
bc = color(0, 0, 0, 255);               //kolor tła          

//PFont curier;

void setup() {                  // blok kodu w nawiasach {} po void setup() jest wykonywany tylko raz, na początku
  size(550, 550);              // funkcja size() ustala wysokość i szerokość okna szkicu
  smooth();                    // funkcja smooth() włącza anty-aliasing, czyli wygładzanie
  frameRate(29);               // funkcja frameRate() ustala ilość klatek na sekundę

  //curier = loadFont("Courier-48.vlw");
  //textFont(curier,20);
}


// blok kodu w nawiasach {} po void draw() jest wykonywany co klatkę
void draw() 
{
  if (abs(vx) >= vxMax)           //zmiana prędkości w zależności od położenia myszki
    vx = tc*vx;                   //o ile nie przekroczona została prędkość maksymalna
  else
    vx = tc*(vx + (mouseX-x)/dc); 

  if (abs(vy) >= vyMax)
    vy = tc*vy;
  else  
    vy = tc*(vy + (mouseY-y)/dc);

  if (sqrt(vx*vx+vy*vy) < vxMax+vyMax && mod1 == true) {

    if(mouseX - x != 0) {
      float alfa = atan(abs(mouseY - y)/abs(mouseX - x));
      float vxIc = ic*cos(alfa)*abs(mouseX - x)/width;
      float vyIc = ic*sin(alfa)*abs(mouseY - y)/height;
      if(mouseX - x > 0)
        vx = vx + vxIc;
      else
        vx = vx - vxIc;
      if(mouseY - y > 0)
        vy = vy + vyIc;
      else
        vy = vy - vyIc;
        
    }
  }

 if (dist(mouseX,mouseY,x,y)<hcR && mod2 == true)
 {
    vx = hc*vx;
    vy = hc*vy;
 }
 
  x = x + vx;                     // zmieniamy położenie x o wartość zmiennej vx
  y = y + vy;                     // zmieniamy położenie y o wartość zmiennej vy

    //yR = yRb*(0.4 + 0.6*(1-vx/vxMax));
  //xR = xRb*(0.4 + 0.6*(1-vy/vyMax));
  //if(vx-vy<0)
  //  xR = xRb*(1-0.5*(2*abs(vy)/vyMax));
  //else
  //  yR = yRb*(1-0.5*(2*abs(vx)/vxMax));

  if (x >= width - xR/2) {         // jeśli środek elipsy zbliży się do lewej krawędzi na połowę promienia elipsy
    vx = -abs(vx);     
    cc = color(red(cc)+25, green(cc)-15, blue(cc)-15); //zmiana koloru piłki
    x = width - xR/2;                                  //skorygowanie położenia elipsy
  }
  // zmieniamy wartość vx na ujemną (abs() - wartość bezwzględna)
  if (y >= height - yR/2) {         // analogicznie - gdy zbliży się do dołu
    vy = -abs(vy);
    cc = color(red(cc)-15, green(cc)+25, blue(cc)-15);
    y = height - yR/2;
  }

  if (x <= xR/2) {          // analogicznie - gdy zbliży się do prawej
    vx = abs(vx);
    cc = color(red(cc)-15, green(cc)-15, blue(cc)+25);
    x = xR/2;
  }
  if (y <= yR/2) {             // analogicznie - gdy zbliży się do lewej
    vy = abs(vy);
    cc = color(red(cc)+30, green(cc)+30, blue(cc)+30);
    y = yR/2;
  }

  noStroke();
  fill(bc);
  rect(0, 0, width, height);
  fill(cc);                   // funkcja fill() ustala kolor wypełnienia

  translate(x, y);            //przesuwamy układ współrzędnych do środka elipsy
  if (vx != 0)                //dokonujemy obrotu elipsy dla prędkości poziomej różnej od zera
    rotate(atan(vy/vx));      //obracamy o kąt tworzony przez wypadkową prędkości
  flattenc = gc*sqrt(vx*vx+vy*vy)/(vxMax+vyMax); //wyliczamy spłaszczenie elipsy w zależności od wypadkowej prędkości przyrównanej do sumy prędkości maksymalnych
  xR=xRb*(1+flattenc);        //odpowiednio zwiększamy podłużną oś elipsy
  yR=yRb*(1-flattenc);        //odpowiednio zmniejszamy podłużną oś elipsy
  ellipse(0, 0, xR, yR);       // funkcja ellipse(x, y, rx, ry) rysuje elipsę
  if (vx != 0)                //obracamy spowrotem
    rotate(-atan(vy/vx));
  translate(-x, -y);          //przesuwamy spowrotem
  //textSize(10);
  //text("("+nfs(vx,0,2)+", "+nfs(vy,0,2)+") ("+int(x)+", "+int(y)+")"+ "A: "+nfs(atan(vy/vx),0,3), 25, 25);
}

// blok kodu w nawiasach {} po void mousePressed() jest wykonywany po wciśnięciu myszki
void mousePressed() {
  x = mouseX;                  // ustalamy wartość x na mouseX - położenie myszy w poziomie
  y = mouseY;                  // ustalamy wartość y na mouseY - położenie myszy w pionie
  vx=0;    //zerujemy prędkość poziomą
  vy=0;    //zerujemy prędkość pionową
  xR = xRb;//ustalamy promień poziomy
  yR = yRb;//i pionowy na wartości początkowe
}


