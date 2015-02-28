

int a= 200;
int b= 600;
int c= 200;

void setup () {
  size(900,800);
  background (175);
}
void draw() {
ellipse(a,a,c,c);fill (c,100,a);
ellipse(b,a,c,c); 
ellipse(a,b,c,c);fill (b,100,0);
ellipse(b,b,c,c);
c= c +1;
b= c + 6;
b= b * 2;
a= a * 2 ;


}


