

void setup() {  
  size(500, 500);
  background(255); 
}

int REK = 0;

void draw() {  
  background(); // Wyczyść ekran
  func(250, 500, 250, mouseY, 0, REK ); // Rysuj drzewko. X, y korzenia. X, y korony, 0, głębokość
}

void func(float x1, float y1, float x2, float y2, int i, int n)
{
    line(x1, y1, x2, y2); // narysuj gałązkę

    if(i<n) // sprawdź jak głęboko
    {
        float alfa = atan2(y2-y1, x2- x1); // Policz kąt nachylenia gałązki względem OX
       
        float r = sqrt( (x2- x1)*(x2 - x1) + (y2 - y1)*(y2 - y1) )/2.0;// promień nowej gałązki

        // koniec noowej gałązki A
        float cx = x2+ r * cos(alfa-PI/4.0);   // odchylenie od starego kątu o PI/4
        float cy = y2+ r * sin(alfa-PI/4.0);
        
        // koniec nowej gałązki B
        float dx = x2+ r * cos(alfa +PI/4.0); // tutaj w druga stronę
        float dy = y2 + r * sin(alfa +PI/4.0);
        
       
        func(x2, y2, cx, cy, i+1, n); // Rysuj gałązkę A
        func(x2, y2, dx, dy, i+1, n); // Rysuj gałązkę B
    }
    
}

void mouseReleased()
{
    // lewy myszki - rysuj więcej, prawy - rysuj mniej
    if(mouseButton ==LEFT) REK++;
    if(mouseButton == RIGHT) REK--;
}


