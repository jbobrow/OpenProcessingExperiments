
//first color
int r1=255, g1=248, b1=0;
//second color
int r2=170, g2=0, b2=188;

int color1, color2, combinacion;
int a=299, b=587, c=114;

void setup() {

  background(r1, g1, b1);
  textSize(32);
  fill(r2, g2, b2);
  text("word", 10, 60);
  r1=r1*a;
  g1=g1*b;
  b1=b1*c;
  r2=r2*a;
  g2=g2*b;
  b2=b2*c;

  color1=((r1+g1+b1)/1000);
  color2=((r2+g2+b2)/1000);
  println(color1+" brillo color 1");
  println(color2+" brillo color 2");
  combinacion=(abs((color1)-(color2)));
  if (combinacion>125) {
    println((combinacion)+" good brightness contrast");
  }
  else {
    println((combinacion)+" bad brightness contrast");
  }
}
