
int counter;

float angle= 0.0;
float offset= 100;
float scalar= 30;
float incremento= 4;
float noiseval;
float xpos;
float s =30;


void setup(){
  size(800, 600);
  background(0);
  noiseval=2;
  xpos = 18;

}

void draw(){
  noiseval+=0.5;
  xpos++;
   ellipse(xpos, sin(noiseval)*400+400, noise(noiseval)*5, noise(noiseval)*5);
   
   float x = scalar + cos(scalar) *s;
   float y = scalar + sin(scalar) * s;
    ellipse (x -130, y -130, 20,20);
    fill(255, 237, 0, 1);
    scalar+=0.09;
    scalar += incremento;
    
   float k = offset + cos(scalar) *s;
   float l = offset + sin(scalar) * s;
    ellipse (k -100, l - 100, 50, 50);
    fill(255, 237, 0, 1);
    s+=9.9;
    scalar += incremento;

  float m= scalar + cos(angle) * offset; 
  float n= scalar + tan(angle) * offset;
   triangle(m +300, n +500, 400, 250, 400, 430);
   stroke(230, 0, 100, 1);
   fill(230, 0, 100, 10);
   scalar--;
  
  float o= offset + sin(angle) * offset; 
  float p= offset + tan(angle) * offset;
   triangle(o +500, p +375, 400, 250, 400, 430);
   stroke(255, 237, 0, 1);
   fill(255, 237, 0, 15);
   offset--;
  
  angle += incremento;
}
