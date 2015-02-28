
size(200,200);
background(0);
int incremento = 10;
colorMode(HSB);
int matiz = 0;
smooth();

for(int i = 0; i < width; i = i + incremento){
  matiz += 20;
  matiz %= 255;
  stroke(matiz,255,255);
  line(i,0,width,i);
  line(0,i,i,height);
}



