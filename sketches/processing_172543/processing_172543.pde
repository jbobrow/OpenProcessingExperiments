
//By MelJeo(mx)
float r;
float g;
float b;
float a;
float diam;
float x;
float y;
int o = 1;
//Fondo y tamaño de sketch.
void setup(){
  
  size(600, 600);
  background(o+#9CDAFA);
  
}
//valor a las flotantes, random y color.

void draw(){
   r=random(100);
g=random(100);
b=random(100);
a=random(250);
diam=random(15);
x= random(width);
y= random(height);
println();
stroke(0);
fill(r, g, b, a);
ellipse(x, y, diam, diam); 
}





