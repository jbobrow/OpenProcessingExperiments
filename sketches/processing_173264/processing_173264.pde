
void setup() {
size(500, 500);
background(255);
}
 
int REK = 0;
 
void draw() {
background();
func(250, 500, 500, 3*1.57, 0, REK, 0, 100, 50);
func
}
 
void func(float Sx, float Sy, float r, float m, int i, int n, int R, int G, int B)
{
strokeWeight(3);
stroke(R,G,B);
noFill();
arc(Sx, Sy, r, r, m, m+1.57);  // narysuj galazke



if(i<n) // sprawdz glebokosc
{

float r1=(mouseX/500)*r;

float Sx1=Sx+(1/2)*(r-r1)*(cos(m));
float Sy1=Sy+(1/2)*(r-r1)*(sin(m));

float Sx2=Sx+(1/2)*(r+r1)*(cos(m));
float Sy2=Sy+(1/2)*(r+r1)*(sin(m));
 
 
func(Sx1, Sy1, r1, m+3*1.57, i+1, n, R+30, G+30, B); // Rysuj galazke
func2(Sx2, Sy2, r1, m+3.14, i+1, n, R+30, G+30, B);

}
}

void func2
(float Sx, float Sy, float r, float m, int i, int n, int R, int G, int B)
{

stroke(R,G,B);
noFill();
arc(Sx, Sy, r, r, m, m+1.57);  // narysuj galazke



if(i<n) // sprawdz glebokosc
{

float r1=(mouseY/500)*r;

float Sx1=Sx+(1/2)*(r-r1)*(cos(m+HALF_PI));
float Sy1=Sy+(1/2)*(r-r1)*(sin(m+HALF_PI));

float Sx2=Sx+(1/2)*(r+r1)*(cos(m+HALF_PI));
float Sy2=Sy+(1/2)*(r+r1)*(sin(m+HALF_PI));
 
 
func2(Sx1, Sy1, r1, m+1.57, i+1, n, R+30, G+30, B); // Rysuj galazke
func(Sx2, Sy2, r1, m+3.14, i+1, n, R+30, G+30, B);

}
}



 
void mouseReleased()
{
if(mouseButton ==LEFT) REK++;
if(mouseButton == RIGHT) REK--;
}
