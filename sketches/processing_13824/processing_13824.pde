
int counter;

int counter;

void setup(){
  size(400, 400);
  background(0);
}
 
float i;
float a = 0.0;
void draw() {
   for (int i = 0; i < 100; i = i+60) {
  background(0);
  a = (a + 0.5)%250;}
 //눈
fill (255);
ellipse (120, 200, i, a);
ellipse (250, 200, i, a);
fill (0);
ellipse (150, 220, 30, 30);
ellipse (250, 220, 30, 30);

}
   
                
