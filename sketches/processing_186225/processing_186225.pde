
float gato= 1;
void setup() {
size (600,600);
}
void draw(){ background( 2,gato,100);
gato=gato * 1.01;
ellipse (gato,300,10,10);
}
