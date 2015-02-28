
int a=0;
int b=300;
int c=500;
PImage foto;

void setup() {
  size(800, 600);  
 background(0);  
 foto = loadImage ("foto1.jpg");
}
void draw (){
  image (foto, a,a,c,c);
  image (foto, b, a, c,c);
  image (foto,a,b,c,c);
  image (foto,b, b,c,c);
  a=a+1;

}

