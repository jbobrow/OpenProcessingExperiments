
int a=0;
int b=100;
int c=400;
int d=100;
PImage foto;

void setup() {
  size(800, 600);  
 background(0);  
 foto = loadImage ("foto1.jpg");
}
void draw (){
 // image (foto,a,c,d,c);
  image (foto, b,d, a, c);
//  image (foto,a,b,d,c);
//  image (foto,d, b,c,c);
  a=a+1;

}

