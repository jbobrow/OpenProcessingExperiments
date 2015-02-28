
float[] angulos = new float[30];
int radio = 0;
int radio2;
float x,y;
int r,g,b,mode,dx,dy;
void setup() {
size(400,300);
generate();
}
void draw() {
  background(0);
  noStroke();
if (radio<50)
{radio++;}
else
{radio=0;
generate();
}


for (int j=0;j<30;j++){
  if (radio<45){
  fill(color(r,g,b));
}
  else{
fill(color(r-100,g-100,b-100));
  }
  if (mode==2){
  dx+=int(random(-2,2));
  dy+=int(random(-2,2));}
  ellipse(x+dx+(radio * 3 * cos(angulos[j])),y+dy+(radio * 3 * sin(angulos[j])),10,10);
if (radio>4)
radio2=radio-3;
else
radio2=0;
fill(color(r-100,g-100,b-100));
ellipse(x+dx+(radio2 * 3 * cos(angulos[j])),y+dy+(radio2 * 3 * sin(angulos[j])),7,7);
}
delay(10);
}

void generate(){
  x=50+random(150);
  y=30+random(120);
  r=int(100+random(155));
  g=int(100+random(155));
  b=int(100+random(155));
  mode=int(random(4)+1);
  dx=0;dy=0;
  for (int i=0;i<30;i++){
angulos[i]=random(360);  
}
delay(90);
}

