
float[] angulos = new float[100];
float[] velocidades = new float[100];
int radio = 0;
int radio2;
float x,y;
int r,g,b,mode,dx,dy;
void setup() {
size(600,400);
generate();
}
void draw() {
  background(0);
  noStroke();
if (radio<100)
{radio++;}
else
{radio=0;
generate();
}


if (radio<5)
{//subimos cohete

}
else
{//explotamos cohete

for (int j=0;j<60;j++){
  if (radio<75){
  fill(color(r,g,b));
}
  else{
fill(color(r-100,g-100,b-100));
  }

  ellipse(x+(radio*velocidades[j] * cos(angulos[j])),y+radio*velocidades[j] * sin(angulos[j]),8,8);
if (radio>4)
radio2=radio-3;
else
radio2=0;
fill(color(r-100,g-100,b-100));
ellipse(x+(velocidades[j]*radio  * cos(angulos[j])),y+velocidades[j]*radio * sin(angulos[j]),5,5);
}
delay(10);

}

}

void generate(){
  x=50+random(150);
  y=30+random(120);
  r=int(100+random(155));
  g=int(100+random(155));
  b=int(100+random(155));
  mode=int(random(4)+1);
  for (int i=0;i<100;i++){
angulos[i]=random(360); 
velocidades[i]=random(2)+1;
}
delay(90);
}
