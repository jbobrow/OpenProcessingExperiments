
void setup() {
size(500, 500);
background(255);
}
 
int REK = 0;
 
void draw() {
background(); //
func(250, 250, 250, 333, 0, REK, 170, 0, 4, 1.75); // rysuj drzewko. x, y korzenia. x, y korony, 0, 
func(250, 250, 250, 167, 0, REK, 170, 0, 4, 1.75);
func(250, 250, 333, 250, 0, REK, 170, 0, 4, 1.75);
func(250, 250, 167, 250, 0, REK, 170, 0, 4, 1.75);
}
 
void func(float x1, float y1, float x2, float y2, int i, int n, int R, int G, int B, float grub)
{
strokeWeight(grub);
stroke(R, G, B);
line(x1, y1, x2, y2);  // narysuj galazke

 
if(i<n) // sprawdz glebokosc
{
float alfa = atan2(y2-y1, x2- x1); // Policz kat nachylenia wzgledem OX
 
float r = sqrt( (x2- x1)*(x2 - x1) + (y2 - y1)*(y2 - y1) )*sqrt(2)/2; // nowy promien
 

float cx = x2+ r * cos(alfa-PI/4.0); // odchylenie od starego
float cy = y2+ r * sin(alfa-PI/4.0);

float dx = x2+ r * cos(alfa +PI/4.0); // tutaj w druga strone
float dy = y2 + r * sin(alfa +PI/4.0);
 
 
func(x2, y2, cx, cy, i+1, n, R+25, G+25, B+25, 0.90*grub); // Rysuj galazke
func(x2, y2, dx, dy, i+1, n, R+25, G+25, B+25, 0.90*grub);
}
 
}
 
void mouseReleased()
{
if(mouseButton ==LEFT) REK++;
if(mouseButton == RIGHT) REK--;
}
