
void setup() {
size(500,500);
background(250);
}
   
int REK = 0;
   
void draw() {
background(); 
func(250, 250, 250, 333, 0, REK, 6, 0, 89);
func(250, 250, 250, 167, 0, REK, 6, 0, 89);
func(250, 250, 333, 250, 0, REK, 6, 0, 89);
func(250, 250, 167, 250, 0, REK, 6, 0, 89);
}
   
void func(float x1, float y1, float x2, float y2, int i, int n, int R, int G, int B)
{
stroke(R, G, B);
line(x1, y1, x2, y2);
   
if(i<n)
{
float alfa = atan2(y2-y1, x2- x1);
   
float r = sqrt( (x2- x1)*(x2 - x1) + (y2 - y1)*(y2 - y1) )*sqrt(2)/2;
   

float cx = x2+ r * cos(alfa-PI/4.0 - mouseY/500 * PI * 2);
float cy = y2+ r * sin(alfa-PI/4.0 - mouseY/500 * PI * 2);
   
float dx = x2+ r * cos(alfa +PI/4.0 + mouseX/500 * PI * 2);
float dy = y2 + r * sin(alfa +PI/4.0+ mouseX/500 * PI * 2);
   
   
func(x2, y2, cx, cy, i+1, n, R+mouseY/13, G+mouseX/12, B);
func(x2, y2, dx, dy, i+1, n, R+mouseY/13, G+mouseX/12, B);
}
   
}
   
void mouseReleased()
{
if(mouseButton ==LEFT) REK++;
if(mouseButton == RIGHT) REK--;
}
