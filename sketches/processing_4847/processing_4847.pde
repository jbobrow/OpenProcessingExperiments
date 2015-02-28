
size(400,400);

colorMode(HSB);
int matiz = 0;
smooth();

for(int diametro = width-20; diametro > 0; diametro -= 50 ){ 
  matiz+=15;
  fill(matiz,255,255);
  ellipse(width/2,height/2,diametro,diametro);
}


